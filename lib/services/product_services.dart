import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api/model/product_model.dart';

class ProductServices {
  static Future<List<ProductModel>> getAllProducts() async {
    var response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));

    try {
      List templist = [];
      var jasonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var i in jasonData) {
          templist.add(i);
        }
        return ProductModel.productsFromSnapshoot(templist);
      } else {
        throw jasonData['message'];
        // return null;
      }
    } catch (errors) {
      throw errors.toString();
    }
  }
}
