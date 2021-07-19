import 'attribute.dart';

class NormalAttribute extends Attribute {
  NormalAttribute({required String name, required String table})
      : super(name: '"$table"."$name"', table: table);
}