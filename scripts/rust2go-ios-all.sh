cd "$( cd "$( dirname "$0"  )" && pwd  )/.."

rust2go-cli --src wast/src/tool.rs --dst go/rust/tool.go
gsed -i 's/package main/package rust/g' go/rust/tool.go

cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=aarch64-apple-ios
cp wast/target/aarch64-apple-ios/release/libwast.a ios/libwast.a

cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=x86_64-apple-ios
cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=aarch64-apple-ios-sim
lipo -create -output ios/libwast.a  wast/target/x86_64-apple-ios/release/libwast.a wast/target/aarch64-apple-ios-sim/release/libwast.a


