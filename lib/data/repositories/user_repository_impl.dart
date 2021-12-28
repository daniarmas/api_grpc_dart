// Package imports:
import 'package:api_grpc_dart/protos/google/protobuf/empty.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/core/utils/username_generator.dart';
import 'package:api_grpc_dart/core/utils/validation.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/user_repository.dart';
import '../../protos/protos/main.pb.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final VerificationCodeLocalDataSource verificationCodeLocalDataSource;
  final UsernameGenerator generator;

  UserRepositoryImpl({
    required this.generator,
    required this.userLocalDataSource,
    required this.verificationCodeLocalDataSource,
  });

  @override
  Future<Either<GrpcError, User>> getUser({
    required PostgreSQLExecutionContext context,
    required HeadersMetadata metadata,
    required Map<String, dynamic> data,
    required List<Attribute> paths,
  }) async {
    try {
      if (data['email'] == null || !StringUtils.isEmail(data['email'])) {
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

  @override
  Future<Either<GrpcError, UserExistsStreamResponse>> userExistsStream(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata}) async {
    try {
      if (StringUtils.isAlias(data['alias']) &&
          Validation.alias(data['alias'])) {
        final response = await userLocalDataSource.getUser(
            paths: [NormalAttribute(name: 'alias')],
            context: context,
            data: data);
        return Right(UserExistsStreamResponse(
            isValid: (response == null) ? true : false));
      } else {
        return Left(GrpcError.invalidArgument('Input `alias` invalid'));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, UpdateUserResponse>> updateUser({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  }) async {
    try {
      if (data['id'] == '' || data['id'] == null) {
        return Left(GrpcError.invalidArgument('Input `id` invalid'));
      } else if (data['email'] != '' && data['email'] != null) {
        if (!StringUtils.isEmail(data['email'])) {
          return Left(GrpcError.invalidArgument('Input `email` invalid'));
        } else if (data['code'] == '' ||
            !StringUtils.isNumeric(data['code']) ||
            data['code'].length != 6) {
          return Left(GrpcError.invalidArgument('Input `code` invalid'));
        } else {
          final getVerificationCodeResponse =
              await verificationCodeLocalDataSource
                  .getVerificationCode(context: context, data: {
            'code': data['code'],
            'email': data['email'],
            'deviceId': metadata.deviceId,
            'type': 'CHANGE_USER_EMAIL',
          }, paths: [
            NormalAttribute(name: 'id'),
          ]);
          if (getVerificationCodeResponse == null) {
            return Left(
                GrpcError.invalidArgument('VerificationCode not found'));
          }
          final getUserResponse =
              await userLocalDataSource.getUser(context: context, data: {
            'email': data['email']
          }, paths: [
            NormalAttribute(name: 'id'),
          ]);
          if (getUserResponse != null) {
            return Left(GrpcError.alreadyExists('User already exists'));
          }
          await verificationCodeLocalDataSource.deleteVerificationCode(data: {
            'id': getVerificationCodeResponse.id,
          }, context: context);
          data.remove('code');
          data.remove('alias');
          data.remove('thumbnail');
          data.remove('thumbnailBlurHash');
          data.remove('highQualityPhoto');
          data.remove('highQualityPhotoBlurHash');
          data.remove('lowQualityPhoto');
          data.remove('lowQualityPhotoBlurHash');
          final response = await userLocalDataSource.updateUser(
            data: data,
            paths: paths,
            context: context,
          );
          if (response != null) {
            return Right(UpdateUserResponse(user: response));
          }
          return Left(GrpcError.notFound('Not found'));
        }
      } else if (data['alias'] != '' && data['alias'] != null) {
        if (!StringUtils.isAlias(data['alias']) ||
            !Validation.alias(data['alias'])) {
          return Left(GrpcError.invalidArgument('Input `alias` invalid'));
        } else {
          final getUserResponse =
              await userLocalDataSource.getUser(context: context, data: {
            'alias': data['alias'],
          }, paths: [
            NormalAttribute(name: 'id'),
          ]);
          if (getUserResponse != null) {
            return Left(GrpcError.alreadyExists('User already exists'));
          }
          data.remove('code');
          data.remove('email');
          data.remove('thumbnail');
          data.remove('thumbnailBlurHash');
          data.remove('highQualityPhoto');
          data.remove('highQualityPhotoBlurHash');
          data.remove('lowQualityPhoto');
          data.remove('lowQualityPhotoBlurHash');
          final response = await userLocalDataSource.updateUser(
            data: data,
            paths: paths,
            context: context,
          );
          if (response != null) {
            return Right(UpdateUserResponse(user: response));
          }
          return Left(GrpcError.notFound('Not found'));
        }
      } else if ((data['thumbnail'] != '' && data['thumbnail'] != null) ||
          (data['thumbnailBlurHash'] != '' &&
              data['thumbnailBlurHash'] != null) ||
          (data['highQualityPhoto'] != '' &&
              data['highQualityPhoto'] != null) ||
          (data['highQualityPhotoBlurHash'] != '' &&
              data['highQualityPhotoBlurHash'] != null) ||
          (data['lowQualityPhoto'] != '' && data['lowQualityPhoto'] != null) ||
          (data['lowQualityPhotoBlurHash'] != '' &&
              data['lowQualityPhotoBlurHash'] != null)) {
        if ((data['thumbnail'] == '' || data['thumbnail'] == null) ||
            (data['thumbnailBlurHash'] == '' ||
                data['thumbnailBlurHash'] == null) ||
            (data['highQualityPhoto'] == '' ||
                data['highQualityPhoto'] == null) ||
            (data['highQualityPhotoBlurHash'] == '' ||
                data['highQualityPhotoBlurHash'] == null) ||
            (data['lowQualityPhoto'] == '' ||
                data['lowQualityPhoto'] == null) ||
            (data['lowQualityPhotoBlurHash'] == '' ||
                data['lowQualityPhotoBlurHash'] == null)) {
          return Left(GrpcError.invalidArgument('Invalid argument photo'));
        } else {
          data.remove('code');
          data.remove('email');
          data.remove('alias');
          final response = await userLocalDataSource.updateUser(
            data: data,
            paths: paths,
            context: context,
          );
          if (response != null) {
            return Right(UpdateUserResponse(user: response));
          }
          return Left(GrpcError.notFound('Not found'));
        }
      } else {
        data.remove('code');
        data.remove('email');
        data.remove('alias');
        data.remove('thumbnail');
        data.remove('thumbnailBlurHash');
        data.remove('highQualityPhoto');
        data.remove('highQualityPhotoBlurHash');
        data.remove('lowQualityPhoto');
        data.remove('lowQualityPhotoBlurHash');
        final response = await userLocalDataSource.updateUser(
          data: data,
          paths: paths,
          context: context,
        );
        if (response != null) {
          return Right(UpdateUserResponse(user: response));
        }
        return Left(GrpcError.notFound('Not found'));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, Empty>> userExists({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  }) async {
    try {
      if (data['alias'] == '' ||
          !StringUtils.isAlias(data['alias']) ||
          !Validation.alias(data['alias'])) {
        return Left(GrpcError.invalidArgument('Input `alias` invalid'));
      } else {
        final response = await userLocalDataSource.getUser(
            data: data, paths: paths, context: context);
        if (response != null) {
          return Left(GrpcError.alreadyExists('User already exists'));
        }
        return Right(Empty());
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
