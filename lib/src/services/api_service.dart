import 'package:api_test/src/models/product_model.dart';
import 'package:api_test/src/models/single_product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  final headers = {
    'Content-Type': 'application/json',
  };

  Future<SingleProduct> getSingleProduct() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/72'));

    if (response.statusCode == 200) {
      return SingleProduct.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Product!');
    }
  }

  Future<SingleProduct> getProductDetail(id) async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/products/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Product!');
    }
  }


  Future<Product> getProducts() async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      // print(response.body);
      var products = response.body;
      // products = products["products"].toString();
      return Product.fromJson(jsonDecode(products));
    } else {
      throw Exception('Failed to load Product!');
    }
  }
}
