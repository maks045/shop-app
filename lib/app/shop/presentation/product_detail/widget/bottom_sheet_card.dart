import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class BottomSheetCard extends StatelessWidget {
  final ProductModel product;
  const BottomSheetCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: CachedNetworkImage(
              imageUrl: product.images.isNotEmpty
                  ? product.images.first
                  : "https://via.placeholder.com/300",
              fit: BoxFit.contain,
              width: 150,
              height: 120,
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
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                  "USD ${product.price.toStringAsFixed(product.price % 1 == 0 ? 0 : 2)}",
                  style: TextTheme.of(
                    context,
                  ).titleMedium!.copyWith(color: AppTheme.primary),
                ),
                const SizedBox(height: 12),

                Text(
                  product.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextTheme.of(
                    context,
                  ).titleSmall!.copyWith(color: AppTheme.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
