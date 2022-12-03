class _CredentialAPI {
  get GET_TOKEN => 'token';

  get ACCESS_TOKEN_LOCAL => "access_token";

  get GET_USER_CREDENTIAL_LOCAL => "user_credential";
}

class _HomeAPI {
  get GET_LIST => '';
}

class APIUrls {
  static _CredentialAPI get CredentialAPI => _CredentialAPI();

  static _HomeAPI get HomeAPI => _HomeAPI();
}
