import 'package:protobuf/protobuf.dart' as $pb;

Map<String, dynamic> getRequestData($pb.GeneratedMessage request,
    {Map<String, dynamic>? add, List<dynamic>? enums}) {
  Map<String, dynamic> data = {};
  request.info_.fieldInfo.forEach((key, value) {
    if (value.name != 'fieldMask' && request.getField(value.tagNumber) != '') {
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

bool isEnum(dynamic data) {
  final split = data.toString().split('.');
  return split.length > 1 && split[0] == data.runtimeType.toString();
}
