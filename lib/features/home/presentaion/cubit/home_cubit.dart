import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/home/data/models/product_list_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentaion/cubit/home_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Product> bestSellersList = [];
  List<Product> allProductsList = [];
  List<Slider> slidersList = [];

  bestSellers() async {
    emit(HomeLoadingState());

    var response = await HomeRepo.getBestSellers();
    if (response != null) {
      bestSellersList = (response).data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeFailureState("Failed to fetch best sellers"));
    }
  }

  allProducts() async {
    emit(HomeLoadingState());

    var response = await HomeRepo.getAllProducts();
    if (response != null) {
      allProductsList = (response).data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeFailureState("Failed to fetch products"));
    }
  }

  sliderPics() async {
    emit(HomeLoadingState());

    var response = await HomeRepo.getSliderpics();
    if (response != null) {
      slidersList = (response).data?.sliders ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeFailureState("Failed to fetch products"));
    }
  }

  addRemoveToWishlist(int productId) async {
    emit(HomeLoadingState());

    if (isWishlist(productId)) {
      var data = await WishlistRepo.removeFromWishlist(productId: productId);
      if (data != null) {
        emit(WishlistCartSuccessState(message: 'Removed from wishlist'));
      } else {
        emit(HomeFailureState("Something went wrong"));
      }
    } else {
      var data = await WishlistRepo.addToWishlist(productId: productId);
      if (data != null) {
        emit(WishlistCartSuccessState(message: 'Added to wishlist'));
      } else {
        emit(HomeFailureState("Something went wrong"));
      }
    }
  }

  bool isWishlist(int productId) {
    var wishlist = LocalHelper.getWishlist();

    return wishlist?.any((e) => e.id == productId) ?? false;
  }
}
