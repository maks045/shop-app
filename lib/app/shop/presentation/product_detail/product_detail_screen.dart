import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/cart/presentation/cart_screen.dart';
import 'package:shop_app/app/shop/app/product/favorite_product_provider.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/app/shop/presentation/product_detail/widget/product_bottom_sheet.dart';
import 'package:shop_app/app/shop/presentation/product_detail/widget/product_detail_section.dart';
import 'package:shop_app/app/shop/presentation/widgets/stock_badge.dart';
import 'package:shop_app/core/buttons/app_button.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import 'package:shop_app/core/theme/app_theme.dart';

import '../../../../core/buttons/button_forward.dart';
import '../../../cart/app/card_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  final ProductModel product;
  const ProductDetailScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: AppTheme.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: PageView(
                      children: product.images
                          .map(
                            (image) => CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (product.stock < 10)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: StockBadge(product: product),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextTheme.of(
                      context,
                    ).titleLarge!.copyWith(color: AppTheme.textPrimary),
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final favorites = ref.watch(favoritesProvider);
                      final isFav = favorites.contains(product.id);

                      return IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          ref
                              .read(favoritesProvider.notifier)
                              .toggle(product.id);
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '${product.price} USD',
                style: TextTheme.of(
                  context,
                ).titleLarge!.copyWith(color: AppTheme.surfaceVariant),
              ),
              ProductDetailSection(product: product),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext builderContext) {
            return ProductBottomSheet(product: product);
          },
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );
  }
}
