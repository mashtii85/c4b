library fixtures_provider;

import 'package:c4b/components/authentication/models/user_credentials_model.dart';

late String _baseUrl;

late UserCredentialsModel _userCredentials;

set baseUrl(String value) {
  _baseUrl = value;
}

String get baseUrl => _baseUrl;

UserCredentialsModel get userCredentials => _userCredentials;

set userCredentials(UserCredentialsModel credentials) {
  _userCredentials = credentials;
}

String? get token => _userCredentials.tokenType != null
    ? '${userCredentials.tokenType} ${_userCredentials.accessToken}'
    : null;
