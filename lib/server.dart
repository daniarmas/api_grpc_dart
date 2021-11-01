import 'dart:async';

import 'package:api_grpc_dart/domain/services/business_service.dart';
import 'package:api_grpc_dart/domain/services/object_storage_service.dart';
import 'package:api_grpc_dart/domain/services/user_service.dart';
import 'package:api_grpc_dart/interceptors.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc.dart';
import 'package:shutdown/shutdown.dart' as shutdown;

import 'data/database/database.dart';
import 'data/email/emailer.dart';
import 'domain/services/authentication_service.dart';
import 'domain/services/health_service.dart';
import 'domain/services/hostname_service.dart';
import 'domain/services/item_service.dart';
import 'environment.dart';

class Server {
  static final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();
  static final Emailer _emailer = GetIt.I<Emailer>();
  static final Database _database = GetIt.I<Database>();

  static Future<void> init() async {
    await _database.connect().then((value) async {
      if (value) {
        await _emailer.connect();
        final server = grpc.Server([
          AuthenticationService(),
          HealthService(),
          HostnameService(),
          ObjectStorageService(),
          BusinessService(),
          ItemService(),
          UserService(),
        ], [
          (ServiceCall call, ServiceMethod method) {
            var accessTokenValidResponse = accessTokenValid(call, method);
            var checkClientMetadataResponse = checkClientMetadata(call, method);
            if (accessTokenValidResponse is GrpcError) {
              return accessTokenValidResponse;
            } else if (checkClientMetadataResponse is GrpcError) {
              return checkClientMetadataResponse;
            } else {
              return null;
            }
          },
          (ServiceCall call, ServiceMethod method) {
            return authorizationTokenValid(call, method, [
              'ListBusiness',
              'GetBusiness',
              'ListItem',
              'GetItem',
              'SignOut',
              'ListSession',
              'UpdateUser',
            ]);
          }
        ]);
        await server.serve(port: _environment.port);
        print('🚀 Server listening at port ${server.port}...');
      }
    }).catchError((error) {
      throw Exception(error);
    });
    shutdown.addHandler(() async {
      _database.close();
      _emailer.close();
    });
  }
}
