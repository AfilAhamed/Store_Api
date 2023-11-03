import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api/model/product_model.dart';

class ProductServices {
  static Future<List<ProductModel>> getAllProducts() async {
    var response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));

    //print(jsonDecode(response.body));
    List templist = [];
    var data = jsonDecode(response.body);
    for (var i in data) {
      templist.add(i);
    }
    return ProductModel.productsFromSnapshoot(templist);
  }
}
