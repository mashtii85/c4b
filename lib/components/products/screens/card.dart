import 'package:c4b/components/products/models/response/product_res_model.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product, {super.key});

  final ProductResModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: IntrinsicHeight(
          child: Padding(
        padding: EdgeInsets.all(fixtures.sizedBox.d08),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [content(), picture()],
        ),
      )),
    ));
  }

  FractionallySizedBox content() {
    return FractionallySizedBox(
      widthFactor: .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Name: ${product.name}',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                color: fixtures.colorPalette.grey[800]),
          ),
          Text(
            'Brand: ${product.brand}',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                color: fixtures.colorPalette.grey[800]),
          ),
          Text(
            'Price: ${product.price}',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                color: fixtures.colorPalette.grey[800]),
          ),
          Text(
            'Count: ${product.count}',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                color: fixtures.colorPalette.grey[800]),
          ),
          Text(
            'Color: ${product.color}',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                color: fixtures.colorPalette.grey[800]),
          ),
        ],
      ),
    );
  }

  FractionallySizedBox picture() {
    return FractionallySizedBox(
        widthFactor: .25,
        child: Center(
          child: Image.network(
            product.image,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, _) {
              return Icon(
                Icons.account_circle,
                color: fixtures.colorPalette.grey,
              );
            },
          ),
        ));
  }
}
