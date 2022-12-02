import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c4b/components/products/cubits/repository.dart';
import 'package:c4b/components/products/models/request/product_list_req.dart';
import 'package:c4b/components/products/models/response/product_res_model.dart';

import 'package:c4b/repository/api_service_repo/models/response/messageResModel.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'states.dart';

class ProductCubit extends Cubit<ProductStates> {
  final ProductRepository repository;
  late final List<ProductResModel> productList = [];

  ProductCubit({
    required this.repository,
  }) : super(ProductUnInitialized());

  Future<void> getData(ProductListReqModel model, bool indicatorLoading) async {
    if (indicatorLoading) {
      // ProductFetchSuccess(
      //     productList: productList,
      //     hasNextPage: true,
      //     pageSize: model.pageSize,
      //     page: model.pageNumber);
    } else {
      emit(ProductLoading());
    }
    // await Future.delayed(const Duration(seconds: 3));

    for (var index = 0; index < model.pageSize; index++) {
      productList.add(ProductResModel(
          id: index,
          name: index.toString(),
          price: index * 4,
          color: 'red',
          count: index,
          image:
              "https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge-2022-1.jpg",
          brand: 'something$index'));
    }
    // var baseModel = await repository.get(model);
    // if (baseModel.success!) {


    emit(ProductLoading());

    if(true){
      // emit(ProductIndicatorLoading());
      // await Future.delayed(const Duration(seconds: 3));

      // productList.addAll(baseModel!.payloadObjects!!);
      emit(ProductFetchSuccess(
          productList: productList,
          hasNextPage: true,
          pageSize: model.pageSize,
          page: model.pageNumber));
    } else {
      emit(ProductFailure(MessageResModel(
          title: 'Error',
          description: '')));
      // emit(ProductFailure(MessageResModel(
      //     title: 'Error',
      //     description: baseModel.message![0].description ?? 'Unknown')));
    }
  }
}
