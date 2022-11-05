class CategoryModel {
  String categoryImage;
  String categoryName;

  CategoryModel({
    required this.categoryName,
    required this.categoryImage,
  });

  factory CategoryModel.fromJson(dynamic map) {
    return CategoryModel(
        categoryName: map["categoryName"], categoryImage: map["categoryImage"]);
  }
}
