import 'dart:convert';

import 'package:store_api/model/product_model.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  static Future<List<ProductModel>> getProductsByTitle(String title) async {
    final response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/products/?title=$title'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      // Assuming your Product class has a fromJson method
      List<ProductModel> products =
          jsonData.map((data) => ProductModel.fromJson(data)).toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
