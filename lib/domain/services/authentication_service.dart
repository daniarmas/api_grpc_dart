import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/authentication_repository.dart';
import 'package:api_grpc_dart/domain/repositories/user_repository.dart';
import 'package:api_grpc_dart/domain/repositories/verification_code_repository.dart';
import 'package:api_grpc_dart/protos/google/protobuf/empty.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pbgrpc.dart';

class AuthenticationService extends AuthenticationServiceBase {
  Database database = GetIt.I<Database>();
  AuthenticationRepository authenticationRepository =
      GetIt.I<AuthenticationRepository>();
  VerificationCodeRepository verificationCodeRepository =
      GetIt.I<VerificationCodeRepository>();
  UserRepository userRepository = GetIt.I<UserRepository>();

  @override
  Future<CreateVerificationCodeResponse> createVerificationCode(
      ServiceCall call, CreateVerificationCodeRequest request) async {
    try {
      late CreateVerificationCodeResponse response;
      late Either<GrpcError, CreateVerificationCodeResponse> result;
      var connection = await database.getConnection();
      HeadersMetadata metadata = HeadersMetadata.fromServiceCall(call);
      await connection.transaction((context) async {
        result = await verificationCodeRepository.createVerificationCode(
            metadata: metadata,
            data: getRequestData(request, add: {'deviceId': metadata.deviceId}),
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

  @override
  Future<ListVerificationCodeResponse> listVerificationCode(
      ServiceCall call, ListVerificationCodeRequest request) async {
    try {
      late ListVerificationCodeResponse response;
      late Either<GrpcError, ListVerificationCodeResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.listVerificationCode(
          metadata: HeadersMetadata.fromServiceCall(call),
          paths: getPaths(request.fieldMask.paths),
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

  @override
  Future<GetVerificationCodeResponse> getVerificationCode(
      ServiceCall call, GetVerificationCodeRequest request) async {
    try {
      late GetVerificationCodeResponse response;
      late Either<GrpcError, GetVerificationCodeResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.getVerificationCode(
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

  @override
  Future<Empty> deleteVerificationCode(
      ServiceCall call, DeleteVerificationCodeRequest request) async {
    try {
      late Either<GrpcError, void> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.deleteVerificationCode(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            context: context);
      });
      result.fold((left) => throw left, (right) => null);
      return Empty();
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<SignInResponse> signIn(ServiceCall call, SignInRequest request) async {
    try {
      late SignInResponse response;
      late Either<GrpcError, SignInResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await authenticationRepository.signIn(
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

  @override
  Future<UpdateVerificationCodeResponse> updateVerificationCode(
      ServiceCall call, UpdateVerificationCodeRequest request) async {
    try {
      late UpdateVerificationCodeResponse response;
      late Either<GrpcError, UpdateVerificationCodeResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.updateVerificationCode(
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

  @override
  Future<CheckSessionResponse> checkSession(
      ServiceCall call, CheckSessionRequest request) async {
    try {
      late CheckSessionResponse response;
      late Either<GrpcError, CheckSessionResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await authenticationRepository.checkSession(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
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
  Future<Empty> userExists(ServiceCall call, UserExistsRequest request) async {
    try {
      late Empty response;
      late Either<GrpcError, User> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await userRepository.getUser(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: [NormalAttribute(name: 'id')],
            context: context);
      });
      result.fold((left) => {throw left}, (right) => {response = Empty()});
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
  Stream<UserExistsStreamResponse> userExistsStream(
      ServiceCall call, Stream<UserExistsStreamRequest> request) async* {
    try {
      late UserExistsStreamResponse response;
      late Either<GrpcError, UserExistsStreamResponse> result;
      var connection = await database.getConnection();
      await for (var item in request) {
        await connection.transaction((context) async {
          result = await userRepository.userExistsStream(
              metadata: HeadersMetadata.fromServiceCall(call),
              data: getRequestData(item),
              context: context);
          result.fold((left) => {throw left}, (right) => {response = right});
        });
        yield response;
      }
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<SignUpResponse> signUp(ServiceCall call, SignUpRequest request) async {
    try {
      late SignUpResponse response;
      late Either<GrpcError, SignUpResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await authenticationRepository.signUp(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: [],
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
  Future<RefreshTokenResponse> refreshToken(
      ServiceCall call, RefreshTokenRequest request) async {
    try {
      late RefreshTokenResponse response;
      late Either<GrpcError, RefreshTokenResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await authenticationRepository.refreshToken(
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

  @override
  Future<Empty> signOut(ServiceCall call, SignOutRequest request) async {
    try {
      late Empty response;
      late Either<GrpcError, void> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await authenticationRepository.signOut(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: [],
            context: context);
      });
      result.fold((left) => {throw left}, (right) => {response = Empty()});
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
  Future<ListSessionResponse> listSession(
      ServiceCall call, ListSessionRequest request) async {
    try {
      late ListSessionResponse response;
      late Either<GrpcError, ListSessionResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await authenticationRepository.listSession(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: [],
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
