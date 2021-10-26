import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class BusinessLocalDataSource {
  Future<FeedResponse> feed(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<Business?> getBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});
}

@Injectable(as: BusinessLocalDataSource)
class BusinessLocalDataSourceImpl implements BusinessLocalDataSource {
  final Database _database;
  static final String _table = 'Business';

  BusinessLocalDataSourceImpl(this._database);

  @override
  Future<Business?> getBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data),
          agregationMethods: [
            'ST_X("Business"."coordinates") AS longitude',
            'ST_Y("Business"."coordinates") AS latitude',
            'ST_AsGeoJSON("Business"."polygon") :: json->\'coordinates\' AS polygon',
          ],
          attributes: paths);
      if (result != null) {
        return Business(
            id: result[_table]['id'],
            name: result[_table]['name'],
            description: result[_table]['description'],
            isOpen: result[_table]['isOpen'],
            businessBrandFk: result[_table]['businessBrandFk'],
            deliveryPrice: result[_table]['deliveryPrice'],
            homeDelivery: result[_table]['homeDelivery'],
            leadDayTime: result[_table]['leadDayTime'],
            leadHoursTime: result[_table]['leadHoursTime'],
            leadMinutesTime: result[_table]['leadMinutesTime'],
            municipalityFk: result[_table]['municipalityFk'],
            provinceFk: result[_table]['provinceFk'],
            toPickUp: result[_table]['toPickUp'],
            address: result[_table]['address'],
            phone: result[_table]['phone'],
            email: result[_table]['email'],
            blurHash: result[_table]['blurHash'],
            highQualityPhoto: result[_table]['highQualityPhoto'],
            lowQualityPhoto: result[_table]['lowQualityPhoto'],
            // polygon: parsePolygon(result['']['polygon'][0]),
            distance: result['']['distance'],
            coordinates: Point(
                latitude: result['']['latitude'],
                longitude: result['']['longitude']));
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<FeedResponse> feed({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required List<Attribute> paths,
  }) async {
    try {
      late List<Map<String, dynamic>> itemsResult;
      var nextPage = data['nextPage'];
      var latLng = data['location'];
      FeedResponse response = FeedResponse();
      List<Business> business = [];
      if (paths.isNotEmpty &&
          !paths.any((element) => element.name == '"cursor"')) {
        paths.add(NormalAttribute(name: 'cursor'));
      }
      if (data['searchMunicipalityType'] == SearchMunicipalityType.MORE) {
        itemsResult = await _database.list(
            context: context,
            table: 'Business',
            attributes: paths,
            agregationMethods: [
              'ST_Contains("Business"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
            ],
            where: [
              WhereNormalAttributeHigher(key: 'cursor', value: nextPage),
              WhereNormalAttributeEqual(
                  key: 'provinceFk', value: data['provinceFk']),
              WhereNormalAttributeEqual(
                  key: 'municipalityFk', value: data['municipalityFk']),
            ],
            orderByAsc: 'cursor',
            limit: 5);
        if (itemsResult.length > 5) {
          itemsResult.removeLast();
          response.nextPage =
              response.nextPage = itemsResult.last['Business']['cursor'];
          response.searchMunicipalityType = SearchMunicipalityType.MORE;
        } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
          var len = 5 - itemsResult.length;
          var completeItems = await _database.list(
              context: context,
              table: 'Business',
              attributes: paths,
              agregationMethods: [
                'ST_Contains("Business"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
              ],
              where: [
                WhereNormalAttributeHigher(key: 'cursor', value: 0),
                WhereNormalAttributeEqual(
                    key: 'provinceFk', value: data['provinceFk']),
                WhereNormalAttributeNotEqual(
                    key: 'municipalityFk', value: data['municipalityFk']),
              ],
              orderByAsc: 'cursor',
              limit: len);
          if (completeItems.length > len) {
            completeItems.removeLast();
          }
          itemsResult.addAll(completeItems);
          response.nextPage =
              response.nextPage = itemsResult.last['Business']['cursor'];
          response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
        } else if (itemsResult.isEmpty) {
          itemsResult = await _database.list(
              context: context,
              table: 'Business',
              attributes: paths,
              agregationMethods: [
                'ST_Contains("Business"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
              ],
              where: [
                WhereNormalAttributeHigher(key: 'cursor', value: 0),
                WhereNormalAttributeEqual(
                    key: 'provinceFk', value: data['provinceFk']),
                WhereNormalAttributeNotEqual(
                    key: 'municipalityFk', value: data['municipalityFk']),
              ],
              orderByAsc: 'cursor',
              limit: 5);
          if (itemsResult.length > 5) {
            itemsResult.removeLast();
            response.nextPage = itemsResult.last['Business']['cursor'];
          } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
            response.nextPage = itemsResult.last['Business']['cursor'];
          }
          response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
        }
      } else {
        itemsResult = await _database.list(
            context: context,
            table: 'Business',
            attributes: paths,
            agregationMethods: [
              'ST_Contains("Business"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
            ],
            where: [
              WhereNormalAttributeHigher(key: 'cursor', value: nextPage),
              WhereNormalAttributeEqual(
                  key: 'provinceFk', value: data['provinceFk']),
              WhereNormalAttributeNotEqual(
                  key: 'municipalityFk', value: data['municipalityFk']),
            ],
            orderByAsc: 'cursor',
            limit: 5);
        if (itemsResult.length > 5) {
          itemsResult.removeLast();
          response.nextPage = itemsResult.last['Business']['cursor'];
        } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
          response.nextPage = itemsResult.last['Business']['cursor'];
        }
        response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
      }
      for (var item in itemsResult) {
        business.add(Business(
            id: item['Business']['id'],
            name: item['Business']['name'],
            isOpen: item['Business']['isOpen'],
            blurHash: item['Business']['blurHash'],
            highQualityPhoto: item['Business']['highQualityPhoto'],
            lowQualityPhoto: item['Business']['lowQualityPhoto'],
            cursor: item['Business']['cursor'],
            address: item['Business']['address'],
            businessBrandFk: item['Business']['businessBrandFk'],
            coordinates: Point(
              latitude: item['']['latitude'],
              longitude: item['']['longitude'],
            ),
            deliveryPrice: item['Business']['deliveryPrice'],
            description: item['Business']['description'],
            distance: item['Business']['distance'],
            email: item['Business']['email'],
            homeDelivery: item['Business']['homeDelivery'],
            leadDayTime: item['Business']['leadDayTime'],
            leadHoursTime: item['Business']['leadHoursTime'],
            leadMinutesTime: item['Business']['leadMinutesTime'],
            municipalityFk: item['Business']['municipalityFk'],
            provinceFk: item['Business']['provinceFk'],
            phone: item['Business']['phone'],
            status: (item['']['isInRange'] == false &&
                    item['Business']['toPickUp'] == false &&
                    item['Business']['homeDelivery'] == true)
                ? BusinessStatusType.BUSINESS_UNAVAILABLE
                : BusinessStatusType.BUSINESS_AVAILABLE,
            toPickUp: item['Business']['toPickUp']));
      }
      response.businesses.addAll(business);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
