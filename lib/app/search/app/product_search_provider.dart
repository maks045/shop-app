import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/model/product_model.dart';
import 'product_provider.dart';
import 'product_search_notifier.dart';
import 'product_search_state.dart';

final productSearchProvider =
    StateNotifierProvider<ProductSearchNotifier, ProductSearchState>((ref) {
      final productsAsync = ref.watch(productProvider);

      return productsAsync.when(
        data: (products) => ProductSearchNotifier(products),
        loading: () => ProductSearchNotifier(const <ProductModel>[]),
        error: (_, __) => ProductSearchNotifier(const <ProductModel>[]),
      );
    });
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop_app/app/shop/app/product_provider.dart';
// import 'package:shop_app/app/shop/app/product_search_notifier.dart';
// import 'package:shop_app/app/shop/app/product_search_state.dart';
// import 'package:shop_app/app/shop/domain/model/product_model.dart';

// final productSearchProvider =
//     StateNotifierProvider<ProductSearchNotifier, ProductSearchState>((ref) {
//       final productAsync = ref.watch(productProvider);

//       return productAsync.when(
//         data: (products) => ProductSearchNotifier(products),
//         loading: () => ProductSearchNotifier(const <ProductModel>[]),
//         error: (_, __) => ProductSearchNotifier(const <ProductModel>[]),
//       );
//     });
