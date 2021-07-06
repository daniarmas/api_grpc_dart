import 'package:dotenv/dotenv.dart' show load, env;

class Environment {
  final int port;
  final String postgresdbUri;

  Environment({
    required this.port,
    required this.postgresdbUri,
  });

  factory Environment.development() {
    load();
    return Environment(
      port: int.parse(env['PORT'] ?? '9000'),
      postgresdbUri: env['POSTGRESDB_URI'] ??
          'postgres://postgres:postgres@192.168.0.2:54322/database',
    );
  }

  factory Environment.production() {
    load();
    return Environment(
      port: int.parse(env['PORT'] ?? '9000'),
      postgresdbUri: env['POSTGRESDB_URI'] ??
          'postgres://postgres:postgres@192.168.0.2:54322/postgres',
    );
  }
}
