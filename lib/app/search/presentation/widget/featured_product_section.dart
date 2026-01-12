import 'package:flutter/material.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/app/shop/presentation/card/product_card.dart';
import 'package:shop_app/app/shop/presentation/card/product_card2.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class FeaturedProductSection extends StatelessWidget {
  final List<ProductModel> products;
  const FeaturedProductSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox();

    final featured = products[0];
    final card1 = products.length > 1 ? products[1] : null;
    final card2 = products.length > 2 ? products[2] : null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 148,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              SizedBox(height: 8),
              Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text('Featured'),
              ),
              SizedBox(height: 8),
              SizedBox(height: 248, child: ProductCard(product: featured)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            children: [
              if (card1 != null)
                SizedBox(height: 140, child: ProductCard2(product: card1)),
              const SizedBox(height: 16),
              if (card2 != null)
                SizedBox(height: 140, child: ProductCard2(product: card2)),
            ],
          ),
        ),
      ],
    );
  }
}
