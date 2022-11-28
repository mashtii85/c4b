class UserCredentialsModel {
  String? username;
  String? password;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  DateTime? expireDate;

  DateTime? get _expireDate => DateTime.now().add(Duration(milliseconds: expiresIn!));

  UserCredentialsModel(
      {this.username,
      this.password,
      this.accessToken,
      this.tokenType,
      this.expiresIn});

  UserCredentialsModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'] as int;
    expireDate = _expireDate;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
