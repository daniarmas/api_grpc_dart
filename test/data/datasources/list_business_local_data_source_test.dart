import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import './list_business_local_data_source_test.mocks.dart';

@GenerateMocks([Database])
void main() {
  late BusinessLocalDataSourceImpl localDataSource;
  late MockDatabase mockDatabase;
  List<Map<String, Map<String, Object>>> databaseResult = [
    {
      'Business': {
        'id': '5c8d9f3a-c5cb-488d-a7f6-da88800fed85',
        'name': 'Kadis Cardenas',
        'description': 'No pierdas la oportunidad de darle a la...',
        'address': 'asdasjldsad',
        'phone': '4241231231',
        'email': 'kadis@gmail.com',
        'photo': 'pizza.jpg',
        'photoUrl':
            'http://192.168.0.2:9001/business-avatar/138707853_399772044633247_7513581601211252771_n.jpg',
      },
      '': {
        'longitude': -81.20614607316554,
        'latitude': 23.045275156416913,
        'polygon': [],
        'distance': 0.009099196860966515
      }
    }
  ];

  List<Business> listOfBusiness = [
    Business(
        id: '5c8d9f3a-c5cb-488d-a7f6-da88800fed85',
        address: 'asdasjldsad',
        coordinates:
            LatLng(latitude: 23.045275156416913, longitude: -81.20614607316554),
        description: 'No pierdas la oportunidad de darle a la...',
        distance: 0.009099196860966515,
        email: 'kadis@gmail.com',
        name: 'Kadis Cardenas',
        phone: '4241231231',
        photo: 'pizza.jpg',
        photoUrl:
            'http://192.168.0.2:9001/business-avatar/138707853_399772044633247_7513581601211252771_n.jpg')
  ];

  setUp(() {
    mockDatabase = MockDatabase();
    localDataSource = BusinessLocalDataSourceImpl(mockDatabase);
  });

  group('should return local data listBusiness from database', () {
    test('should return data when the call to list in database is successful.',
        () async {
      // setup
      when(mockDatabase.list(
              agregationMethods: anyNamed('agregationMethods'),
              attributes: anyNamed('attributes'),
              limit: anyNamed('limit'),
              orderByAsc: anyNamed('orderByAsc'),
              table: anyNamed('table'),
              where: anyNamed('where')))
          .thenAnswer((_) async => databaseResult);
      // act
      final result = await localDataSource.listBusiness(
          latLng: LatLng(latitude: 1, longitude: 1), notIds: ['1']);
      // assert
      verify(mockDatabase.list(
          agregationMethods: anyNamed('agregationMethods'),
          attributes: anyNamed('attributes'),
          limit: anyNamed('limit'),
          orderByAsc: anyNamed('orderByAsc'),
          table: anyNamed('table'),
          where: anyNamed('where')));
      expect(result, listOfBusiness);
    });
  });
}
