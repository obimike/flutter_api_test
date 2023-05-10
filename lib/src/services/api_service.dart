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
}
