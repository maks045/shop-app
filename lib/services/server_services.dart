import 'dart:convert';
import 'package:http/http.dart' as http;

import '../app/shop/domain/model/category_model.dart';
import '../app/shop/domain/model/product_model.dart';
import '../app/shop/domain/model/shop_model.dart';


class ServerService {
  final String url = "https://692d6be6e5f67cd80a4b72a4.mockapi.io/products"; // replace

  Future<Map<String, dynamic>> fetchAll() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      // data[0] is your big object inside the array
      return data[0] as Map<String, dynamic>;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<ProductModel>> getProducts() async {
    final data = await fetchAll();
    final List productsJson = data['products'] as List;
    return productsJson.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<CategoryModel>> getCategories() async {
    final data = await fetchAll();
    final List categoriesJson = data['categories'] as List;
    return categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<List<ShopModel>> getShops() async {
    final data = await fetchAll();
    final List shopsJson = data['shops'] as List;
    return shopsJson.map((e) => ShopModel.fromJson(e)).toList();
  }
}