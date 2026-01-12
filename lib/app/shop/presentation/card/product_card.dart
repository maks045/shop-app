import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/app/shop/presentation/product_detail/product_detail_screen.dart';
import 'package:shop_app/app/shop/presentation/widgets/stock_badge.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import 'package:shop_app/core/theme/app_theme.dart';
import '../../domain/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(ProductDetailScreen(product)),
      child: Card(
        color: AppTheme.white,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: product.images.isNotEmpty
                    ? product.images.first
                    : 'https://via.placeholder.com/300',
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextTheme.of(
                      context,
                    ).titleMedium!.copyWith(color: AppTheme.primary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.brand,
                    style: TextTheme.of(
                      context,
                    ).titleSmall!.copyWith(color: AppTheme.grey),
                  ),
                  if (product.stock < 10) StockBadge(product: product),
                  Text(
                    "USD ${product.price.toStringAsFixed(product.price % 1 == 0 ? 0 : 2)}",
                    style: TextTheme.of(
                      context,
                    ).titleMedium!.copyWith(color: AppTheme.textPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
