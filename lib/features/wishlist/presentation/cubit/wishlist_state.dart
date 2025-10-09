class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {}

class WishlistError extends WishlistState {
  final String message;
  WishlistError(this.message);
}

class WishlistCartSuccessState extends WishlistState {
  final String message;
  WishlistCartSuccessState(this.message);
}

class WishlistCartErrorState extends WishlistState {
  final String message;
  WishlistCartErrorState(this.message);
}
