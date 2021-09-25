#!/usr/bin/env bash
protoc -I ./ protos/* --dart_out=grpc:lib/protos
protoc -I /usr/local/opt/protobuf@3.17/include/ /usr/local/opt/protobuf@3.17/include/google/protobuf/timestamp.proto --dart_out=grpc:lib/protos
protoc -I /usr/local/opt/protobuf@3.17/include/ /usr/local/opt/protobuf@3.17/include/google/protobuf/any.proto --dart_out=grpc:lib/protos
protoc -I /usr/local/opt/protobuf@3.17/include/ /usr/local/opt/protobuf@3.17/include/google/protobuf/empty.proto --dart_out=grpc:lib/protos
protoc -I /usr/local/opt/protobuf@3.17/include/ /usr/local/opt/protobuf@3.17/include/google/protobuf/field_mask.proto --dart_out=grpc:lib/protos
dart run build_runner build