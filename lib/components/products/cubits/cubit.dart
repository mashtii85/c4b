import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c4b/components/products/cubits/repository.dart';
import 'package:c4b/components/products/models/request/product_list_req.dart';
import 'package:c4b/components/products/models/response/product_res_model.dart';

import 'package:c4b/api_service/models/response/message_res_model.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'states.dart';

class ProductCubit extends Cubit<ProductStates> {
  final ProductRepository repository;
  static List<ProductResModel> productList = [];

  ProductCubit({
    required this.repository,
  }) : super(ProductUnInitialized());

  Future<void> getData(ProductListReqModel model, bool indicatorLoading) async {
    if (!indicatorLoading) {
      emit(ProductLoading());
    }

    var baseModel = await repository.get(model);
    if (baseModel!.success ?? false) {
      productList.addAll(baseModel!.payloadObjects!!);
      emit(ProductLoading());
      emit(ProductFetchSuccess(
          productList: productList,
          hasNextPage: true,
          pageSize: model.pageSize,
          page: model.pageNumber));
    } else {
      emit(ProductFailure(MessageResModel(
          title: 'Error',
          description: baseModel.message![0].description ?? 'unknown error')));
    }
  }
}
