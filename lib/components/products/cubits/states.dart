part of 'cubit.dart';

@immutable
abstract class ProductStates extends Equatable {
   const ProductStates();

  @override
  List<Object> get props => [];

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
  final int pageSize;
  final int page;
  final bool hasNextPage;

  ProductFetchSuccess(
      {required this.productList,
      required this.hasNextPage,
      required this.pageSize,
      required this.page}) {
    debugPrint('Fetch products success');
  }
}

class ProductLoading extends ProductStates {
  ProductLoading() {
    debugPrint('StoreLoading');
  }
}

class ProductIndicatorLoading extends ProductStates {
  ProductIndicatorLoading() {
    debugPrint('StoreLoading');
  }
}

class ProductFailure extends ProductStates {
  final MessageResModel message;

  const ProductFailure(this.message);
}
