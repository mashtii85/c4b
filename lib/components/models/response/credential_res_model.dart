class CredentialResModel {
  CredentialResModel({required this.statusCode, required this.body});

  late final int statusCode;
  late final dynamic body;

  CredentialResModel.fromJson(String stringJson) {
    //Split key value pairs
    var string = stringJson.trim().replaceAll(RegExp(r"\s+"), "");
    var bodyIndex = string.indexOf(',body=');
    body = string.substring(bodyIndex+6,string.length-1);

    var statusIndex=string.indexOf('statusCode=');
    statusCode = int.parse(string.substring(statusIndex+11,bodyIndex));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['body'] = body;
    return _data;
  }
}
