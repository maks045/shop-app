import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/app/product/product_provider.dart';
import 'package:shop_app/app/shop/presentation/card/product_card.dart';
import 'package:shop_app/app/wishlist/presentation/empty_wishlist_screen.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class WishListScreen extends ConsumerWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favProducts = ref.watch(favoriteProductsProvider);

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        centerTitle: true,
        title: Text(
          'Wishlist',
          style: TextTheme.of(
            context,
          ).headlineMedium!.copyWith(color: AppTheme.textPrimary),
        ),
      ),

      body: favProducts.isEmpty
          ? EmptyWishlistScreen()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                itemCount: favProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: ProductCard(
                      key: ValueKey(favProducts[index].id),
                      product: favProducts[index],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
