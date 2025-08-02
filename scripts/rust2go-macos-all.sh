cd "$( cd "$( dirname "$0"  )" && pwd  )/.."

rust2go-cli --src wast/src/tool.rs --dst go/rust/tool.go
gsed -i 's/package main/package rust/g' go/rust/tool.go

cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=x86_64-apple-darwin
cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=aarch64-apple-darwin
lipo -create -output macos/libwast.a wast/target/x86_64-apple-darwin/release/libwast.a  wast/target/aarch64-apple-darwin/release/libwast.a
