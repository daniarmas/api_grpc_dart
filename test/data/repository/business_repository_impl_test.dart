import 'package:api_grpc_dart/core/error/exception.dart';
import 'package:api_grpc_dart/core/error/failure.dart';
import 'package:api_grpc_dart/data/datasources/list_business_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/business_repository_impl.dart';
import 'package:api_grpc_dart/protos/main.pb.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'business_repository_impl_test.mocks.dart';

@GenerateMocks([ListBusinessLocalDataSource])
void main() {
  late BusinessRepositoryImpl businessRepositoryImpl;
  late MockListBusinessLocalDataSource mockListBusinessLocalDataSource;

  List<Business> listOfBusiness = [Business(id: '1', name: 'daniel')];

  setUp(() {
    mockListBusinessLocalDataSource = MockListBusinessLocalDataSource();
    businessRepositoryImpl = BusinessRepositoryImpl(
        localDataSource: mockListBusinessLocalDataSource);
  });

  group('should return local data listBusiness from database', () {
    test('should return data when the call to local data source is successful.',
        () async {
      when(mockListBusinessLocalDataSource.listBusiness())
          .thenAnswer((_) async => Right(listOfBusiness));
      // act
      final result = await businessRepositoryImpl.listBusiness();
      // assert
      verify(mockListBusinessLocalDataSource.listBusiness());
      expect(result, Right(listOfBusiness));
    });
    test(
        'should return server failure when the call to local data source is unsuccessful.',
        () async {
      when(mockListBusinessLocalDataSource.listBusiness())
          .thenThrow(ServerException());
      // act
      final result = await businessRepositoryImpl.listBusiness();
      // assert
      verify(mockListBusinessLocalDataSource.listBusiness());
      expect(result, Left(ServerFailure()));
    });
  });
}
