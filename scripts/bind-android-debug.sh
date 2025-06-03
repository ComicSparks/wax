# 编译所有架构的依赖

cd "$( cd "$( dirname "$0"  )" && pwd  )/.."

cd go/mobile
gomobile init
gomobile bind -androidapi 21 -target=android/arm,android/arm64,android/386,android/amd64 -o lib/Mobile.aar ./
