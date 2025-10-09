class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}
