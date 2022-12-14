import 'dart:convert';

import 'package:c4b/components/authentication/cubit/daos/implementation/credential_dao.dart';
import 'package:c4b/api_service/api_service.dart';
import 'package:c4b/api_service/api_urls.dart';
import 'package:c4b/components/authentication/models/request/credential_req_model.dart';
import 'package:c4b/components/authentication/models/response/credential_res_model.dart';

class AuthenticateRepository extends CredentialDao{
  final ApiService _service = ApiService();

  Future<CredentialResModel> login(CredentialReqModel credentials) async {
    var stringResponse = await _service.getCredential(
        url: APIUrls.CredentialAPI.GET_TOKEN, body: credentials.toJson());
    var response = CredentialResModel.fromJson(stringResponse);

    return response;
  }
}
