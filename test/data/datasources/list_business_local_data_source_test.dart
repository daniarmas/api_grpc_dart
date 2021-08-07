import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:postgres_dao/and.dart';
import 'package:postgres_dao/or.dart';
import 'package:postgres_dao/where_agregation_attribute.dart';
import 'package:postgres_dao/where_normal_attribute.dart';
import 'package:postgres_dao/where_normal_attribute_not_in.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import './list_business_local_data_source_test.mocks.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';

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

  LatLng latLng = LatLng(latitude: 1, longitude: 1);
  List<String> notIds = ['1'];

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
      when(mockDatabase.list(
              table: 'Business',
              attributes: [
                'id',
                'name',
                'description',
                'address',
                'phone',
                'email',
                'photo',
                'photoUrl'
              ],
              agregationMethods: [
                'ST_X("Business"."coordinates") AS longitude',
                'ST_Y("Business"."coordinates") AS latitude',
                'ST_AsGeoJSON("Business"."polygon") :: json->\'coordinates\' AS polygon',
                'ST_Distance("coordinates", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) AS "distance"'
              ],
              orderByAsc: 'distance',
              // where: [
              //   Or([
              //     WhereAgregationAttribute(
              //         key:
              //             'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
              //         value: 'true'),
              //     WhereNormalAttribute(key: 'isOpen', value: 'true'),
              //     WhereNormalAttributeNotIn(key: 'id', value: notIds),
              //   ]),
              //   And([
              //     WhereAgregationAttribute(
              //         key:
              //             'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
              //         value: 'true'),
              //     WhereNormalAttribute(key: 'isOpen', value: 'true'),
              //     WhereNormalAttributeNotIn(key: 'id', value: notIds),
              //   ]),
              // ],
              limit: 10))
          .thenAnswer((_) async => databaseResult);
      // act
      final result = await localDataSource.listBusiness(
          latLng: LatLng(latitude: 1, longitude: 1), notIds: ['1']);
      // assert
      // verify(mockDatabase.list(
      //     table: 'Business',
      //     attributes: [
      //       'id',
      //       'name',
      //       'description',
      //       'address',
      //       'phone',
      //       'email',
      //       'photo',
      //       'photoUrl'
      //     ],
      //     agregationMethods: [
      //       'ST_X("Business"."coordinates") AS longitude',
      //       'ST_Y("Business"."coordinates") AS latitude',
      //       'ST_AsGeoJSON("Business"."polygon") :: json->\'coordinates\' AS polygon',
      //       'ST_Distance("coordinates", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) AS "distance"'
      //     ],
      //     orderByAsc: 'distance',
      //     where: [
      //       Or([
      //         WhereAgregationAttribute(
      //             key:
      //                 'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
      //             value: 'true'),
      //         WhereNormalAttribute(key: 'isOpen', value: 'true'),
      //         WhereNormalAttributeNotIn(key: 'id', value: notIds),
      //       ]),
      //       And([
      //         WhereAgregationAttribute(
      //             key:
      //                 'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
      //             value: 'true'),
      //         WhereNormalAttribute(key: 'isOpen', value: 'true'),
      //         WhereNormalAttributeNotIn(key: 'id', value: notIds),
      //       ]),
      //     ],
      //     limit: 10));
      expect(result, listOfBusiness);
    });
  });
}
