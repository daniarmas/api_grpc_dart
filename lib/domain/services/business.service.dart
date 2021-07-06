import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';

import '../../data/grpc/main.pbgrpc.dart';

class BusinessService extends BusinessServiceBase {
  @override
  Future<ListBusinessResponse> listBusiness(
      ServiceCall call, ListBusinessRequest request) async {
    try {
      var connection = GetIt.I<PostgreSQLConnection>();
      final result = await connection.mappedResultsQuery(
          'SELECT "Business"."id", "Business"."name" FROM "Business"');
      return ListBusinessResponse(
          business: result
              .map((e) => Business()..mergeFromProto3Json(e['Business'])));
    } catch (error) {
      return ListBusinessResponse(business: []);
    }
  }
}
