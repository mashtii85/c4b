import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c4b/components/product/cubit/repository.dart';
import 'package:c4b/components/product/models/request/product_list_req.dart';

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
    var list = await repository.get(model);
    emit(ProductFetchSuccess());
  }


}
