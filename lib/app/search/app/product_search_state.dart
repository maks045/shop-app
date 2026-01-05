// import '../domain/model/product_model.dart';

// class ProductSearchState {
//   final List<ProductModel> allProducts;
//   final List<ProductModel> filteredProducts;
//   final String query;

//   const ProductSearchState({
//     required this.allProducts,
//     required this.filteredProducts,
//     required this.query,
//   });

//   factory ProductSearchState.initial(List<ProductModel> products) {
//     return ProductSearchState(
//       allProducts: products,
//       filteredProducts: products,
//       query: '',
//     );
//   }

//   ProductSearchState copyWith({
//     List<ProductModel>? filteredProducts,
//     String? query,
//   }) {
//     return ProductSearchState(
//       allProducts: allProducts,
//       filteredProducts: filteredProducts ?? this.filteredProducts,
//       query: query ?? this.query,
//     );
//   }
// }

import 'package:shop_app/app/shop/domain/model/product_model.dart';

class ProductSearchState {
  final List<ProductModel> allProducts;
  final List<ProductModel> filteredProducts;
  final String query;

  const ProductSearchState({
    required this.allProducts,
    required this.filteredProducts,
    required this.query,
  });

  factory ProductSearchState.initial(List<ProductModel> products) {
    return ProductSearchState(
      allProducts: products,
      filteredProducts: products,
      query: '',
    );
  }
  ProductSearchState copyWith({
    List<ProductModel>? filteredProducts,
    String? query,
  }) {
    return ProductSearchState(
      allProducts: allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      query: query ?? this.query,
    );
  }
}
