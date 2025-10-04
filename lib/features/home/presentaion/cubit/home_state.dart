class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class WishlistCartSuccessState extends HomeState {
  final String message;
  WishlistCartSuccessState({required this.message});
}

class HomeFailureState extends HomeState {
  final String error;
  HomeFailureState(this.error);
}
