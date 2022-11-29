import 'package:c4b/components/products/cubits/cubit.dart';
import 'package:c4b/components/products/cubits/repository.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final sizedBox = SizedBox(height: fixtures.sizedBox.d08);

  var cubit = ProductCubit(repository: ProductRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(
        fixtures.padding.d16,

    ),
    child: Text('hi'),
    )));
  }


}
