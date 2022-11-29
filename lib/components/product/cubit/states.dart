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
  ProductFetchSuccess() {
    debugPrint('Fetch products success');
  }
}

class ProductLoading extends ProductStates {
  ProductLoading() {
    debugPrint('StoreLoading');
  }
}

class StoreFailure extends ProductStates {
  final MessageResModel message;

  const StoreFailure(this.message);
}


