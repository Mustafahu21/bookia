import 'dart:developer';

import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/api/endpoints.dart';
import 'package:bookia/features/home/data/models/product_list_response/product_list_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<ProductListResponse?> getBestSellers() async {
    try {
      var res = await DioProvider.get(endpoint: Endpoints.bestSellers);
      if (res.statusCode == 200) {
        var data = ProductListResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<ProductListResponse?> getAllProducts([
    int pageindex = 1,
  ]) async {
    try {
      var res = await DioProvider.get(
        endpoint: Endpoints.allProducts,
        queryParameters: {'page': pageindex},
      );
      if (res.statusCode == 200) {
        var data = ProductListResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SliderResponse?> getSliderpics() async {
    try {
      var res = await DioProvider.get(endpoint: Endpoints.sliders);
      if (res.statusCode == 200) {
        var data = SliderResponse.fromJson(res.data);
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
