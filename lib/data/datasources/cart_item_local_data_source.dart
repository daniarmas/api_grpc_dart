// Package imports:
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import '../../protos/protos/main.pb.dart';

abstract class CartItemLocalDataSource {
  Future<List<Item>> listCartItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<Item?> getCartItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});
}

@Injectable(as: CartItemLocalDataSource)
class CartItemLocalDataSourceImpl implements CartItemLocalDataSource {
  final Database _database;
  static final String _table = 'CartItem';

  CartItemLocalDataSourceImpl(this._database);

  @override
  Future<Item?> getCartItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
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
              tableValue: 'itemFk',
              relationValue: 'id',
              relationTable: 'Item'),
          attributes: getPath);
      if (result != null) {
        List<ItemPhoto> listItemPhoto = [];
        if (paths.isEmpty || paths.any((element) => element.name == 'photos')) {
          final photos = await _database.list(
            context: context,
            table: 'ItemPhoto',
            where: [
              WhereNormalAttributeEqual(
                key: 'itemFk',
                value: result[_table]['id'],
              )
            ],
            attributes: [],
          );
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
          description: result['Item']['description'],
          availability: result['Item']['availability'],
          businessFk: result['Item']['businessFk'],
          highQualityPhoto: result['Item']['highQualityPhoto'],
          highQualityPhotoBlurHash: result['Item']['highQualityPhotoBlurHash'],
          lowQualityPhoto: result['Item']['lowQualityPhoto'],
          lowQualityPhotoBlurHash: result['Item']['lowQualityPhotoBlurHash'],
          thumbnail: result['Item']['thumbnail'],
          thumbnailBlurHash: result['Item']['thumbnailBlurHash'],
          cursor: result['Item']['cursor'],
          photos: listItemPhoto,
          businessItemCategoryFk: null,
          status: null,
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
  Future<List<Item>> listCartItem(
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
          innerJoin: InnerJoin(
              table: _table,
              tableValue: 'itemFk',
              relationValue: 'id',
              relationTable: 'Item'),
          where: [
            WhereNormalAttributeHigher(key: 'name', value: data['nextPage']),
            WhereNormalAttributeEqual(key: 'userFk', value: data['userFk']),
          ],
          limit: 5);
      List<Item> response = [];
      for (var item in result) {
        ids.add(item[_table]['id']);
        response.add(Item(
            id: item[_table]['id'],
            name: item[_table][_table],
            description: item['Item']['description'],
            availability: item['Item']['availability'],
            businessFk: item['Item']['businessFk'],
            highQualityPhoto: item['Item']['highQualityPhoto'],
            highQualityPhotoBlurHash: item['Item']['highQualityPhotoBlurHash'],
            lowQualityPhoto: item['Item']['lowQualityPhoto'],
            lowQualityPhotoBlurHash: item['Item']['lowQualityPhotoBlurHash'],
            thumbnail: item['Item']['thumbnail'],
            thumbnailBlurHash: item['Item']['thumbnailBlurHash'],
            photos: null,
            businessItemCategoryFk: item['Item']['businessItemCategoryFk'],
            price: item[_table]['price'],
            cursor: item['Item']['cursor'],
            status: parseItemStatusTypeEnum(item['Item']['status']),
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
