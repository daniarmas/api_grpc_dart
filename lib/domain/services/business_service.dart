import 'package:api_grpc_dart/data/datasources/list_business_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/business_repository_impl.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../protos/main.pbgrpc.dart';

class BusinessService extends BusinessServiceBase {
  @override
  Future<ListBusinessResponse> listBusiness(
      ServiceCall call, ListBusinessRequest request) async {
    try {
      late ListBusinessResponse response;
      BusinessRepository businessRepositoryImpl = GetIt.I<BusinessRepository>();
      final result = await businessRepositoryImpl.listBusiness();
      result.fold((l) => {throw Exception(l)},
          (r) => {response = ListBusinessResponse(business: r)});
      return response;
    } catch (error) {
      return ListBusinessResponse(business: []);
    }
  }
}
