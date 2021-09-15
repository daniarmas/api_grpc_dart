import 'package:api_grpc_dart/data/database/database.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';
import '../repositories/business_repository.dart';

class BusinessService extends BusinessServiceBase {
  @override
  Future<ListBusinessResponse> listBusiness(
      ServiceCall call, ListBusinessRequest request) async {
    try {
      late ListBusinessResponse response;
      late Either<GrpcError, Iterable<Business>> result;
      BusinessRepository businessRepository = GetIt.I<BusinessRepository>();
      Database database = GetIt.I<Database>();
      var connection = await database.getConnection();
      connection.transaction((context) async {
        result = await businessRepository.listBusiness(
            latLng: LatLng(
                latitude: request.coordinates.latitude,
                longitude: request.coordinates.longitude),
            notIds: request.notIds,
            context: context);
      });
      result.fold((l) => {throw Exception(l)},
          (r) => {response = ListBusinessResponse(business: r)});
      return response;
    } catch (error) {
      return ListBusinessResponse(business: []);
    }
  }
}
