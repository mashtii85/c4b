import 'dart:convert';

import 'package:c4b/components/models/request/credential_model.dart';
import 'package:c4b/components/models/response/credential_res_model.dart';
import 'package:c4b/repository/api_service_repo/api_service.dart';
import 'package:c4b/repository/api_service_repo/api_urls.dart';
import 'package:c4b/repository/api_service_repo/models/request/credentialReqModel.dart';
import 'package:c4b/repository/api_service_repo/models/response/baseResModel.dart';
import 'package:c4b/repository/api_service_repo/models/response/messageResModel.dart';
import 'package:c4b/repository/api_service_repo/models/response/token.dart';

class AuthenticationRepository {
  final ApiService _service = ApiService();

  Future<BaseResModel> login(CredentialModelReq credentials) async {
    var stringResponse = await _service.getCredential(
        url: APIUrls.CredentialAPI.GET_TOKEN, body: credentials.toJson());
    var response = CredentialResModel.fromJson(stringResponse);

    BaseResModel _model;

    if (response.statusCode == 200) {
      var token = TokenResModel.fromJson(jsonDecode(response.body));
      _model = BaseResModel<TokenResModel>()
        ..statusCode = response.statusCode
        ..success = true
        ..message = []
        ..payloadObjects = [token];
    } else {
      _model = BaseResModel<String>()
        ..statusCode = response.statusCode
        ..success = false
        ..message = [
          MessageResModel(
              type: 'error', title: 'error', description: response.body)
        ]
        ..payloadObjects = [];
    }

    return _model;
  }
}
