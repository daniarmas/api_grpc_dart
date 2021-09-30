import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../../environment.dart';
import '../../protos/protos/main.pb.dart';
import 'emailer.dart';

@Injectable(as: Emailer)
class EmailerImpl implements Emailer {
  static final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();
  static SmtpServer _smtpServer = SmtpServer(
    _environment.emailHost,
    port: _environment.emailPort,
    allowInsecure: true,
    ignoreBadCertificate: true,
    ssl: false,
    username: _environment.emailUsername,
    password: _environment.emailPassword,
  );
  static PersistentConnection _connection = PersistentConnection(_smtpServer);

  @override
  Future<void> sendMail(
      {required String body,
      required String recipient,
      required String subject}) async {
    try {
      final message = Message()
        ..from =
            Address(_environment.emailFrom, _environment.emailFromContactName)
        ..recipients.add(recipient)
        ..subject = subject
        ..text = body;
      await _connection.send(message);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> sendVerificationCodeMail(
      {required String recipient,
      required String ip,
      required VerificationCodeType verificationCodeType,
      required String code,
      required String device,
      required DateTime time}) async {
    try {
      late String subject;
      if (verificationCodeType == VerificationCodeType.SIGN_IN) {
        subject = 'Código de verificación para iniciar sesión';
      } else if (verificationCodeType == VerificationCodeType.SIGN_UP) {
        subject = 'Código de verificación para registrarte';
      } else if (verificationCodeType ==
          VerificationCodeType.CHANGE_USER_EMAIL) {
        subject = 'Código de verificación para verificar tú correo electrónico';
      }
      final message = Message()
        ..from =
            Address(_environment.emailFrom, _environment.emailFromContactName)
        ..recipients.add(recipient)
        ..subject = subject
        ..text = """

Tú código de verificación es $code. No le des este código a nadie, aunque diga que es de ${_environment.emailFromContactName}.

Fecha: ${StringUtils.formatDateTime(time)}
Dispositivo: $device
IP: $ip

Este código sirve para iniciar sesión en tu cuenta de ${_environment.emailFromContactName}. Nunca lo pedimos para nada más.

Si no solicitaste este código al intentar iniciar sesión en otro dispositivo, simplemente ignora este mensaje.""";
      await _connection.send(message);
    } catch (error) {
      rethrow;
    }
  }

  @override
  void close() async {
    try {
      await _connection.close();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> connect() async {
    try {
      _smtpServer = SmtpServer(
        _environment.emailHost,
        port: _environment.emailPort,
        allowInsecure: true,
        ignoreBadCertificate: true,
        ssl: false,
        username: _environment.emailUsername,
        password: _environment.emailPassword,
      );
      _connection = PersistentConnection(_smtpServer);
      return true;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<PersistentConnection> getConnection() async {
    try {
      return _connection;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> sendSignInMail(
      {required String recipient,
      required String ip,
      required String device,
      required DateTime time}) async {
    try {
      final message = Message()
        ..from =
            Address(_environment.emailFrom, _environment.emailFromContactName)
        ..recipients.add(recipient)
        ..subject =
            'Nuevo inicio de sesión en tu cuenta de ${_environment.emailFromContactName}'
        ..text = """

Hemos detectado un nuevo inicio de sesión en tu cuenta de ${_environment.emailFromContactName}.

Fecha: ${StringUtils.formatDateTime(time)}
Dispositivo: $device
IP: $ip

Si no reconoces este inicio de sesión, puedes cerrar todas las sesiones en los dispositivos que usen tu cuenta, navegando a la sección “Dispositivos” en la página de configuraciones en la app y seleccionar “Cerrar las demas sesiones”.

Si fuiste tú, puedes ignorar este correo.""";
      await _connection.send(message);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> sendSignUpMail({required String recipient}) async {
    // TODO: implement sendSignUpMail
    throw UnimplementedError();
  }
}
