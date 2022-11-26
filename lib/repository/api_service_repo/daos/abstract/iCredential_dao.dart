import '../../models/response/credentialResModel.dart';

abstract class ICredentialDao {
  Future persistToken(CredentialResModel token);

  Future<CredentialResModel?> retrieveToken();

  Future<bool> deleteToken();
}
