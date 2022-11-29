part of 'cubit.dart';

@immutable
abstract class ProductStates {
  const ProductStates();
}

class ProductUnInitialized extends ProductStates {
  ProductUnInitialized() {
    debugPrint('Product UnInitialized');
  }
}

class ProductFetchData extends ProductStates {
  ProductFetchData() {
    debugPrint('Fetching Data');
  }
}

class ProductFetchSuccess extends ProductStates {
  final List<ProductResModel> productList;
  ProductFetchSuccess(this.productList) {
    debugPrint('Fetch products success');
  }
}

class ProductLoading extends ProductStates {
  ProductLoading() {
    debugPrint('StoreLoading');
  }
}

class ProductFailure extends ProductStates {
  final MessageResModel message;

  const ProductFailure(this.message);
}


