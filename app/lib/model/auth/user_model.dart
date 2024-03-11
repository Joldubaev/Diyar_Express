class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['userName'],
      email: json['email'],
      phoneNumber: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': name,
      'email': email,
      'phone': phoneNumber,
      'password': password,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
