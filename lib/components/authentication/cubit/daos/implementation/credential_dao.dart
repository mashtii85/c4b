import 'dart:convert';

import 'package:c4b/components/authentication/models/user_credentials_model.dart';
import 'package:c4b/api_service/api_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../abstract/iCredential_dao.dart';

class CredentialDao implements ICredentialDao {
  @override
  Future<bool> persistToken(
      UserCredentialsModel userCredentials) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
          APIUrls.CredentialAPI.ACCESS_TOKEN_LOCAL, json.encode(userCredentials.toJson()));
      return true;
    }catch(error){
      debugPrint(error.toString());
      return false;
    }
  }

  @override
  Future<UserCredentialsModel?> retrieveToken() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      final _json = prefs.getString(APIUrls.CredentialAPI.ACCESS_TOKEN_LOCAL);
      final UserCredentialsModel? token =
      _json != null ? UserCredentialsModel.fromJson(json.decode(_json)) : null;
      return token;

    }catch(error){
      debugPrint(error.toString());
      return null;
    }
  }

  @override
  Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    bool result = await prefs.remove(APIUrls.CredentialAPI.ACCESS_TOKEN_LOCAL);
    return result;
  }
}
