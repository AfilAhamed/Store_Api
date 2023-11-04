class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel({
    this.id,
    this.name,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  static List<CategoryModel> categoriesFromSnapshoot(List productSnapshoot) {
    return productSnapshoot.map((data) {
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
