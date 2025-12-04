import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/app/shop/domain/model/product_model.dart';



class ProductService {
  final String apiUrl = 'https://692d6be6e5f67cd80a4b72a4.mockapi.io/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}