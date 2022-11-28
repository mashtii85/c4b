class UserCredentialsModel {

  UserCredentialsModel();

  late final String username;
  late final String password;
  late final String accessToken;
  late final String tokenType;
  late final DateTime expireDate;
  late final expiresIn;

  late final bool isExpired;

  bool get _isExpired {
    print(DateTime.now().difference(expireDate).inSeconds);
    var expiary = DateTime.now().difference(expireDate).inSeconds;

    return   expiary > expiresIn;
  }

  UserCredentialsModel.fromJson(Map<String, dynamic> json) {
    var jsonDate = json['expire_date'];
    DateTime _expireDate=DateTime(1970, 1, 1);
    if(jsonDate!=null){
       _expireDate =  DateTime.parse(jsonDate);
    }
    username = json['username'];
    password = json['password'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'] as int;
    expireDate = _expireDate;
    isExpired = _isExpired;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['expire_date'] = expireDate.toString();
    return data;
  }
}
