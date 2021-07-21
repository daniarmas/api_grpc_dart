import 'package:postgres_dao/where.dart';
import 'package:postgres_dao/where_attribute.dart';

class And extends Where {
  final List<WhereAttribute> attributes;

  And(this.attributes);
}
