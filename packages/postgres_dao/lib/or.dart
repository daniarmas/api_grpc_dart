import 'package:postgres_dao/where.dart';
import 'package:postgres_dao/where_attribute.dart';

class Or extends Where {
  final List<WhereAttribute> attributes;

  Or(this.attributes);
}
