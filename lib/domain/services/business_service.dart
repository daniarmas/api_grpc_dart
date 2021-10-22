import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/authentication_repository.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import 'package:api_grpc_dart/domain/repositories/user_repository.dart';
import 'package:api_grpc_dart/domain/repositories/verification_code_repository.dart';
import 'package:api_grpc_dart/protos/google/protobuf/empty.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class BusinessService extends BusinessServiceBase {
  Database database = GetIt.I<Database>();

  @override
  Future<GetBusinessResponse> getBusiness(
      ServiceCall call, GetBusinessRequest request) async {
    try {
      late GetBusinessResponse response;
      BusinessRepository businessRepository = GetIt.I<BusinessRepository>();
      late Either<GrpcError, GetBusinessResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await businessRepository.getBusiness(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: request.fieldMask.paths,
            context: context);
      });
      result.fold((left) => {throw left}, (right) => {response = right});
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<FeedResponse> feed(ServiceCall call, FeedRequest request) async {
    try {
      late FeedResponse response;
      BusinessRepository businessRepository = GetIt.I<BusinessRepository>();
      late Either<GrpcError, FeedResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await businessRepository.feed(
          metadata: HeadersMetadata.fromServiceCall(call),
          paths: request.fieldMask.paths,
          context: context,
          data: getRequestData(request),
        );
      });
      result.fold((left) => {throw left}, (right) => {response = right});
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }
}
