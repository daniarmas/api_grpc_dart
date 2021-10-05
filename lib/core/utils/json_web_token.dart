import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

import '../../environment.dart';

@Injectable()
class JsonWebToken {
  final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();

  String generateAuthorizationToken({required Map<String, dynamic> payload}) {
    final jwt = JWT(payload);
    return jwt.sign(SecretKey(_environment.jsonWebTokenSecretKey),
        expiresIn: Duration(days: 1));
  }

  String generateRefreshToken({required Map<String, dynamic> payload}) {
    final jwt = JWT(payload);
    return jwt.sign(SecretKey(_environment.jsonWebTokenSecretKey),
        expiresIn: Duration(days: 7));
  }

  Map<String, dynamic> verify(String token, String tokenName) {
    try {
      final jwt =
          JWT.verify(token, SecretKey(_environment.jsonWebTokenSecretKey));
      return jwt.payload;
    } on JWTExpiredError {
      throw GrpcError.internal('$tokenName expired');
    } on JWTError catch (ex) {
      throw GrpcError.internal('$tokenName with invalid signature');
    }
  }
}
