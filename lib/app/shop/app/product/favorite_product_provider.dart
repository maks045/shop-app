import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/app/product/product_provider.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<int>>(
  (ref) => FavoritesNotifier(),
);

class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier() : super({});

  void toggle(int productId) {
    state = state.contains(productId)
        ? (Set.of(state)..remove(productId))
        : {...state, productId};
  }

  bool isFavorite(String productId) => state.contains(productId);
}

// final favoriteProductsProvider = Provider<List<ProductModel>>((ref) {
//   final productsAsync = ref.watch(productProvider);
//   final favorites = ref.watch(favoritesProvider);

//   return productsAsync.when(
//     data: (products) =>
//         products.where((p) => favorites.contains(p.id)).toList(),
//     loading: () => [],
//     error: (_, __) => [],
//   );
// });
