import 'dart:convert';

import 'package:c4b/repository/api_service_repo/api_urls.dart';
import 'package:c4b/repository/login_repo/models/response/jwt_res_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../abstract/iCredential_dao.dart';

class CredentialDao implements ICredentialDao {
  @override
  Future<int> persistToken(JwtResModel token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        APIUrls.CredentialAPI.ACCESS_TOKEN_LOCAL, json.encode(token.toJson()));
    return 0;
  }

  @override
  Future<JwtResModel?> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    final _json = prefs.getString(APIUrls.CredentialAPI.ACCESS_TOKEN_LOCAL);
    final JwtResModel? token =
        _json != null ? JwtResModel.fromJson(json.decode(_json)) : null;
    return token;
  }

  @override
  Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    bool result = await prefs.remove(APIUrls.CredentialAPI.ACCESS_TOKEN_LOCAL);
    return result;
  }
}
