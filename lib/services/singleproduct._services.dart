import 'dart:developer';
import 'package:dio/dio.dart';
import '../model/product_model.dart';

class SingleProductServices {
  static Future<ProductModel?> getProductsbyId(int id) async {
    final Dio dio = Dio();

    var response =
        await dio.get('https://api.escuelajs.co/api/v1/products/$id');

    try {
      if (response.statusCode == 200) {
        var jsonData = response.data;

        return ProductModel.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
