import 'package:api_grpc_dart/protos/protos/main.pb.dart';

VerificationCodeType parseVerificationCodeTypeEnum(String? value) {
  if (value == 'CHANGE_USER_EMAIL') {
    return VerificationCodeType.CHANGE_USER_EMAIL;
  } else if (value == 'SIGN_IN') {
    return VerificationCodeType.SIGN_IN;
  } else if (value == 'SIGN_UP') {
    return VerificationCodeType.SIGN_UP;
  } else {
    return VerificationCodeType.VERIFICATION_CODE_TYPE_UNSPECIFIED;
  }
}

ItemStatusType parseItemStatusTypeEnum(String? value) {
  if (value == 'AVAILABLE') {
    return ItemStatusType.AVAILABLE;
  } else if (value == 'UNAVAILABLE') {
    return ItemStatusType.UNAVAILABLE;
  } else if (value == 'DEPRECATED') {
    return ItemStatusType.DEPRECATED;
  } else {
    return ItemStatusType.ITEM_STATUS_TYPE_UNSPECIFIED;
  }
}

BusinessStatusType parseBusinessStatusTypeEnum(String? value) {
  if (value == 'AVAILABLE') {
    return BusinessStatusType.BUSINESS_AVAILABLE;
  } else if (value == 'UNAVAILABLE') {
    return BusinessStatusType.BUSINESS_UNAVAILABLE;
  } else {
    return BusinessStatusType.BUSINESS_STATUS_TYPE_UNSPECIFIED;
  }
}

PlatformType parsePlatformTypeEnum(String? value) {
  if (value == 'ANDROID') {
    return PlatformType.ANDROID;
  } else if (value == 'IOS') {
    return PlatformType.IOS;
  } else {
    return PlatformType.PLATFORM_TYPE_UNSPECIFIED;
  }
}

AppType parseAppTypeEnum(String? value) {
  if (value == 'APP') {
    return AppType.APP;
  } else if (value == 'BUSINESS_APP') {
    return AppType.BUSINESS_APP;
  } else {
    return AppType.APP_TYPE_UNSPECIFIED;
  }
}

List<Polygon> parsePolygon(List<dynamic> parameter) {
  List<Polygon> list = [];
  for (var item in parameter) {
    list.add(Polygon(coordinates: [item[0], item[1]]));
  }
  return list;
}
