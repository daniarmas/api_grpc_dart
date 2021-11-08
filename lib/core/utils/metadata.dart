import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

class HeadersMetadata {
  final String accesstoken;
  final String? authorizationToken;
  final String? refreshToken;
  final PlatformType platform;
  final String ipv4;
  final String ipv6;
  final String systemLanguage;
  final String networkType;
  final String systemVersion;
  final String appVersion;
  final AppType app;
  final String deviceId;
  final String model;
  final String firebaseCloudMessagingId;

  const HeadersMetadata(
      {required this.accesstoken,
      required this.platform,
      required this.systemVersion,
      required this.appVersion,
      required this.app,
      required this.systemLanguage,
      required this.networkType,
      required this.ipv4,
      required this.ipv6,
      required this.deviceId,
      required this.model,
      required this.firebaseCloudMessagingId,
      this.authorizationToken,
      this.refreshToken});

  HeadersMetadata.fromServiceCall(ServiceCall call)
      : accesstoken = call.clientMetadata!['accesstoken']!,
        app = parseAppTypeEnum(call.clientMetadata!['app']!),
        appVersion = call.clientMetadata!['appversion']!,
        authorizationToken = call.clientMetadata!['authorization'],
        deviceId = call.clientMetadata!['deviceid']!,
        ipv4 = call.clientMetadata!['ipv4']!,
        ipv6 = call.clientMetadata!['ipv6']!,
        systemLanguage = call.clientMetadata!['systemlanguage']!,
        networkType = call.clientMetadata!['networktype']!,
        firebaseCloudMessagingId =
            call.clientMetadata!['firebasecloudmessagingid']!,
        model = call.clientMetadata!['model']!,
        platform = parsePlatformTypeEnum(call.clientMetadata!['platform']!),
        refreshToken = call.clientMetadata!['refreshtoken'],
        systemVersion = call.clientMetadata!['systemversion']!;
}
