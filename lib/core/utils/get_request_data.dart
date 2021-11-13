// Package imports:
import 'package:postgres_conector/postgres_conector.dart';
import 'package:protobuf/protobuf.dart' as $pb;

Map<String, dynamic> getRequestData(
  $pb.GeneratedMessage request, {
  Map<String, dynamic>? add,
  List<dynamic>? enums,
  List<Attribute>? updatePaths,
}) {
  if (updatePaths == null) {
    Map<String, dynamic> data = {};
    request.info_.fieldInfo.forEach((key, value) {
      if (value.name != 'fieldMask' &&
          value.name != 'updateMask' &&
          request.getField(value.tagNumber) != '') {
        if (request.getField(value.tagNumber) is $pb.ProtobufEnum) {
          if (request.getField(value.tagNumber).value != 0) {
            data.addAll({value.name: request.getField(value.tagNumber)});
          }
        } else {
          data.addAll({value.name: request.getField(value.tagNumber)});
        }
      }
    });
    if (add != null) {
      data.addAll(add);
    }
    return data;
  } else if (updatePaths.isEmpty) {
    Map<String, dynamic> data = {};
    request.info_.fieldInfo.forEach((key, value) {
      if (value.name != 'fieldMask' && value.name != 'updateMask') {
        if (request.getField(value.tagNumber) is $pb.ProtobufEnum) {
          if (request.getField(value.tagNumber).value != 0) {
            data.addAll({value.name: request.getField(value.tagNumber)});
          }
        } else {
          data.addAll({value.name: request.getField(value.tagNumber)});
        }
      }
    });
    if (add != null) {
      data.addAll(add);
    }
    return data;
  } else {
    Map<String, dynamic> data = {};
    request.info_.fieldInfo.forEach((key, value) {
      if (value.name != 'fieldMask' &&
          request.getField(value.tagNumber) != '' &&
          (updatePaths.any((element) => element.name == value.name) ||
              value.name == 'id')) {
        if (request.getField(value.tagNumber) is $pb.ProtobufEnum) {
          if (request.getField(value.tagNumber).value != 0) {
            data.addAll({value.name: request.getField(value.tagNumber)});
          }
        } else {
          data.addAll({value.name: request.getField(value.tagNumber)});
        }
      }
    });
    if (add != null) {
      data.addAll(add);
    }
    return data;
  }
}

List<Attribute> getPaths(List<String> paths) {
  List<Attribute> response = [];
  for (var item in paths) {
    response.add(NormalAttribute(name: item));
  }
  return response;
}

bool isEnum(dynamic data) {
  final split = data.toString().split('.');
  return split.length > 1 && split[0] == data.runtimeType.toString();
}
