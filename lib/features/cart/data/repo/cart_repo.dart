import 'dart:developer';

import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/api/endpoints.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/models/request/update_request_model.dart';

class CartRepo {
  static Future<CartResponse?> getCartItems() async {
    var res = await DioProvider.get(
      endpoint: Endpoints.showCart,
      headers: {'Authorization': 'Bearer ${LocalHelper.getUserData()?.token}'},
    );
    if (res.statusCode == 200) {
      return CartResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  static Future<CartResponse?> addToCart({required int productId}) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.addToCart,
        data: {"product_id": productId},
        headers: {
          "Authorization": "Bearer ${LocalHelper.getUserData()?.token}",
        },
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> removeFromCart({required int? itemId}) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.removeFromCart,
        data: {"cart_item_id": itemId},
        headers: {
          "Authorization": "Bearer ${LocalHelper.getUserData()?.token}",
        },
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> updateCart(CartUpdateParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.updateCart,
        data: params.toJson(),
        headers: {
          "Authorization": "Bearer ${LocalHelper.getUserData()?.token}",
        },
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
