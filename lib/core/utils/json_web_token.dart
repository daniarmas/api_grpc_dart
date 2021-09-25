import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:get_it/get_it.dart';

import '../../environment.dart';

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
}
