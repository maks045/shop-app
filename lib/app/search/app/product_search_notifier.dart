// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../domain/model/product_model.dart';
// import 'product_search_state.dart';

// class ProductSearchNotifier extends StateNotifier<ProductSearchState> {
//   ProductSearchNotifier(List<ProductModel> products)
//     : super(ProductSearchState.initial(products));

//   void search(String query) {
//     if (query.isEmpty) {
//       state = state.copyWith(filteredProducts: state.allProducts, query: '');
//       return;
//     }

//     final lowerQuery = query.toLowerCase();

//     final results = state.allProducts.where((product) {
//       return product.name.toLowerCase().contains(lowerQuery) ||
//           product.description.toLowerCase().contains(lowerQuery);
//     }).toList();

//     state = state.copyWith(filteredProducts: results, query: query);
//   }

//   void clear() {
//     state = state.copyWith(filteredProducts: state.allProducts, query: '');
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/app/product_search_state.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';

class ProductSearchNotifier extends StateNotifier<ProductSearchState> {
  ProductSearchNotifier(List<ProductModel> products)
    : super(ProductSearchState.initial(products));

  void search(String query) {
    if (query.isEmpty) {
      state = state.copyWith(filteredProducts: state.allProducts, query: '');
      return;
    }
    final lowerQuery = query.toLowerCase();

    final results = state.allProducts.where((product) {
      return product.name.toLowerCase().contains(lowerQuery) ||
          product.description.toLowerCase().contains(lowerQuery);
    }).toList();

    state = state.copyWith(filteredProducts: results, query: query);
  }

  void clear() {
    state = state.copyWith(filteredProducts: state.allProducts, query: '');
  }
}
