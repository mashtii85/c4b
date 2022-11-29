import 'package:c4b/components/products/cubits/cubit.dart';
import 'package:c4b/components/products/cubits/repository.dart';
import 'package:c4b/components/products/models/response/product_res_model.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  ProductList(this.list, {super.key});

  final List<ProductResModel> list;
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
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var product = list[index];
                    return Card(
                        child: IntrinsicHeight(
                            child: Padding(
                      padding: EdgeInsets.all(fixtures.sizedBox.d08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Name: ${product.name}'),
                          Text('Brand: ${product.brand}'),
                          Text('Price: ${product.price}'),
                          Text('Count: ${product.count}'),
                          Text('Color: ${product.color}'),

                        ],
                      ),
                    )));
                  },
                ))));
  }
}
Color colorFor(String text){
  var hash = 0;
  for (var i = 0; i < text.length; i++) {
    hash = text.codeUnitAt(i)+ ((hash << 5) - hash);
  }
  final finalHash = hash.abs() % (256*256*256);
  print(finalHash);
  final red = ((finalHash & 0xFF0000) >> 16);
  final blue = ((finalHash & 0xFF00) >> 8);
  final green = ((finalHash & 0xFF));
  final color = Color.fromRGBO(red, green, blue, 1);
  return color;
}