import 'dart:convert';

class JwtResModel {
  JwtResModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  late final String accessToken;
  late final String tokenType;
  late final int expiresIn;

  JwtResModel.fromJson(String encodedJson) {
    var json = jsonDecode(encodedJson);
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    _data['expires_in'] = expiresIn;
    return _data;
  }
}
