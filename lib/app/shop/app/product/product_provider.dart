import 'package:shop_app/app/shop/app/product/favorite_product_provider.dart';

import '../../../../services/server_services.dart';
import '../../domain/model/category_model.dart';
import '../../domain/model/product_model.dart';
import '../../domain/model/shop_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serverServiceProvider = Provider((ref) => ServerService());

final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  return ref.read(serverServiceProvider).getProducts();
});

final categoryProvider = FutureProvider<List<CategoryModel>>((ref) async {
  return ref.read(serverServiceProvider).getCategories();
});

final shopProvider = FutureProvider<List<ShopModel>>((ref) async {
  return ref.read(serverServiceProvider).getShops();
});

final favoriteProductsProvider = Provider<List<ProductModel>>((ref) {
  final productsAsync = ref.watch(productProvider);
  final favorites = ref.watch(favoritesProvider);

  return productsAsync.maybeWhen(
    data: (products) =>
        products.where((p) => favorites.contains(p.id)).toList(),
    orElse: () => [],
  );
});
