import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../../protos/protos/main.pb.dart';
import '../repositories/business_repository.dart';

class ListBusinessUseCase implements UseCase<Business, NoParams> {
  final BusinessRepository businessRepository;

  ListBusinessUseCase(this.businessRepository);

  @override
  Future<Either<Failure, Iterable<Business>>> call(NoParams params) async {
    return businessRepository.listBusiness(LatLng(latitude: 1, longitude: 1));
  }
}
