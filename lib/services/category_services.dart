import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api/model/category_model.dart';

class CategoryServices {
  static Future<List<CategoryModel>> getAllCategories() async {
    var response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));

    //print(jsonDecode(response.body));
    List templist = [];
    var data = jsonDecode(response.body);
    for (var i in data) {
      templist.add(i);
    }
    return CategoryModel.categoriesFromSnapshoot(templist);
  }
}
