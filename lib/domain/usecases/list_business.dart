import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../protos/main.pb.dart';
import '../repositories/business_repository.dart';

class ListBusinessUseCase implements UseCase<Business, NoParams> {
  final BusinessRepository businessRepository;

  ListBusinessUseCase(this.businessRepository);

  @override
  Future<Either<Failure, List<Business>>> call(NoParams params) async {
    return await businessRepository.listBusiness();
  }
}
