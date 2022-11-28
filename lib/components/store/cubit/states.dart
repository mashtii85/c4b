part of 'cubit.dart';

@immutable
abstract class StoreStates {
  const StoreStates();
}

class StoreUnInitialized extends StoreStates {
  StoreUnInitialized() {
    debugPrint('StoreUnInitialized');
  }
}

class StoreGetData extends StoreStates {
  StoreGetData() {
    debugPrint('GettingData');
  }
}

class StoreSucceeded extends StoreStates {
  StoreSucceeded() {
    debugPrint('StoreSucceeded');
  }
}

class StoreLoading extends StoreStates {
  StoreLoading() {
    debugPrint('StoreLoading');
  }
}

class StoreFailure extends StoreStates {
  final MessageResModel message;

  const StoreFailure(this.message);
}


