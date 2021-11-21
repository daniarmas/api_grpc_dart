// Package imports:
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import '../../protos/protos/main.pb.dart';

abstract class ItemLocalDataSource {
  Future<List<Item>> listItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<Item?> getItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});
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
      required List<Attribute> paths}) async {
    try {
      var latLng = data['location'];
      List<Attribute> getPath = [];
      getPath.addAll(paths);
      getPath.removeWhere((element) => element.name == 'photos');
      getPath.removeWhere((element) => element.name == 'location');
      data.removeWhere((key, value) => key == 'location');
      if (paths.isNotEmpty &&
          !paths.any((element) => element.name == '"status"')) {
        paths.add(NormalAttribute(name: 'toPickUp'));
      }
      final result = await _database.get(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data),
          innerJoin: InnerJoin(
              table: _table,
              tableValue: 'businessFk',
              relationValue: 'id',
              relationTable: 'Business'),
          agregationMethods: [
            'ST_Contains("Item"."polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) as "isInRange"',
          ],
          attributes: getPath);
      if (result != null) {
        List<ItemPhoto> listItemPhoto = [];
        if (paths.isEmpty || paths.any((element) => element.name == 'photos')) {
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
              highQualityPhoto: item['ItemPhoto']['highQualityPhoto'],
              highQualityPhotoBlurHash: item['ItemPhoto']
                  ['highQualityPhotoBlurHash'],
              lowQualityPhoto: item['ItemPhoto']['lowQualityPhoto'],
              lowQualityPhotoBlurHash: item['ItemPhoto']
                  ['lowQualityPhotoBlurHash'],
              thumbnail: item['ItemPhoto']['thumbnail'],
              thumbnailBlurHash: item['ItemPhoto']['thumbnailBlurHash'],
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
          highQualityPhoto: result[_table]['highQualityPhoto'],
          highQualityPhotoBlurHash: result[_table]['highQualityPhotoBlurHash'],
          lowQualityPhoto: result[_table]['lowQualityPhoto'],
          lowQualityPhotoBlurHash: result[_table]['lowQualityPhotoBlurHash'],
          thumbnail: result[_table]['thumbnail'],
          thumbnailBlurHash: result[_table]['thumbnailBlurHash'],
          cursor: result[_table]['cursor'],
          photos: listItemPhoto,
          businessItemCategoryFk: result[_table]['businessItemCategoryFk'],
          status: (parseItemStatusTypeEnum(result[_table]['status']) ==
                      ItemStatusType.Available &&
                  ((result['']['isInRange'] || result['Business']['toPickUp'])))
              ? ItemStatusType.Available
              : ItemStatusType.Unavailable,
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
      required List<Attribute> paths}) async {
    try {
      bool photos = false;
      if (paths.isEmpty ||
          !paths.any((element) => element.name == '"photos"')) {
        photos = true;
      }
      if (data['nextPage'] == null) {
        data['nextPage'] = '';
      }
      List<Attribute> listPath = [];
      List<String> ids = [];
      listPath.addAll(paths);
      listPath.removeWhere((element) => element.name == 'photos');
      late List<Map<String, dynamic>> result;
      result = await _database.list(
          context: context,
          table: _table,
          attributes: listPath,
          orderBy: OrderByAsc(name: 'name', table: _table),
          where: [
            WhereNormalAttributeHigher(key: 'name', value: data['nextPage']),
            WhereNormalAttributeNotEqual(key: 'status', value: 'Deprecated'),
            WhereNormalAttributeHigher(key: 'availability', value: '-1'),
          ],
          limit: 5);
      List<Item> response = [];
      for (var item in result) {
        ids.add(item[_table]['id']);
        response.add(Item(
            id: item[_table]['id'],
            name: item[_table]['name'],
            description: item[_table]['description'],
            availability: item[_table]['availability'],
            businessFk: item[_table]['businessFk'],
            highQualityPhoto: item[_table]['highQualityPhoto'],
            highQualityPhotoBlurHash: item[_table]['highQualityPhotoBlurHash'],
            lowQualityPhoto: item[_table]['lowQualityPhoto'],
            lowQualityPhotoBlurHash: item[_table]['lowQualityPhotoBlurHash'],
            thumbnail: item[_table]['thumbnail'],
            thumbnailBlurHash: item[_table]['thumbnailBlurHash'],
            photos: null,
            businessItemCategoryFk: item[_table]['businessItemCategoryFk'],
            price: item[_table]['price'],
            cursor: item[_table]['cursor'],
            status: parseItemStatusTypeEnum(item[_table]['status']),
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
      if (photos) {
        List<ItemPhoto> listItemPhoto = [];
        if (paths.isEmpty || paths.any((element) => element.name == 'photos')) {
          final photos = await _database
              .list(context: context, table: 'ItemPhoto', where: [
            WhereNormalAttributeIn(key: 'itemFk', value: ids),
          ], attributes: []);
          for (var item in photos) {
            listItemPhoto.add(ItemPhoto(
              id: item['ItemPhoto']['id'],
              itemFk: item['ItemPhoto']['itemFk'],
              highQualityPhoto: item['ItemPhoto']['highQualityPhoto'],
              highQualityPhotoBlurHash: item['ItemPhoto']
                  ['highQualityPhotoBlurHash'],
              lowQualityPhoto: item['ItemPhoto']['lowQualityPhoto'],
              lowQualityPhotoBlurHash: item['ItemPhoto']
                  ['lowQualityPhotoBlurHash'],
              thumbnail: item['ItemPhoto']['thumbnail'],
              thumbnailBlurHash: item['ItemPhoto']['thumbnailBlurHash'],
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
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
