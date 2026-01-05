import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/presentation/screen/advertisement.dart';
import 'package:shop_app/app/shop/presentation/screen/product_card.dart';
import 'package:shop_app/app/shop/presentation/widgets/app_drawer.dart';
import 'package:shop_app/core/theme/app_theme.dart';
import 'package:shop_app/core/utils/app_loading_page.dart';
import '../app/product_provider.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Text(
            "My cart",
            style: TextTheme.of(
              context,
            ).titleMedium!.copyWith(color: AppTheme.textPrimary),
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: productsAsync.when(
          loading: () => const Center(child: AppLoadingPage()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 64),
                const SizedBox(height: 16),
                Text(
                  "Failed to load products",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => ref.invalidate(productProvider),
                  child: const Text("Retry"),
                ),
              ],
            ),
          ),

          data: (products) => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const SizedBox(height: 130, child: Advertisement()),
                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.67,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
