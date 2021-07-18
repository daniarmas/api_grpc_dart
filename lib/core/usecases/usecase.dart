import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../protos/protos/main.pb.dart';
import '../error/failure.dart';

// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Iterable<Business>>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
