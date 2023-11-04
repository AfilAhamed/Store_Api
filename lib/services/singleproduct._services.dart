import 'dart:convert';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class SingleProductServices {
  static Future<ProductModel> getProductsbyId(int id) async {
    var response = await http
        .get(Uri.parse('https://api.escuelajs.co/api/v1/products/$id'));

    var data = jsonDecode(response.body);

    return ProductModel.fromJson(data);
  }
}
