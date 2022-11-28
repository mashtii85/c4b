library fixtures_provider;

import 'package:c4b/repository/login_repo/models/response/jwt_res_model.dart';

String? _baseUrl;

late JwtResModel _jwtPayload;

set baseUrl(String? value) {
  _baseUrl = value;
}

String? get baseUrl => _baseUrl;

JwtResModel get jwtPayload => _jwtPayload;

set jwtPayload(JwtResModel jwt) {
  _jwtPayload = jwt;
}

String? get token => _jwtPayload.tokenType != null
    ? '${jwtPayload.tokenType} ${_jwtPayload.accessToken}'
    : null;
