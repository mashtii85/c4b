class CredentialModelReq {
  String? username;
  String? password;

  // ignore: non_constant_identifier_names

  CredentialModelReq({this.username, this.password});

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
