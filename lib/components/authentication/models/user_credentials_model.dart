class UserCredentialsModel {

  UserCredentialsModel();

  late final String username;
  late final String password;
  late final String accessToken;
  late final String tokenType;
  late final DateTime expireDate;

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
    expireDate = _expireDate;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expire_date'] = expireDate.toString();
    return data;
  }
}
