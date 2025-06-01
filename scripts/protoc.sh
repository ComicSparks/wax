
# go install go install github.com/golang/protobuf/protoc-gen-go@1.5.2

# dart pub global activate protoc_plugin@21.1.2
# export PATH="$PATH":"$HOME/.pub-cache/bin"

#protoc --go_out=go/ protos/*.proto
#protoc --dart_out=lib/  protos/*.proto

protoc --dart_out=lib/ --go_out=go/ protos/*.proto
