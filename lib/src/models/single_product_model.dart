class SingleProduct {
  final int id;
  final String title;
  final String description;
  final int price;
  final List images;

  SingleProduct(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.images});

  factory SingleProduct.fromJson(Map<String, dynamic> json) {
    return SingleProduct(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      images: json['images'],
    );
  }
}
