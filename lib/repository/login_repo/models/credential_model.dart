class CredentialModel {
  String? username;
  String? password;
  // ignore: non_constant_identifier_names

  CredentialModel({this.username, this.password});

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password, 'grant_type': 'password'};
}
