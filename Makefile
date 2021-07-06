.PHONY: generate
generate:
    protoc -I ./ grpc/* --dart_out=grpc:lib/src
    protoc -I /usr/local/opt/protobuf@3.17/include/ /usr/local/opt/protobuf@3.17/include/google/protobuf/timestamp.proto --dart_out=grpc:lib/src

.PHONY: run
run:
    dart run