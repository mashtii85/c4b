import 'package:c4b/components/authentication/repository.dart';
import 'package:c4b/repository/login_repo/models/request/credential_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

AuthenticationRepository repository = AuthenticationRepository();

final authenticationProvider =
    FutureProvider.family<bool, CredentialModelReq>((ref, credential) async {
  var response = await repository.login(credential);

  if(response.statusCode==200){
    return true;
  }
  return false;
});
