import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../app/cart/domain/model/cart_model.dart';
import '../../app/shop/domain/model/category_model.dart';
import '../../app/shop/domain/model/product_model.dart';
import '../../app/shop/domain/model/shop_model.dart';

class ServerAddress {
  static const String baseUrl = 'https://mockapi.io/projects/692d6be6e5f67cd80a4b72a5';

  Future<Map<String, dynamic>> fetchAllData()async{

final url = Uri.parse(baseUrl);
final response = await http.get(url);
if(response.statusCode == 200) {
  final data = jsonDecode(response.body);

  final categories = (data['categories'] as List).map((e) => CategoryModel.fromJson(e)).toList();

  final shops = (data['shops'] as List).map((e)=> ShopModel.fromJson(e)).toList();

  final products = (data ['products']as List)
     .map((e)=> ProductModel.fromJson((e)))
     .toList();

  final basket = (data['basket'] as List)
      .map((e)=> CartModel.fromJson(e))
      .toList();

  // final addresses = (data['addresses'] as List)
  //     .map((e)=> AddressModel.fromJson(e))
  //     .toList();

  return {
    'categories': categories,
    'shops': shops,
    'products': products,
    'basket': basket,
    // 'addresses': addresses
  };
}else{
  throw Exception('Failed to load data');
}
  }
}
