import 'package:api_grpc_dart/protos/protos/main.pb.dart';

VerificationCodeType parseVerificationCodeTypeEnum(String? value) {
  if (value == 'ChangeUserEmail') {
    return VerificationCodeType.ChangeUserEmail;
  } else if (value == 'SignIn') {
    return VerificationCodeType.SignIn;
  } else if (value == 'SignUp') {
    return VerificationCodeType.SignUp;
  } else {
    return VerificationCodeType.VerificationCodeTypeUnspecified;
  }
}

ItemStatusType parseItemStatusTypeEnum(String? value) {
  if (value == 'Available') {
    return ItemStatusType.Available;
  } else if (value == 'Unavailable') {
    return ItemStatusType.Unavailable;
  } else if (value == 'Deprecated') {
    return ItemStatusType.Deprecated;
  } else {
    return ItemStatusType.ItemStatusTypeUnspecified;
  }
}

BusinessStatusType parseBusinessStatusTypeEnum(String? value) {
  if (value == 'Available') {
    return BusinessStatusType.BusinessAvailable;
  } else if (value == 'Unavailable') {
    return BusinessStatusType.BusinessUnavailable;
  } else {
    return BusinessStatusType.BusinessStatusTypeUnspecified;
  }
}

PlatformType parsePlatformTypeEnum(String? value) {
  if (value == 'Android') {
    return PlatformType.Android;
  } else if (value == 'IOS') {
    return PlatformType.IOS;
  } else {
    return PlatformType.PlatformTypeUnspecified;
  }
}

AppType parseAppTypeEnum(String? value) {
  if (value == 'App') {
    return AppType.App;
  } else if (value == 'BusinessApp') {
    return AppType.BusinessApp;
  } else {
    return AppType.AppTypeUnspecified;
  }
}

List<Polygon> parsePolygon(List<dynamic> parameter) {
  List<Polygon> list = [];
  for (var item in parameter) {
    list.add(Polygon(coordinates: [item[0], item[1]]));
  }
  return list;
}
