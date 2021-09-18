import 'package:protobuf/protobuf.dart' as $pb;

Map<String, dynamic> getRequestData($pb.GeneratedMessage request,
    {Map<String, dynamic>? add}) {
  Map<String, dynamic> data = {};
  request.info_.fieldInfo.forEach((key, value) {
    if (value.name != 'fieldMask' && request.getField(value.tagNumber) != '') {
      data.addAll({value.name: request.getField(value.tagNumber)});
    }
  });
  if (add != null) {
    data.addAll(add);
  }
  return data;
}
