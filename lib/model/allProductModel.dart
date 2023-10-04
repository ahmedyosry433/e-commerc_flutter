// ignore_for_file: prefer_typing_uninitialized_variables, file_names

class AllProduct {
  final id;
  final title;
  final price;
  final description;
  final category;
  final image;
  final rating;
  int quantity;

  AllProduct(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating,
      this.quantity = 1});

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: json["rating"],
    );
  }
}
