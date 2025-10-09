import 'package:bookia/features/cart/data/models/request/update_request_model.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  List<dynamic> cartItems = [];
  showCart() async {
    emit(CartLoadingState());
    try {
      var response = await CartRepo.getCartItems();
      if (response != null) {
        cartItems = response.data?.cartItems ?? [];
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("Failed to load cart items"));
      }
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  removeFromCart({required int? itemId}) async {
    emit(CartLoadingState());
    try {
      var response = await CartRepo.removeFromCart(itemId: itemId);
      if (response != null) {
        cartItems = response.data?.cartItems ?? [];
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("Failed to remove from cart"));
      }
    } on Exception catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  addToCart({required int productId}) async {
    emit(CartLoadingState());
    try {
      var response = await CartRepo.addToCart(productId: productId);
      if (response != null) {
        cartItems = response.data?.cartItems ?? [];
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("Failed to add to cart"));
      }
    } on Exception catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  updateCart({required int? productId, required int quantity}) async {
    emit(CartLoadingState());
    try {
      var params = CartUpdateParams(cartItemId: productId, quantity: quantity);
      var response = await CartRepo.updateCart(params);
      if (response != null) {
        cartItems = response.data?.cartItems ?? [];
        emit(CartSuccessState());
      } else {
        emit(CartErrorState("Failed to update cart"));
      }
    } on Exception catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }
}
