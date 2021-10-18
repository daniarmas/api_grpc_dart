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
            WhereNormalAttribute(
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
              highQualityPhotoUrl: item['ItemPhoto']['highQualityPhotoUrl'],
              lowQualityPhoto: item['ItemPhoto']['lowQualityPhoto'],
              lowQualityPhotoUrl: item['ItemPhoto']['lowQualityPhotoUrl'],
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
          photos: listItemPhoto,
          businessItemCategoryFk: result[_table]['businessItemCategoryFk'],
          isAvailable: result[_table]['isAvailable'],
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
              WhereNormalAttribute(key: 'isAvailable', value: 'true'),
              WhereNormalAttributeHigher(key: 'availability', value: '0'),
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
              WhereNormalAttribute(key: 'isAvailable', value: 'true'),
              WhereNormalAttributeHigher(key: 'availability', value: '0'),
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
            photos: null,
            businessItemCategoryFk: item[_table]['businessItemCategoryFk'],
            isAvailable: item[_table]['isAvailable'],
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
            highQualityPhotoUrl: item['ItemPhoto']['highQualityPhotoUrl'],
            lowQualityPhoto: item['ItemPhoto']['lowQualityPhoto'],
            lowQualityPhotoUrl: item['ItemPhoto']['lowQualityPhotoUrl'],
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
}
