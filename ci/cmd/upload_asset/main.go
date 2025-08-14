package main

import (
	"ci/commons"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"strings"
)

func main() {
	// get ghToken
	ghToken := os.Getenv("GH_TOKEN")
	if ghToken == "" {
		println("Env ${GH_TOKEN} is not set")
		os.Exit(1)
	}
	// get version
	version := commons.LoadVersion()
	// get target
	target := os.Getenv("TARGET")
	if target == "" {
		println("Env ${TARGET} is not set")
		os.Exit(1)
	}
	// get target
	flutterVersion := os.Getenv("flutter_version")
	if target == "" {
		println("Env ${flutter_version} is not set")
		os.Exit(1)
	}
	//
	var releaseFileName string
	switch target {
	case "macos":
		releaseFileName = fmt.Sprintf("wax-%v-macos-intel.dmg", version.Code)
	case "ios":
		releaseFileName = fmt.Sprintf("wax-%v-ios-nosign.ipa", version.Code)
	case "windows":
		releaseFileName = fmt.Sprintf("wax-%v-windows-x86_64.zip", version.Code)
	case "linux":
		releaseFileName = fmt.Sprintf("wax-%v-linux-x86_64.AppImage", version.Code)
	case "android-arm32":
		releaseFileName = fmt.Sprintf("wax-%v-android-arm32.apk", version.Code)
	case "android-arm64":
		releaseFileName = fmt.Sprintf("wax-%v-android-arm64.apk", version.Code)
	case "android-x86_64":
		releaseFileName = fmt.Sprintf("wax-%v-android-x86_64.apk", version.Code)
	}
	if strings.HasPrefix(flutterVersion, "2.") {
		releaseFileName = "z-of-" + releaseFileName
	}
	//
	var releaseFilePath string
	var contentType string
	var contentLength int64
	switch target {
	case "macos":
		releaseFilePath = "build/build.dmg"
		contentType = "application/octet-stream"
	case "ios":
		releaseFilePath = "build/nosign.ipa"
		contentType = "application/octet-stream"
	case "windows":
		releaseFilePath = "build/build.zip"
		contentType = "application/octet-stream"
	case "linux":
		releaseFilePath = "build/build.AppImage"
		contentType = "application/octet-stream"
	case "android-arm32":
		releaseFilePath = "build/app/outputs/flutter-apk/app-release.apk"
		contentType = "application/octet-stream"
	case "android-arm64":
		releaseFilePath = "build/app/outputs/flutter-apk/app-release.apk"
		contentType = "application/octet-stream"
	case "android-x86_64":
		releaseFilePath = "build/app/outputs/flutter-apk/app-release.apk"
		contentType = "application/octet-stream"
	}
	releaseFilePath = path.Join("..", releaseFilePath)
	info, err := os.Stat(releaseFilePath)
	if err != nil {
		panic(err)
	}
	contentLength = info.Size()
	// get version
	githubRepository := os.Getenv("GITHUB_REPOSITORY")
	if githubRepository == "" {
		println("Env ${GITHUB_REPOSITORY} is not set")
		os.Exit(1)
	}
	getReleaseRequest, err := http.NewRequest(
		"GET",
		fmt.Sprintf("https://api.github.com/repos/%v/releases/tags/%v", githubRepository, version.Code),
		nil,
	)
	if err != nil {
		panic(err)
	}
	getReleaseRequest.Header.Set("User-Agent", commons.Ua)
	getReleaseRequest.Header.Set("Authorization", "token "+ghToken)
	getReleaseResponse, err := http.DefaultClient.Do(getReleaseRequest)
	if err != nil {
		panic(err)
	}
	defer getReleaseResponse.Body.Close()
	if getReleaseResponse.StatusCode == 404 {
		panic("NOT FOUND RELEASE")
	}
	buff, err := ioutil.ReadAll(getReleaseResponse.Body)
	if err != nil {
		panic(err)
	}
	var release commons.Release
	err = json.Unmarshal(buff, &release)
	if err != nil {
		println(string(buff))
		panic(err)
	}
	file, err := os.Open(releaseFilePath)
	if err != nil {
		panic(err)
	}
	defer file.Close()
	uploadUrl := fmt.Sprintf("https://uploads.github.com/repos/%v/releases/%v/assets?name=%v", githubRepository, release.Id, releaseFileName)
	uploadRequest, err := http.NewRequest("POST", uploadUrl, file)
	if err != nil {
		panic(err)
	}
	uploadRequest.Header.Set("User-Agent", commons.Ua)
	uploadRequest.Header.Set("Authorization", "token "+ghToken)
	uploadRequest.Header.Set("Content-Type", contentType)
	uploadRequest.ContentLength = contentLength
	uploadResponse, err := http.DefaultClient.Do(uploadRequest)
	if err != nil {
		panic(err)
	}
	if uploadResponse.StatusCode != 201 {
		buff, err = ioutil.ReadAll(uploadResponse.Body)
		if err != nil {
			panic(err)
		}
		println(string(buff))
		panic("NOT 201")
	}
}
