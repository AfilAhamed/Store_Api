import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../services/singleproduct._services.dart';

class ProductDetailsController extends ChangeNotifier {
  ProductModel? productModel;

  Future<void> getsingleproducts(int id) async {
    productModel = null;
    productModel = await SingleProductServices.getProductsbyId(id);
    notifyListeners();
  }
}
