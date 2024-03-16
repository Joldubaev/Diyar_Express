import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? userName;
  String? email;
  String? phone;
  String? role;

  UserModel({
    this.userName,
    this.email,
    this.phone,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["userName"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "phone": phone,
        "role": role,
      };
}
