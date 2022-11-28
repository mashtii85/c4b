import 'package:c4b/components/authentication/repository.dart';
import 'package:c4b/components/models/request/credential_model.dart';
import 'package:c4b/components/models/response/credential_res_model.dart';
import 'package:c4b/repository/api_service_repo/models/response/baseResModel.dart';
import 'package:c4b/repository/api_service_repo/models/response/messageResModel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

AuthenticationRepository repository = AuthenticationRepository();
final commonProvider =
    StateProvider<ProviderMessageResult>((ref) => ProviderMessageResult());

final authenticationProvider = FutureProvider.autoDispose
    .family<MessageResModel?, CredentialModelReq?>((ref, credential) async {
  // return AuthenticationRepository()
  if (credential == null) {
    return null;
  }
  var response = await repository.login(credential);
  // return response;
if(response.success!){
  return response!.message![0];

}else{
  return Future.error(RangeError(response!.message![0].description!));
}
  return response!.message!.length!>0?response.message![0]: MessageResModel();
});

class ProviderMessageResult {
  late final bool success;
  late final String message;
  late final String description;
}
