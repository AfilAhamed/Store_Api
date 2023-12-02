import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_api/model/product_model.dart';

class SearchServices {
  static Future<List<ProductModel>?> getProductsByTitle(String title) async {
    final Dio dio = Dio();

    final response =
        await dio.get('https://api.escuelajs.co/api/v1/products/?title=$title');

    try {
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;

        List<ProductModel> products =
            jsonData.map((data) => ProductModel.fromJson(data)).toList();

        return products;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
