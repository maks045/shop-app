import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/app/product/product_provider.dart';
import 'package:shop_app/app/search/app/product_search_notifier.dart';
import 'package:shop_app/app/search/app/product_search_state.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';

final productSearchProvider =
    StateNotifierProvider<ProductSearchNotifier, ProductSearchState>((ref) {
      final productAsync = ref.watch(productProvider);

      return productAsync.when(
        data: (products) => ProductSearchNotifier(products),
        loading: () => ProductSearchNotifier(const <ProductModel>[]),
        error: (_, __) => ProductSearchNotifier(const <ProductModel>[]),
      );
    });
