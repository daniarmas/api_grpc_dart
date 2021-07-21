import 'package:postgres_dao/where.dart';

class WhereAttribute implements Where {
  final String key;
  final dynamic value;

  WhereAttribute({required this.key, required this.value});
}
