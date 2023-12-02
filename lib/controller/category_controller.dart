import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../services/category_services.dart';

class CategoryController extends ChangeNotifier {
  List<CategoryModel> categoriesList = [];

  Future<void> getCategories() async {
    categoriesList = (await CategoryServices.getAllCategories())!;
    notifyListeners();
  }

  CategoryController() {
    getCategories();
  }
}
