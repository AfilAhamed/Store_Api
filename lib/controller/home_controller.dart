import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../services/product_services.dart';

class HomeScreenController extends ChangeNotifier {
  List<ProductModel> productList = [];

  Future<void> getProducts() async {
    productList = await ProductServices.getAllProducts();
    // setState(() {});
    notifyListeners();
  }

  HomeScreenController() {
    getProducts();
  }
}
