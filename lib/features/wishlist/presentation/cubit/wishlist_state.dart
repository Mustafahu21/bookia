class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {}

class WishlistError extends WishlistState {
  final String message;
  WishlistError(this.message);
}
