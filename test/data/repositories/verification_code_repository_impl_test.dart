import 'package:api_grpc_dart/core/error/exception.dart';
import 'package:api_grpc_dart/core/error/failure.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/verification_code_repository_impl.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import './verification_code_repository_impl_test.mocks.dart';

@GenerateMocks([VerificationCodeLocalDataSource])
void main() {
  late MockVerificationCodeLocalDataSource mockVerificationCodeLocalDataSource;
  late VerificationCodeRepositoryImpl businessRepositoryImpl;

  VerificationCode verificationCode = VerificationCode(
      code: '432567',
      deviceId: '1',
      id: 'ashdk13721y3179kshad',
      type: VerificationCodeType.SIGN_IN);

  setUp(() {
    mockVerificationCodeLocalDataSource = MockVerificationCodeLocalDataSource();
    businessRepositoryImpl = VerificationCodeRepositoryImpl(
        localDataSource: mockVerificationCodeLocalDataSource);
  });

  group('testing the verification code repository implementation...', () {
    test('verification code repository return sucess', () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: map))
          .thenAnswer((_) async => verificationCode);
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verify(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Right(verificationCode));
    });

    test('verification code repository return ServerException', () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: map))
          .thenThrow(InternalException());
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verify(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Left(ServerFailure()));
    });
  });
}
