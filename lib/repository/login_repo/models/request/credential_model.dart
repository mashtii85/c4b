class CredentialModelReq {
  String? username;
  String? password;

  CredentialModelReq({this.username, this.password});

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
