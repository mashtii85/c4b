
import 'package:c4b/components/authentication/models/user_credentials_model.dart';

abstract class ICredentialDao {
  Future persistToken(UserCredentialsModel userCredentials);

  Future<UserCredentialsModel?> retrieveToken();

  Future<bool> deleteToken();
}
