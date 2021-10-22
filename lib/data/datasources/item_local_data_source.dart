import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class ItemLocalDataSource {
  Future<List<Item>> listItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<SearchItemResponse> searchItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<Item?> getItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
}

@Injectable(as: ItemLocalDataSource)
class ItemLocalDataSourceImpl implements ItemLocalDataSource {
  final Database _database;
  static final String _table = 'Item';

  ItemLocalDataSourceImpl(this._database);

  @override
  Future<Item?> getItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      List<String> getPath = [];
      getPath.addAll(paths);
      getPath.removeWhere((element) => element == 'photos');
      final result = await _database.get(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data),
          attributes: getPath);
      if (result != null) {
        List<ItemPhoto> listItemPhoto = [];
        if (paths.isEmpty || paths.contains('photos')) {
          final photos = await _database
              .list(context: context, table: 'ItemPhoto', where: [
            WhereNormalAttributeEqual(
              key: 'itemFk',
              value: result[_table]['id'],
            )
          ], attributes: []);
          for (var item in photos) {
            listItemPhoto.add(ItemPhoto(
              id: item['ItemPhoto']['id'],
              itemFk: item['ItemPhoto']['itemFk'],
              blurHash: item['ItemPhoto']['blurHash'],
              highQualityPhoto: item['ItemPhoto']['highQualityPhoto'],
              lowQualityPhoto: item['ItemPhoto']['lowQualityPhoto'],
              createTime: item['ItemPhoto']['createTime'].toString(),
              updateTime: item['ItemPhoto']['updateTime'].toString(),
            ));
          }
        }
        return Item(
          id: result[_table]['id'],
          name: result[_table]['name'],
          description: result[_table]['description'],
          availability: result[_table]['availability'],
          businessFk: result[_table]['businessFk'],
          blurHash: result[_table]['blurHash'],
          highQualityPhoto: result[_table]['highQualityPhoto'],
          lowQualityPhoto: result[_table]['lowQualityPhoto'],
          photos: listItemPhoto,
          businessItemCategoryFk: result[_table]['businessItemCategoryFk'],
          status: parseItemStatusTypeEnum(result[_table]['status']),
          price: result[_table]['price'],
          createTime: (result[_table]['createTime'] != null)
              ? result[_table]['createTime'].toString()
              : null,
          updateTime: (result[_table]['updateTime'] != null)
              ? result[_table]['updateTime'].toString()
              : null,
        );
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Item>> listItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      List<String> listPath = [];
      List<String> ids = [];
      listPath.addAll(paths);
      listPath.removeWhere((element) => element == 'photos');
      var nextPage = data['nextPage'];
      late List<Map<String, dynamic>> result;
      if (nextPage == null) {
        result = await _database.list(
            context: context,
            table: _table,
            attributes: listPath,
            orderByAsc: 'name',
            where: [
              WhereNormalAttributeNotEqual(key: 'status', value: 'DEPRECATED'),
              WhereNormalAttributeHigher(key: 'availability', value: '-1'),
            ],
            limit: 5);
      } else {
        result = await _database.list(
            context: context,
            table: _table,
            attributes: paths,
            orderByAsc: 'name',
            where: [
              WhereNormalAttributeHigher(key: 'name', value: data['nextPage']),
              WhereNormalAttributeNotEqual(key: 'status', value: 'DEPRECATED'),
              WhereNormalAttributeHigher(key: 'availability', value: '-1'),
            ],
            limit: 5);
      }
      List<Item> response = [];
      for (var item in result) {
        ids.add(item[_table]['id']);
        response.add(Item(
            id: item[_table]['id'],
            name: item[_table]['name'],
            description: item[_table]['description'],
            availability: item[_table]['availability'],
            businessFk: item[_table]['businessFk'],
            blurHash: item[_table]['blurHash'],
            highQualityPhoto: item[_table]['highQualityPhoto'],
            lowQualityPhoto: item[_table]['lowQualityPhoto'],
            photos: null,
            businessItemCategoryFk: item[_table]['businessItemCategoryFk'],
            status: parseItemStatusTypeEnum(item['Item']['status']),
            price: item[_table]['price'],
            createTime: (item[_table]['createTime'] != null)
                ? item[_table]['createTime'].toString()
                : null,
            updateTime: (item[_table]['updateTime'] != null)
                ? item[_table]['updateTime'].toString()
                : null));
      }
      if (response.length > 5) {
        ids.removeLast();
      }
      List<ItemPhoto> listItemPhoto = [];
      if (paths.isEmpty || paths.contains('photos')) {
        final photos =
            await _database.list(context: context, table: 'ItemPhoto', where: [
          WhereNormalAttributeIn(key: 'itemFk', value: ids),
        ], attributes: []);
        for (var item in photos) {
          listItemPhoto.add(ItemPhoto(
            id: item['ItemPhoto']['id'],
            itemFk: item['ItemPhoto']['itemFk'],
            blurHash: item['ItemPhoto']['blurHash'],
            highQualityPhoto: item['ItemPhoto']['highQualityPhoto'],
            lowQualityPhoto: item['ItemPhoto']['lowQualityPhoto'],
            createTime: item['ItemPhoto']['createTime'].toString(),
            updateTime: item['ItemPhoto']['updateTime'].toString(),
          ));
        }
      }
      for (var item in response) {
        List<ItemPhoto> listOfPhotos = [];
        for (var itemPhoto in listItemPhoto) {
          if (item.id == itemPhoto.itemFk) {
            listOfPhotos.add(itemPhoto);
          }
        }
        item.photos.addAll(listOfPhotos);
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SearchItemResponse> searchItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      late List<Map<String, dynamic>> itemsResult;
      late List<Map<String, dynamic>> businessResult;
      var nextPage = data['nextPage'];
      var latLng = data['location'];
      SearchItemResponse response = SearchItemResponse();
      List<String> businessIds = [];
      List<SearchItem> searchItemsList = [];
      if (nextPage == 0) {
        businessResult = await _database.list(
          context: context,
          table: 'Business',
          attributes: ['id'],
          agregationMethods: [
            'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
          ],
          where: [
            WhereNormalAttributeEqual(
                key: 'provinceFk', value: data['provinceFk']),
            WhereNormalAttributeEqual(
                key: 'municipalityFk', value: data['municipalityFk']),
          ],
        );
        for (var item in businessResult) {
          businessIds.add(item['Business']['id']);
        }
        itemsResult = await _database.search(
            context: context,
            table: 'Item',
            attributes: [
              'id',
              'name',
              'price',
              'status',
              'highQualityPhoto',
              'lowQualityPhoto',
              'blurHash',
              'businessFk',
              'cursor'
            ],
            where: [
              WhereNormalSearch(key: 'name', value: data['name']),
              WhereNormalAttributeIn(key: 'businessFk', value: businessIds),
              WhereNormalAttributeNotEqual(key: 'status', value: 'DEPRECATED'),
              WhereNormalAttributeHigher(key: 'availability', value: '-1'),
              WhereNormalAttributeHigher(key: 'cursor', value: nextPage),
            ],
            limit: 5);
        if (itemsResult.length >= 5) {
          itemsResult.removeLast();
          response.nextPage =
              response.nextPage = itemsResult.last['Item']['cursor'];
          response.searchMunicipalityType = SearchMunicipalityType.MORE;
        } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
          response.nextPage =
              response.nextPage = itemsResult.last['Item']['cursor'];
          response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
        } else if (itemsResult.isEmpty) {
          businessIds.clear();
          businessResult = await _database.list(
            context: context,
            table: 'Business',
            attributes: ['id'],
            agregationMethods: [
              'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
            ],
            where: [
              WhereNormalAttributeEqual(
                  key: 'provinceFk', value: data['provinceFk']),
              (data['searchMunicipalityType'] == SearchMunicipalityType.MORE)
                  ? WhereNormalAttributeNotEqual(
                      key: 'municipalityFk', value: data['municipalityFk'])
                  : WhereNormalAttributeEqual(
                      key: 'municipalityFk', value: data['municipalityFk']),
            ],
          );
          for (var item in businessResult) {
            businessIds.add(item['Business']['id']);
          }
          itemsResult = await _database.search(
              context: context,
              table: 'Item',
              attributes: [
                'id',
                'name',
                'price',
                'status',
                'highQualityPhoto',
                'lowQualityPhoto',
                'blurHash',
                'businessFk',
                'cursor'
              ],
              where: [
                WhereNormalSearch(key: 'name', value: data['name']),
                WhereNormalAttributeIn(key: 'businessFk', value: businessIds),
                WhereNormalAttributeNotEqual(
                    key: 'status', value: 'DEPRECATED'),
                WhereNormalAttributeHigher(key: 'cursor', value: nextPage),
              ],
              limit: 5);
          if (itemsResult.length >= 5) {
            itemsResult.removeLast();
            response.nextPage = itemsResult.last['Item']['cursor'];
            response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
          } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
            response.nextPage =
                response.nextPage = itemsResult.last['Item']['cursor'];
            response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
          } else {
            response.nextPage = response.nextPage = 0;
            response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
          }
        }
      } else {
        businessResult = await _database.list(
          context: context,
          table: 'Business',
          attributes: ['id'],
          agregationMethods: [
            'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
          ],
          where: [
            WhereNormalAttributeEqual(
                key: 'provinceFk', value: data['provinceFk']),
            (data['searchMunicipalityType'] == SearchMunicipalityType.MORE)
                ? WhereNormalAttributeEqual(
                    key: 'municipalityFk', value: data['municipalityFk'])
                : WhereNormalAttributeNotEqual(
                    key: 'municipalityFk', value: data['municipalityFk']),
          ],
        );
        for (var item in businessResult) {
          businessIds.add(item['Business']['id']);
        }
        itemsResult = await _database.search(
            context: context,
            table: 'Item',
            attributes: [
              'id',
              'name',
              'price',
              'status',
              'highQualityPhoto',
              'lowQualityPhoto',
              'blurHash',
              'businessFk',
              'cursor'
            ],
            where: [
              WhereNormalSearch(key: 'name', value: data['name']),
              WhereNormalAttributeIn(key: 'businessFk', value: businessIds),
              WhereNormalAttributeNotEqual(key: 'status', value: 'DEPRECATED'),
              WhereNormalAttributeHigher(key: 'cursor', value: nextPage),
            ],
            limit: 5);
        if (itemsResult.length >= 5) {
          itemsResult.removeLast();
          response.nextPage = itemsResult.last['Item']['cursor'];
          response.searchMunicipalityType =
              (data['searchMunicipalityType'] == SearchMunicipalityType.MORE)
                  ? SearchMunicipalityType.MORE
                  : SearchMunicipalityType.NO_MORE;
        } else if (itemsResult.length <= 5 && itemsResult.isNotEmpty) {
          response.nextPage = itemsResult.last['Item']['cursor'];
          response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
        } else if (itemsResult.isEmpty) {
          response.searchMunicipalityType = SearchMunicipalityType.NO_MORE;
          response.nextPage = 0;
        }
      }
      for (var itemBusiness in businessResult) {
        for (var item in itemsResult) {
          if (itemBusiness['Business']['id'] == item['Item']['businessFk']) {
            searchItemsList.add(SearchItem(
              id: item['Item']['id'],
              name: item['Item']['name'],
              price: item['Item']['price'],
              businessName: itemBusiness['Business']['name'],
              highQualityPhoto: item['Item']['highQualityPhoto'],
              lowQualityPhoto: item['Item']['lowQualityPhoto'],
              blurHash: item['Item']['blurHash'],
              cursor: item['Item']['cursor'],
              businessFk: itemBusiness['Business']['id'],
              status: (parseItemStatusTypeEnum(
                            item['Item']['status'],
                          ) ==
                          ItemStatusType.AVAILABLE &&
                      itemBusiness['']['isInRange'])
                  ? ItemStatusType.AVAILABLE
                  : ItemStatusType.UNAVAILABLE,
            ));
          }
        }
      }
      response.items.addAll(searchItemsList);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
