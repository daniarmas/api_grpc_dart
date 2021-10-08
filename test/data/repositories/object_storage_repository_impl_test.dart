import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/object_storage_data_source.dart';
import 'package:api_grpc_dart/data/repositories/object_storage_repository_impl.dart';
import 'package:api_grpc_dart/environment.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'object_storage_repository_impl_test.mocks.dart';

@GenerateMocks([ObjectStorageDataSource])
void main() {
  late EnvironmentApp environment;
  late MockObjectStorageDataSource mockObjectStorageDataSource;
  late ObjectStorageRepositoryImpl objectStorageRepositoryImpl;
  late HeadersMetadata metadata;

  setUpAll(() {
    configureDependencies();
    environment = GetIt.I<EnvironmentApp>();
  });

  setUp(() async {
    metadata = HeadersMetadata(
        accesstoken: '1',
        platform: PlatformType.ANDROID,
        systemVersion: '1',
        appVersion: '1',
        ipv4: '192.168.1.3',
        ipv6: 'asdksajdhaskjdjklasdhjk',
        app: AppType.APP,
        deviceId: '1',
        model: '1',
        firebaseCloudMessagingId: '1');
    mockObjectStorageDataSource = MockObjectStorageDataSource();
    objectStorageRepositoryImpl = ObjectStorageRepositoryImpl(
        objectStorageDataSource: mockObjectStorageDataSource);
  });

  group('testing presignedPutObject', () {
    test('Return data sucessfull when everything is ok', () async {
      // setup
      String url = 'url';
      when(mockObjectStorageDataSource.presignedPutObject(any, any))
          .thenAnswer((_) async => url);
      // side effects
      final result = await objectStorageRepositoryImpl.presignedPutObject(
          bucket: 'user-avatar',
          object: 'object.jpg',
          metadata: metadata,
          paths: []);
      // expectations
      verify(mockObjectStorageDataSource.presignedPutObject(any, any));
      expect(result, Right(url));
    });
    test('Return GrpcError.internal() when the code throw a Exception',
        () async {
      // setup
      when(mockObjectStorageDataSource.presignedPutObject(any, any))
          .thenThrow(Exception());
      // side effects
      final result = await objectStorageRepositoryImpl.presignedPutObject(
          bucket: 'user-avatar',
          object: 'object.jpg',
          metadata: metadata,
          paths: []);
      // expectations
      verify(mockObjectStorageDataSource.presignedPutObject(any, any));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
