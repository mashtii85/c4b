class UserCredentialsModel {
  // UserCredentialsModel(
  //     {required this.username,
  //     required this.password,
  //     required this.accessToken,
  //     required this.tokenType,
  //     required this.expireDate});
  UserCredentialsModel();

  late final String username;
  late final String password;
  late final String accessToken;
  late final String tokenType;
  late final DateTime expireDate;

  UserCredentialsModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expireDate = json['expire_date'] as DateTime;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expire_date'] = expireDate;
    return data;
  }
}
