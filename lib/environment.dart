class EnvironmentApp {
  final bool debug;
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
  final String objectStorageEndpoint;
  final String objectStorageAccessKey;
  final String objectStorageSecretKey;
  final int objectStoragePort;
  final String objectStorageUserAvatarBucket;
  final String objectStoragePathPrefix;

  EnvironmentApp(
      {required this.objectStoragePathPrefix,
      required this.objectStorageUserAvatarBucket,
      required this.debug,
      required this.objectStoragePort,
      required this.objectStorageEndpoint,
      required this.objectStorageAccessKey,
      required this.objectStorageSecretKey,
      required this.emailHost,
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
