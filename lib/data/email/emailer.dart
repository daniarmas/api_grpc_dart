import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class Emailer {
  Future<bool> connect();
  void close();
  Future<void> getConnection();
  Future<void> sendMail(
      {required String body,
      required String recipient,
      required String subject});
  Future<void> sendVerificationCodeMail(
      {required String recipient,
      required String code,
      required VerificationCodeType verificationCodeType,
      required String ip,
      required String device,
      required DateTime time});
  Future<void> sendSignInMail(
      {required String recipient,
      required String ip,
      required String device,
      required DateTime time});
  Future<void> sendSignUpMail({required String recipient});
}
