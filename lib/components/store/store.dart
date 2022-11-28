import 'package:c4b/components/authentication/cubit/authentication/cubit.dart';
import 'package:c4b/components/common/custom_progress_indicator.dart';
import 'package:c4b/components/common/failure.dart';
import 'package:c4b/components/common/loading.dart';
import 'package:c4b/components/store/cubit/cubit.dart';
import 'package:c4b/components/store/cubit/cubit.dart';
import 'package:c4b/components/store/cubit/repository.dart';
import 'package:c4b/components/store/models/request/store_list_req.dart';
import 'package:c4b/config/constants.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:c4b/components/authentication/models/request/credential_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final _formKey = GlobalKey<FormState>();

  final sizedBox = SizedBox(height: fixtures.sizedBox.d08);

  var cubit = StoreCubit(repository: StoreRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (_) => cubit,
        child: BlocConsumer<StoreCubit, StoreStates>(
            bloc: cubit,
            listener: (context, state) {

            },
            builder: (context, state) {
              if (state is StoreUnInitialized) {
                cubit.getData(StoreListReqModel(pageNumber: 1, pageSize: 10));
              } else if (state is StoreSucceeded) {
                return Text('success');
              } else if (state is StoreFailure) {
                return FailurePage(
                    retryApiCallback: () => cubit.getData(
                        StoreListReqModel(pageNumber: 1, pageSize: 10)),
                    errorMessageModel: state.message);
              }
              return const Loading();
            }),
      )),
    );
  }

  Widget _storePage(bool isLoading) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(
        fixtures.padding.d16,
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[Text('hi')],
      ),
    );
  }
}
