import 'dart:convert';

import 'package:c4b/components/authentication/cubit/daos/implementation/credential_dao.dart';
import 'package:c4b/repository/api_service_repo/api_service.dart';
import 'package:c4b/repository/api_service_repo/api_urls.dart';
import 'package:c4b/repository/login_repo/models/request/credential_model.dart';
import 'package:c4b/repository/login_repo/models/response/credential_res_model.dart';

class AuthenticateRepository extends CredentialDao{
  ApiService _service = ApiService();

  Future<CredentialResModel> login(CredentialModelReq credentials) async {
    var stringResponse = await _service.getCredential(
        url: APIUrls.CredentialAPI.GET_TOKEN, body: credentials.toJson());
    var response = CredentialResModel.fromJson(stringResponse);

    return response;
  }
}
