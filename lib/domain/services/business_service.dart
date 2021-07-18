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
      BusinessRepository businessRepository = GetIt.I<BusinessRepository>();
      final result = await businessRepository.listBusiness();
      result.fold((l) => {throw Exception(l)},
          (r) => {response = ListBusinessResponse(business: r)});
      return response;
    } catch (error) {
      return ListBusinessResponse(business: []);
    }
  }
}
