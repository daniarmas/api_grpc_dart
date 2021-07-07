import '../../protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class ListBusinessLocalDataSource {
  Future<List<Business>> listBusiness();
}
