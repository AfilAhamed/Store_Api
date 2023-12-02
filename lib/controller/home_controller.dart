import 'package:flutter/material.dart';
import 'package:store_api/services/search_services.dart';
import '../model/product_model.dart';
import '../services/product_services.dart';

class HomeScreenController extends ChangeNotifier {
  List<ProductModel>? productList = [];
  final searchController = TextEditingController();

  Future<void> getProducts() async {
    productList!.clear();
    productList = await ProductServices.getAllProducts();
    notifyListeners();
  }

  List<ProductModel>? searchResult = [];
  Future<void> searchProducts(String query) async {
    searchResult = await SearchServices.getProductsByTitle(query);

    notifyListeners();
  }

  void search() {
    searchProducts(searchController.text);
    notifyListeners();
  }

  HomeScreenController() {
    getProducts();
  }
}
