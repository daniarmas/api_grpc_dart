import 'package:api_grpc_dart/core/error/exception.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/verification_code_repository_impl.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
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

  group('testing createVerificationCode', () {
    test('Return data successfully when everything is ok', () async {
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
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCodeBeforeCreateVerificationCode(data: map));
      verify(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Right(verificationCode));
    });

    test('Return GrpcError.invalidArgument when email value is not valid',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel',
        'type': VerificationCodeType.SIGN_IN
      };
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verifyNever(mockVerificationCodeLocalDataSource
          .deleteVerificationCodeBeforeCreateVerificationCode(data: map));
      verifyNever(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Left(GrpcError.invalidArgument('Input `email` invalid')));
    });

    test(
        'Return GrpcError.invalidArgument when type is VerificationCodeType.UNSPECIFIED',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.UNSPECIFIED
      };
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verifyNever(mockVerificationCodeLocalDataSource
          .deleteVerificationCodeBeforeCreateVerificationCode(data: map));
      verifyNever(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Left(GrpcError.invalidArgument('Input `type` invalid')));
    });

    test(
        'Return GrpcError.internal when throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: map))
          .thenThrow(DatabaseConnectionNotOpenException());
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCodeBeforeCreateVerificationCode(data: map));
      verify(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    test(
        'Return GrpcError.internal when throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: map))
          .thenThrow(DatabaseConnectionNotOpenException());
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCodeBeforeCreateVerificationCode(data: map));
      verify(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    test('Return GrpcError.internal when throw DatabaseTableNotExistsException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: map))
          .thenThrow(DatabaseTableNotExistsException());
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCodeBeforeCreateVerificationCode(data: map));
      verify(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    test('Return GrpcError.internal when throw any Exception', () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: map))
          .thenThrow(Exception());
      // side effects
      final result =
          await businessRepositoryImpl.createVerificationCode(data: map);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCodeBeforeCreateVerificationCode(data: map));
      verify(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: map));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
