import 'package:c4b/components/store/models/request/store_list_req.dart';
import 'package:c4b/repository/api_service_repo/api_service.dart';
import 'package:c4b/repository/api_service_repo/api_urls.dart';

class StoreRepository {
  final ApiService _service = ApiService();

  Future<void> get(StoreListReqModel model) async {
    var stringResponse = await _service.post(
        body: model.toJson(), url: APIUrls.HomeAPI.GET_LIST);
    // var response = CredentialResModel.fromJson(stringResponse);
    print(stringResponse);
    // return response;
  }
}
