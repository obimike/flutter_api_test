class Product {
  final List products;

  Product({required this.products});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(products: json["products"]);
  }
}
