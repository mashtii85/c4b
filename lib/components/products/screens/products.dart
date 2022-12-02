import 'package:c4b/components/common/failure.dart';
import 'package:c4b/components/common/loading.dart';
import 'package:c4b/components/common/paged_list_view.dart';
import 'package:c4b/components/products/cubits/cubit.dart';
import 'package:c4b/components/products/cubits/repository.dart';
import 'package:c4b/components/products/models/request/product_list_req.dart';
import 'package:c4b/components/products/screens/card.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  final sizedBox = SizedBox(height: fixtures.sizedBox.d08);

  var cubit = ProductCubit(repository: ProductRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
            create: (_) => cubit,
            child: BlocConsumer<ProductCubit, ProductStates>(
                bloc: cubit,
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ProductUnInitialized) {
                    cubit.getData(
                        ProductListReqModel(pageNumber: 1, pageSize: 10),
                        false);
                  } else if (state is ProductFetchSuccess) {
                    return PagedListView(
                        getNextPageCallBack: () =>
                            cubit.getData(
                                ProductListReqModel(
                                    pageNumber: state.page,
                                    pageSize: state.pageSize),
                                true),
                        hasNextPage: state.hasNextPage,
                        itemLength: state.productList.length,
                        itemBuilder: (index) {
                          return Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: fixtures.margin.d04,horizontal: fixtures.margin.d08),
                            child: ProductCard(state.productList[index]),
                          );
                        });
                  } else if (state is ProductFailure) {
                    return FailurePage(
                        retryApiCallback: () =>
                            cubit.getData(
                                ProductListReqModel(
                                    pageNumber: 1, pageSize: 10),
                                false),
                        errorMessageModel: state.message);
                  }
                  return const Loading();
                }),
          )),
    );
  }


}