import 'package:c4b/components/products/models/request/product_list_req.dart';
import 'package:c4b/components/products/models/response/product_list_res_model.dart';
import 'package:c4b/components/products/models/response/product_res_model.dart';
import 'package:c4b/api_service/api_service.dart';
import 'package:c4b/api_service/api_urls.dart';
import 'package:c4b/api_service/models/response/baseResModel.dart';

class ProductRepository {
  final ApiService _service = ApiService();

  Future<BaseResModel<ProductResModel>> get(ProductListReqModel model) async {
    var baseModel = await _service.post<ProductResModel>(
        body: model.toJson(), url: APIUrls.HomeAPI.GET_LIST);

    if (baseModel.success ?? false) {
      var list = ProductListResModel.fromJson(baseModel.payloads);

      baseModel.payloadObjects = list.productsList;
    }
    return baseModel;
  }
}
