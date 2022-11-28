
import 'package:c4b/repository/login_repo/models/response/jwt_res_model.dart';

abstract class ICredentialDao {
  Future persistToken(JwtResModel token);

  Future<JwtResModel?> retrieveToken();

  Future<bool> deleteToken();
}
