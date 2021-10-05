class EnvironmentApp {
  final int port;
  final String databaseHost;
  final int databasePort;
  final String databaseDatabase;
  final String databaseUsername;
  final String databasePassword;
  final String jsonWebTokenSecretKey;
  final String kubernetesApiToken;
  final String kubernetesApiService;
  final String emailHost;
  final int emailPort;
  final String emailUsername;
  final String emailPassword;
  final String emailFrom;
  final String emailFromContactName;

  EnvironmentApp(
      {required this.emailHost,
      required this.emailPort,
      required this.emailFrom,
      required this.emailFromContactName,
      required this.emailPassword,
      required this.emailUsername,
      required this.kubernetesApiToken,
      required this.kubernetesApiService,
      required this.port,
      required this.databaseHost,
      required this.databasePort,
      required this.databaseDatabase,
      required this.databaseUsername,
      required this.databasePassword,
      required this.jsonWebTokenSecretKey});
}
