class CredentialResModel {
  CredentialResModel({required this.statusCode, required this.body});

  late final int statusCode;
  late final String body;

  CredentialResModel.fromJson(String stringJson) {
    //Split key value pairs
    var split = stringJson.replaceAll('}', '').split(',');

    //Extract value for each
    statusCode = int.parse((split[0].split('=')[1]));
    body = split[1].split('=')[1];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['body'] = body;
    return _data;
  }
}
