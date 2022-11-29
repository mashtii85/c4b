import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c4b/components/products/cubits/repository.dart';
import 'package:c4b/components/products/models/request/product_list_req.dart';
import 'package:c4b/components/products/models/response/product_res_model.dart';

import 'package:c4b/repository/api_service_repo/models/response/messageResModel.dart';
import 'package:flutter/material.dart';

part 'states.dart';

class ProductCubit extends Cubit<ProductStates> {
  final ProductRepository repository;

  ProductCubit({
    required this.repository,
  }) : super(ProductUnInitialized());

  Future<void> getData(ProductListReqModel model) async {
    emit(ProductLoading());
    var baseModel = await repository.get(model);
    if (baseModel.success!) {
      emit(ProductFetchSuccess(baseModel!.payloadObjects!!));
    } else {
      emit(ProductFailure(MessageResModel(
          title: 'Error',
          description: baseModel.message![0].description ?? 'Unknown')));
    }
  }
}
