class Tokens {
  const Tokens({
    required this.accessToken,
    required this.role,
    required this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> map) {
    return Tokens(
      accessToken: map['accessToken'] as String,
      role: map['role'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  final String accessToken;
  final String role;
  final String refreshToken;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'access_Token': accessToken,
      'role': role,
      'refreshToken': refreshToken,
    };
  }
}
