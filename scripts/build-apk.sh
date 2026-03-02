# 构建包含多架构的通用 APK

cd "$( cd "$( dirname "$0"  )" && pwd  )/.."

cd go/mobile
gomobile init
gomobile bind -androidapi 21 -target=android/arm,android/arm64,android/amd64 -o lib/Mobile.aar ./

cd ../..
flutter build apk --target-platform android-arm,android-arm64,android-x64
