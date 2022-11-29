import 'dart:convert';

import 'package:c4b/components/product/models/request/product_list_req.dart';
import 'package:c4b/components/product/models/response/product_list_res_model.dart';
import 'package:c4b/components/product/models/response/product_res_model.dart';
import 'package:c4b/repository/api_service_repo/api_service.dart';
import 'package:c4b/repository/api_service_repo/api_urls.dart';

class ProductRepository {
  final ApiService _service = ApiService();

  Future<void> get(ProductListReqModel model) async {
    var baseModel = await _service.post<ProductResModel>(
        body: model.toJson(), url: APIUrls.HomeAPI.GET_LIST);
    var list = ProductListResModel.fromJson(baseModel.payloads);

    baseModel.payloadObjects = list.productsList;
    print((list.productsList));
    // return response;
  }
}
