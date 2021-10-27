import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/item_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where_search.dart';

import '../../protos/protos/main.pb.dart';

@Injectable(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource itemLocalDataSource;
  final Database database;

  ItemRepositoryImpl(
      {required this.itemLocalDataSource, required this.database});

  @override
  Future<Either<GrpcError, Item>> getItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['id'] == null || data['id'] == '') {
        return Left(GrpcError.invalidArgument('Input `id` invalid'));
      } else if (data['location'] == null ||
          data['location'].latitude == 0.0 ||
          data['location'].longitude == 0.0) {
        return Left(GrpcError.invalidArgument('Input `location` invalid'));
      } else {
        final response = await itemLocalDataSource.getItem(
            data: data, paths: paths, context: context);
        if (response != null) {
          return Right(response);
        }
        return Left(GrpcError.notFound('Not found'));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception catch (error) {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, List<Item>>> listItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['businessFk'] == null) {
        return Left(GrpcError.invalidArgument('Input `businessFk` invalid'));
      }
      final response = await itemLocalDataSource.listItem(
          paths: paths, context: context, data: data);
      if (response.length <= 5) {
        return Right(response);
      } else {
        response.removeLast();
        return Right(response);
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, SearchItemResponse>> searchItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['nextPage'] == null) {
        return Left(GrpcError.invalidArgument('Input `nextPage` invalid'));
      } else if (data['location'] == null ||
          data['location'].latitude == 0.0 ||
          data['location'].longitude == 0.0) {
        return Left(GrpcError.invalidArgument('Input `location` invalid'));
      } else if (data['name'] == null || data['name'] == '') {
        return Left(GrpcError.invalidArgument('Input `name` invalid'));
      } else if (data['provinceFk'] == null || data['provinceFk'] == '') {
        return Left(GrpcError.invalidArgument('Input `provinceFk` invalid'));
      } else if (data['municipalityFk'] == null ||
          data['municipalityFk'] == '') {
        return Left(
            GrpcError.invalidArgument('Input `municipalityFk` invalid'));
      } else if (data['searchMunicipalityType'] == null ||
          data['searchMunicipalityType'] ==
              SearchMunicipalityType.SEARCH_MUNICIPALITY_TYPE_UNSPECIFIED) {
        return Left(GrpcError.invalidArgument(
            'Input `searchMunicipalityType` invalid'));
      } else {
        late List<Map<String, dynamic>> itemsResult;
        var nextPage = data['nextPage'];
        var latLng = data['location'];
        SearchItemResponse response = SearchItemResponse();
        List<SearchItem> searchItemsList = [];
        if (data['searchMunicipalityType'] == SearchMunicipalityType.MORE) {
          itemsResult = await database.search(
              context: context,
              table: 'Item',
              attributes: [
                NormalAttribute(name: 'id'),
                NormalAttribute(name: 'name'),
                NormalAttribute(name: 'price'),
                NormalAttribute(name: 'status'),
                NormalAttribute(name: 'thumbnail'),
                NormalAttribute(name: 'blurHash'),
                NormalAttribute(name: 'businessFk'),
                NormalAttribute(name: 'cursor'),
                InnerAttribute(name: 'name', innerTable: 'Business'),
                InnerAttribute(name: 'toPickUp', innerTable: 'Business'),
              ],
              agregationMethods: [
                'ST_Contains("Item"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
              ],
              innerJoin: InnerJoin(
                  table: 'Item',
                  tableValue: 'businessFk',
                  relationValue: 'id',
                  relationTable: 'Business'),
              where: [
                WhereNormalSearch(key: 'name', value: data['name']),
                WhereNormalAttributeNotEqual(
                    key: 'status', value: 'DEPRECATED'),
                WhereNormalAttributeHigher(key: 'availability', value: '-1'),
                WhereNormalAttributeHigher(key: 'cursor', value: nextPage),
                WhereNormalAttributeEqual(
                    key: 'provinceFk', value: data['provinceFk']),
                WhereNormalAttributeEqual(
                    key: 'municipalityFk', value: data['municipalityFk']),
              ],
              orderByAsc: '"Item"."cursor"',
              limit: 5);
          if (itemsResult.length > 5) {
            itemsResult.removeLast();
            response.nextPage =
                response.nextPage = itemsResult.last['Item']['cursor'];
            response.searchMunicipalityType = SearchMunicipalityType.MORE;
          } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
            var len = 5 - itemsResult.length;
            var completeItems = await database.search(
                context: context,
                table: 'Item',
                attributes: [
                  NormalAttribute(name: 'id'),
                  NormalAttribute(name: 'name'),
                  NormalAttribute(name: 'price'),
                  NormalAttribute(name: 'status'),
                  NormalAttribute(name: 'thumbnail'),
                  NormalAttribute(name: 'blurHash'),
                  NormalAttribute(name: 'businessFk'),
                  NormalAttribute(name: 'cursor'),
                  InnerAttribute(name: 'name', innerTable: 'Business'),
                  InnerAttribute(name: 'toPickUp', innerTable: 'Business'),
                ],
                agregationMethods: [
                  'ST_Contains("Item"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
                ],
                innerJoin: InnerJoin(
                    table: 'Item',
                    tableValue: 'businessFk',
                    relationValue: 'id',
                    relationTable: 'Business'),
                where: [
                  WhereNormalSearch(key: 'name', value: data['name']),
                  WhereNormalAttributeNotEqual(
                      key: 'status', value: 'DEPRECATED'),
                  WhereNormalAttributeHigher(key: 'availability', value: '-1'),
                  WhereNormalAttributeHigher(key: 'cursor', value: 0),
                  WhereNormalAttributeEqual(
                      key: 'provinceFk', value: data['provinceFk']),
                  WhereNormalAttributeNotEqual(
                      key: 'municipalityFk', value: data['municipalityFk']),
                ],
                orderByAsc: '"Item"."cursor"',
                limit: len);
            if (completeItems.length > len) {
              completeItems.removeLast();
            }
            itemsResult.addAll(completeItems);
            response.nextPage =
                response.nextPage = itemsResult.last['Item']['cursor'];
            response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
          } else if (itemsResult.isEmpty) {
            itemsResult = await database.search(
                context: context,
                table: 'Item',
                attributes: [
                  NormalAttribute(name: 'id'),
                  NormalAttribute(name: 'name'),
                  NormalAttribute(name: 'price'),
                  NormalAttribute(name: 'status'),
                  NormalAttribute(name: 'thumbnail'),
                  NormalAttribute(name: 'blurHash'),
                  NormalAttribute(name: 'businessFk'),
                  NormalAttribute(name: 'cursor'),
                  InnerAttribute(name: 'name', innerTable: 'Business'),
                  InnerAttribute(name: 'toPickUp', innerTable: 'Business'),
                ],
                agregationMethods: [
                  'ST_Contains("Item"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
                ],
                innerJoin: InnerJoin(
                    table: 'Item',
                    tableValue: 'businessFk',
                    relationValue: 'id',
                    relationTable: 'Business'),
                where: [
                  WhereNormalSearch(key: 'name', value: data['name']),
                  WhereNormalAttributeNotEqual(
                      key: 'status', value: 'DEPRECATED'),
                  WhereNormalAttributeHigher(key: 'availability', value: '-1'),
                  WhereNormalAttributeHigher(key: 'cursor', value: 0),
                  WhereNormalAttributeEqual(
                      key: 'provinceFk', value: data['provinceFk']),
                  WhereNormalAttributeNotEqual(
                      key: 'municipalityFk', value: data['municipalityFk']),
                ],
                orderByAsc: '"Item"."cursor"',
                limit: 5);
            if (itemsResult.length > 5) {
              itemsResult.removeLast();
              response.nextPage = itemsResult.last['Item']['cursor'];
            } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
              response.nextPage = itemsResult.last['Item']['cursor'];
            }
            response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
          }
        } else {
          itemsResult = await database.search(
              context: context,
              table: 'Item',
              attributes: [
                NormalAttribute(name: 'id'),
                NormalAttribute(name: 'name'),
                NormalAttribute(name: 'price'),
                NormalAttribute(name: 'status'),
                NormalAttribute(name: 'thumbnail'),
                NormalAttribute(name: 'blurHash'),
                NormalAttribute(name: 'businessFk'),
                NormalAttribute(name: 'cursor'),
                InnerAttribute(name: 'name', innerTable: 'Business'),
                InnerAttribute(name: 'toPickUp', innerTable: 'Business'),
              ],
              agregationMethods: [
                'ST_Contains("Item"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
              ],
              innerJoin: InnerJoin(
                  table: 'Item',
                  tableValue: 'businessFk',
                  relationValue: 'id',
                  relationTable: 'Business'),
              where: [
                WhereNormalSearch(key: 'name', value: data['name']),
                WhereNormalAttributeNotEqual(
                    key: 'status', value: 'DEPRECATED'),
                WhereNormalAttributeHigher(key: 'availability', value: '-1'),
                WhereNormalAttributeHigher(key: 'cursor', value: nextPage),
                WhereNormalAttributeEqual(
                    key: 'provinceFk', value: data['provinceFk']),
                WhereNormalAttributeNotEqual(
                    key: 'municipalityFk', value: data['municipalityFk']),
              ],
              orderByAsc: '"Item"."cursor"',
              limit: 5);
          if (itemsResult.length > 5) {
            itemsResult.removeLast();
            response.nextPage = itemsResult.last['Item']['cursor'];
          } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
            response.nextPage = itemsResult.last['Item']['cursor'];
          }
          response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
        }
        for (var item in itemsResult) {
          searchItemsList.add(SearchItem(
            id: item['Item']['id'],
            name: item['Item']['name'],
            price: item['Item']['price'],
            thumbnail: item['Item']['thumbnail'],
            thumbnailBlurHash: item['Item']['thumbnailBlurHash'],
            cursor: item['Item']['cursor'],
            businessName: item['Business']['name'],
            status: (parseItemStatusTypeEnum(item['Item']['status']) ==
                        ItemStatusType.AVAILABLE &&
                    ((item['']['isInRange'] || item['Business']['toPickUp'])))
                ? ItemStatusType.AVAILABLE
                : ItemStatusType.UNAVAILABLE,
          ));
        }
        response.items.addAll(searchItemsList);
        return Right(response);
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
