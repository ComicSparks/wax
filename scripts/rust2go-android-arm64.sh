cd "$( cd "$( dirname "$0"  )" && pwd  )/.."

rust2go-cli --src wast/src/tool.rs --dst go/rust/tool.go
gsed -i 's/package main/package rust/g' go/rust/tool.go
cd wast
cargo ndk -o ../android/app/src/main/jniLibs -t arm64-v8a build
