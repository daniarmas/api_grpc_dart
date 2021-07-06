import 'package:dotenv/dotenv.dart' show load, env;

class Environment {
  final int PORT;
  final String POSTGRESDB_URI;

  Environment({
    required this.PORT,
    required this.POSTGRESDB_URI,
  });

  factory Environment.development() {
    load();
    return Environment(
      PORT: int.parse(env['PORT'] ?? '9000'),
      POSTGRESDB_URI: env['POSTGRESDB_URI'] ??
          'postgres://postgres:postgres@192.168.0.2:54322/database',
    );
  }

  factory Environment.production() {
    load();
    return Environment(
      PORT: int.parse(env['PORT'] ?? '9000'),
      POSTGRESDB_URI: env['POSTGRESDB_URI'] ??
          'postgres://postgres:postgres@192.168.0.2:54322/postgres',
    );
  }
}
