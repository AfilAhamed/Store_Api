import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:store_api/model/product_model.dart';

class ProductServices {
  static Future<List<ProductModel>?> getAllProducts() async {
    final Dio dio = Dio();
    var response = await dio.get('https://api.escuelajs.co/api/v1/products');

    try {
      List templist = [];
      var jasonData = response.data;
      if (response.statusCode == 200) {
        for (var i in jasonData) {
          templist.add(i);
        }
        return ProductModel.productsFromSnapshoot(templist);
      } else {
        return null;
      }
    } catch (errors) {
      log(errors.toString());
      return null;
    }
  }
}
