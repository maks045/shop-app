import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/presentation/screen/advertisement.dart';
import 'package:shop_app/app/shop/presentation/screen/product_card.dart';
import 'package:shop_app/app/shop/presentation/widgets/app_drawer.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import '../../../core/theme/gradient.dart';
import '../../cart/presentation/cart_screen.dart';
import '../app/product_provider.dart';
import '../domain/model/product_model.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productProvider); // ← This is AsyncValue

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
        actions: [
          InkWell(
            onTap: () => context.push(const CartScreen(),),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text("My Cart"),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: productsAsync.when(
        // Loading state
        loading: () => const Center(child: CircularProgressIndicator()),

        // Error state
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              Text("Failed to load products", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.invalidate(productProvider), // Retry
                child: const Text("Retry"),
              ),
            ],
          ),
        ),

        // Success state → Here you get the real List<ProductModel>
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length, // Now safe!
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]); // Now safe!
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}