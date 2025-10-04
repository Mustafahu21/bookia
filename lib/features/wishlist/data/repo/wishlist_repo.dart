import 'dart:developer';

import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/api/endpoints.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/wishlist/data/model/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static Future<WishlistResponse?> addToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.add2wishlist,
        data: {"product_id": productId},
        headers: {
          "Authorization": "Bearer ${LocalHelper.getUserData()?.token}",
        },
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        LocalHelper.setWishlist(data.data?.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishlistResponse?> removeFromWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.removeFromWishlist,
        data: {"product_id": productId},
        headers: {
          "Authorization": "Bearer ${LocalHelper.getUserData()?.token}",
        },
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        LocalHelper.setWishlist(data.data?.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishlistResponse?> getWishlist() async {
    var res = await DioProvider.get(
      endpoint: Endpoints.wishlist,
      headers: {'Authorization': 'Bearer ${LocalHelper.getUserData()?.token}'},
    );
    if (res.statusCode == 200) {
      return WishlistResponse.fromJson(res.data);
    } else {
      return null;
    }
  }
}
