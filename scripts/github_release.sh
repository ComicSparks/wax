#!/usr/bin/env bash
set -euo pipefail

if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "GITHUB_TOKEN is not set" >&2
  exit 1
fi
if [ -z "${GITHUB_REPOSITORY:-}" ]; then
  echo "GITHUB_REPOSITORY is not set" >&2
  exit 1
fi

version_name="$(sed -n 's/^version:[[:space:]]*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/p' pubspec.yaml | head -n 1)"
if [ -z "$version_name" ]; then
  echo "pubspec.yaml version not found" >&2
  exit 1
fi
tag="v${version_name}"

auth=(-H "Authorization: Bearer ${GITHUB_TOKEN}" -H "Accept: application/vnd.github+json" -H "User-Agent: wax ci")
# Keep these next to the repo. Git Bash /tmp and Windows Python do not share one path.
release_json=".wax-release.json"
create_json=".wax-release-create.json"
upload_json=".wax-upload.json"

fetch_release() {
  curl -sS -o "$release_json" -w '%{http_code}' \
    "${auth[@]}" \
    "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/tags/${tag}"
}

asset_name() {
  case "$TARGET" in
    macos) echo "wax-${tag}-macos-intel.dmg" ;;
    ios) echo "wax-${tag}-ios-nosign.ipa" ;;
    windows) echo "wax-${tag}-windows-x86_64.zip" ;;
    linux) echo "wax-${tag}-linux-x86_64.AppImage" ;;
    android) echo "wax-${tag}-android.apk" ;;
    *)
      echo "unknown target: ${TARGET:-}" >&2
      exit 1
      ;;
  esac
}

asset_path() {
  case "$TARGET" in
    macos) echo "build/build.dmg" ;;
    ios) echo "build/nosign.ipa" ;;
    windows) echo "build/build.zip" ;;
    linux) echo "build/build.AppImage" ;;
    android) echo "build/app/outputs/flutter-apk/app-release.apk" ;;
  esac
}

check_release() {
  local status
  status="$(fetch_release)"
  if [ "$status" = "200" ]; then
    echo "release ${tag} already exists"
    exit 0
  fi
  if [ "$status" != "404" ]; then
    cat "$release_json" >&2
    echo "unexpected status ${status}" >&2
    exit 1
  fi
  local body branch
  branch="${GITHUB_REF_NAME:-master}"
  body="$(TAG_NAME="$tag" BRANCH_NAME="$branch" VERSION_INFO="$version_name" python3 - << 'PY'
import json, os
print(json.dumps({
    "tag_name": os.environ["TAG_NAME"],
    "target_commitish": os.environ["BRANCH_NAME"],
    "name": os.environ["TAG_NAME"],
    "body": os.environ["VERSION_INFO"],
}))
PY
)"
  local create_status
  create_status="$(curl -sS -o "$create_json" -w '%{http_code}' \
    -X POST "${auth[@]}" \
    -H "Content-Type: application/json" \
    -d "$body" \
    "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases")"
  if [ "$create_status" != "201" ]; then
    cat "$create_json" >&2
    echo "create release failed: ${create_status}" >&2
    exit 1
  fi
  echo "created release ${tag}"
}

check_asset() {
  if [ -z "${TARGET:-}" ]; then
    echo "TARGET is not set" >&2
    exit 1
  fi
  local status name
  status="$(fetch_release)"
  if [ "$status" = "404" ]; then
    echo "NOT FOUND RELEASE" >&2
    exit 1
  fi
  if [ "$status" != "200" ]; then
    cat "$release_json" >&2
    exit 1
  fi
  name="$(asset_name)"
  if ASSET_NAME="$name" RELEASE_JSON="$release_json" python3 - << 'PY'
import json, os, sys
data = json.load(open(os.environ["RELEASE_JSON"], encoding="utf-8"))
names = [asset.get("name") for asset in data.get("assets") or []]
sys.exit(0 if os.environ["ASSET_NAME"] in names else 1)
PY
  then
    echo "skip_build=true" >> "${GITHUB_OUTPUT}"
  else
    echo "skip_build=false" >> "${GITHUB_OUTPUT}"
  fi
}

upload_asset() {
  if [ -z "${TARGET:-}" ]; then
    echo "TARGET is not set" >&2
    exit 1
  fi
  local status path name release_id upload_status
  status="$(fetch_release)"
  if [ "$status" != "200" ]; then
    echo "NOT FOUND RELEASE" >&2
    cat "$release_json" >&2
    exit 1
  fi
  path="$(asset_path)"
  name="$(asset_name)"
  release_id="$(RELEASE_JSON="$release_json" python3 -c 'import json,os; print(json.load(open(os.environ["RELEASE_JSON"], encoding="utf-8"))["id"])')"
  upload_status="$(curl -sS -o "$upload_json" -w '%{http_code}' \
    -X POST "${auth[@]}" \
    -H "Content-Type: application/octet-stream" \
    --data-binary @"${path}" \
    "https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${release_id}/assets?name=${name}")"
  if [ "$upload_status" != "201" ]; then
    cat "$upload_json" >&2
    echo "upload failed: ${upload_status}" >&2
    exit 1
  fi
  echo "uploaded ${name}"
}

case "${1:-}" in
  check-release) check_release ;;
  check-asset) check_asset ;;
  upload-asset) upload_asset ;;
  *)
    echo "usage: $0 check-release|check-asset|upload-asset" >&2
    exit 1
    ;;
esac
