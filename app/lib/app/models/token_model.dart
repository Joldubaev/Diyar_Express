class TokenModel {
  TokenModel({
    required this.token,
    required this.refreshToken,
    required this.accessToken,
  });
  final String token;
  final String refreshToken;
  final String accessToken;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "accessToken": accessToken,
      };
}
