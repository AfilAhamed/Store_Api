import 'category_model.dart';

class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  CategoryModel? category;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  static List<ProductModel> productsFromSnapshoot(List productSnapshoot) {
    return productSnapshoot.map((data) {
      return ProductModel.fromJson(data);
    }).toList();
  }
}
