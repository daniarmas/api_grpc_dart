import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<Either<GrpcError, User>> getUser(
      {required PostgreSQLExecutionContext context,
      required HeadersMetadata metadata,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      if (data['email'] == null) {
        return Left(GrpcError.invalidArgument('Input `email` invalid'));
      } else {
        final response = await userLocalDataSource.getUser(
            data: data, paths: paths, context: context);
        if (response != null) {
          return Right(response);
        }
        return Left(GrpcError.notFound('Not found'));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
