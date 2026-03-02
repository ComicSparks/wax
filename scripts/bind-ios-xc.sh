#!/bin/bash

cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=aarch64-apple-ios &&\
cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=aarch64-apple-ios-sim &&\
cargo build --manifest-path wast/Cargo.toml --features= --lib --release --target=x86_64-apple-ios

mkdir -p ios/out
mkdir -p ios/include

# --

lipo -create \
  -output ios/out/libwast_sim.a \
  wast/target/aarch64-apple-ios-sim/release/libwast.a \
  wast/target/x86_64-apple-ios/release/libwast.a

xcodebuild -create-xcframework \
  -library wast/target/aarch64-apple-ios/release/libwast.a -headers ios/include \
  -library ios/out/libwast_sim.a -headers ios/include \
  -output ios/out/libwast.xcframework

# -- 

lipo -create \
  -output ios/out/libwast_sim.dylib \
  wast/target/aarch64-apple-ios-sim/release/libwast.dylib \
  wast/target/x86_64-apple-ios/release/libwast.dylib

xcodebuild -create-xcframework \
  -library wast/target/aarch64-apple-ios/release/libwast.dylib -headers ios/include \
  -library ios/out/libwast_sim.dylib -headers ios/include \
  -output ios/out/libwast.xcframework
