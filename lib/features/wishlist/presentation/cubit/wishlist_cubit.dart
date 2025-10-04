import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  List<dynamic> wishlist = [];

  getWishList() async {
    emit(WishlistLoading());
    try {
      var response = await WishlistRepo.getWishlist();
      if (response != null) {
        wishlist = response.data?.data ?? [];
        emit(WishlistLoaded());
      } else {
        emit(WishlistError("Failed to load wishlist"));
      }
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  removeFromWishlist(int productId) {
    emit(WishlistLoading());
    WishlistRepo.removeFromWishlist(productId: productId).then((value) {
      if (value == null) {
        emit(WishlistError("Something went wrong"));
      } else {
        wishlist = value.data?.data ?? [];
        emit(WishlistLoaded());
      }
    });
  }
}
