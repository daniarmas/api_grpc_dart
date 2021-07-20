import 'where_attribute.dart';

class WhereNormalAttribute extends WhereAttribute {
  WhereNormalAttribute(
      {required String key, required dynamic value})
      : super(key: '"$key"', value: value);
}
