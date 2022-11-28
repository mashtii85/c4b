class CredentialReqModel {
  String? username;
  String? password;

  CredentialReqModel({this.username, this.password});

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
