import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_api/model/category_model.dart';

class CategoryServices {
  static Future<List<CategoryModel>> getAllCategories() async {
    var response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));

    try {
      List templist = [];
      var jasonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var i in jasonData) {
          templist.add(i);
        }
        return CategoryModel.categoriesFromSnapshoot(templist);
      } else {
        throw jasonData['message'];
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
