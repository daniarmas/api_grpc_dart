class Environment {
  final int port;
  final String databaseHost;
  final int databasePort;
  final String databaseDatabase;
  final String databaseUsername;
  final String databasePassword;

  Environment({
    required this.port,
    required this.databaseHost,
    required this.databasePort,
    required this.databaseDatabase,
    required this.databaseUsername,
    required this.databasePassword,
  });
}
