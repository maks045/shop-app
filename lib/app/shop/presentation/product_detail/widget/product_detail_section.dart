import 'package:flutter/material.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class ProductDetailSection extends StatelessWidget {
  final ProductModel product;
  const ProductDetailSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 22),
        Text(
          'Product Details',
          style: TextTheme.of(
            context,
          ).titleLarge!.copyWith(color: AppTheme.textPrimary),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: TextTheme.of(
                context,
              ).titleMedium!.copyWith(color: AppTheme.grey),
            ),
            Text(
              product.category,
              style: TextTheme.of(
                context,
              ).titleMedium!.copyWith(color: AppTheme.grey),
            ),
          ],
        ),
        const SizedBox(height: 14),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              "Brand",
              style: TextTheme.of(
                context,
              ).titleMedium!.copyWith(color: AppTheme.grey),
            ),
            Text(
              product.brand,
              style: TextTheme.of(
                context,
              ).titleMedium!.copyWith(color: AppTheme.grey),
            ),
          ],
        ),
        const SizedBox(height: 14),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stock",
              style: TextTheme.of(
                context,
              ).titleMedium!.copyWith(color: AppTheme.grey),
            ),
            Text(
              '${product.stock}',
              style: TextTheme.of(
                context,
              ).titleMedium!.copyWith(color: AppTheme.grey),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          "Description",
          style: TextTheme.of(
            context,
          ).titleLarge!.copyWith(color: AppTheme.textPrimary),
        ),
        Text(
          product.description,
          style: TextTheme.of(
            context,
          ).titleMedium!.copyWith(color: AppTheme.grey),
        ),
      ],
    );
  }
}
