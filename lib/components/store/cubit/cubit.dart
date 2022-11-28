import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c4b/components/store/cubit/repository.dart';
import 'package:c4b/components/store/models/request/store_list_req.dart';

import 'package:c4b/repository/api_service_repo/models/response/messageResModel.dart';
import 'package:flutter/material.dart';

part 'states.dart';

class StoreCubit extends Cubit<StoreStates> {
  final StoreRepository repository;


  StoreCubit({
    required this.repository,
  }) : super(StoreUnInitialized());

  Future<void> getData(StoreListReqModel model) async {
    emit(StoreLoading());
    var list = await repository.get(model);
  }


}
