import '../../../../core/core.dart';
import '../../../../environment_configs.dart';
import 'api_user_model.dart';

class ApiLoggedUserResponse {
  final String accessToken;
  final ApiUserModel user;

  const ApiLoggedUserResponse({required this.accessToken, required this.user});

  factory ApiLoggedUserResponse.fromJson(Map<String, dynamic> json) =>
      ApiLoggedUserResponse(accessToken: json["token"] ?? '', user: ApiUserModel.fromJson(EnvironmentsConfig.appEnvironment == AppEnvironmentEnum.client ? json["user"] : json["provider"]));

  TokenModel get getTokenForSingleSession {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel.forSingleSession(token: accessToken);
  }

  TokenModel get getAsValidTokenEntity {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel(token: accessToken);
  }
}
