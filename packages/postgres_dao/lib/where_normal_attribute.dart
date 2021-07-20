import 'where_attribute.dart';

class WhereNormalAttribute extends WhereAttribute {
  WhereNormalAttribute(
      {required String key, required dynamic value, required String table})
      : super(key: '"$key"', value: value);
}
