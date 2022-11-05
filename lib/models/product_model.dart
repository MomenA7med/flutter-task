class ProductModel {
  int id;
  String name;
  int quantity;
  double oldPrice;
  double price;
  String image;
  bool isFavorite;
  String volume;

  ProductModel(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price,
      required this.image,
      required this.isFavorite,
      required this.oldPrice,
      required this.volume});

  factory ProductModel.fromJson(dynamic map) {
    return ProductModel(
      id: map["id"],
      name: map["name"],
      quantity: map["quantity"],
      price: map["price"],
      image: map["image"],
      isFavorite: map["isFavorite"],
      oldPrice: map["oldPrice"],
      volume: map["volume"],
    );
  }
}
