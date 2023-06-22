class UserModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String userName;
  final String issued;
  final String expires;

  UserModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userName,
    required this.issued,
    required this.expires,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      userName: json['userName'],
      issued: json['.issued'],
      expires: json['.expires'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'userName': userName,
      '.issued': issued,
      '.expires': expires,
    };
  }
}
