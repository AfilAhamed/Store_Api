import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:store_api/model/category_model.dart';

class CategoryServices {
  static Future<List<CategoryModel>?> getAllCategories() async {
    final Dio dio = Dio();

    var response = await dio.get('https://api.escuelajs.co/api/v1/categories');

    try {
      List templist = [];
      var jasonData = response.data;
      if (response.statusCode == 200) {
        for (var i in jasonData) {
          templist.add(i);
        }
        return CategoryModel.categoriesFromSnapshoot(templist);
      } else {
        return jasonData['message'];
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }
}
