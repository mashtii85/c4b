import 'package:c4b/components/product/models/response/product_res_model.dart';
import 'package:flutter/material.dart';

class ProductListResModel {
  ProductListResModel();

  late final List<ProductResModel> productsList;

  ProductListResModel.fromJson(List<Map<String, dynamic>> json) {
    try {
      productsList = json.map((e) => ProductResModel.fromJson(e)).toList();
    } catch (error) {
      debugPrint(error.toString());
      productsList = [];
    }
  }
}
