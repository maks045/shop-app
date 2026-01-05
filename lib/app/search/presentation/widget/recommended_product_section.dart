import 'package:flutter/material.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/app/shop/presentation/screen/product_card3.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class RecommendedProductSection extends StatelessWidget {
  final List<ProductModel> products;

  const RecommendedProductSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final items = products.length > 3
        ? products.sublist(3, products.length >= 6 ? 6 : products.length)
        : <ProductModel>[];
    if (items.isEmpty) return const SizedBox();
    return Column(
      children: [
        Text(
          'Recommended Products',
          style: TextTheme.of(
            context,
          ).titleLarge!.copyWith(color: AppTheme.black),
        ),
        const SizedBox(height: 12),

        ...items.map((p) => ProductCard3(product: p)),
      ],
    );
  }
}
