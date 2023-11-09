//import 'dart:convert';

import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
import 'package:store_api/model/product_model.dart';

class ProductServices {
  static Future<List<ProductModel>?> getAllProducts() async {
    final Dio dio = Dio();
    var response = await dio.get('https://api.escuelajs.co/api/v1/products');

    try {
      List templist = [];
      var jasonData = response.data;
      print(jasonData);
      if (response.statusCode == 200) {
        for (var i in jasonData) {
          templist.add(i);
        }
        return ProductModel.productsFromSnapshoot(templist);
      } else {
        // throw jasonData['message'];
        return null;
      }
    } catch (errors) {
      throw errors.toString();
    }
  }
}
