import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class UserService extends UserServiceBase {
  Database database = GetIt.I<Database>();
  UserRepository userRepository = GetIt.I<UserRepository>();

  @override
  Future<UpdateUserResponse> updateUser(
      ServiceCall call, UpdateUserRequest request) async {
    try {
      late UpdateUserResponse response;
      late Either<GrpcError, UpdateUserResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await userRepository.updateUser(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: getPaths(request.fieldMask.paths),
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
}
