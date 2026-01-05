import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/app/shop/presentation/widgets/stock_badge.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class ProductCard3 extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  const ProductCard3({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppTheme.white,
        elevation: 5,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: CachedNetworkImage(
                imageUrl: product.images.isNotEmpty
                    ? product.images.first
                    : "https://via.placeholder.com/300",
                fit: BoxFit.cover,
                width: 150,
                height: 170,
                placeholder: (context, url) =>
                    Container(color: Colors.grey[200], child: const Center()),
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
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          product.name,
                          style: TextTheme.of(
                            context,
                          ).titleMedium!.copyWith(color: AppTheme.textPrimary),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          product.description,
                          maxLines: 2,
                          style: TextTheme.of(
                            context,
                          ).titleSmall!.copyWith(color: AppTheme.grey),
                        ),
                        const SizedBox(height: 12),

                        if (product.stock < 10) StockBadge(product: product),
                        Text(
                          "USD ${product.price.toStringAsFixed(product.price % 1 == 0 ? 0 : 2)}",
                          style: TextTheme.of(
                            context,
                          ).titleMedium!.copyWith(color: AppTheme.primary),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${product.id}',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(color: AppTheme.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
