import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/cart/app/card_provider.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/app/shop/presentation/widgets/stock_badge.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class QuantitySection extends ConsumerWidget {
  final ProductModel product;
  const QuantitySection({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    final quantity = cart[product.id]?.quantity ?? 0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quantity',
            style: TextTheme.of(
              context,
            ).headlineMedium!.copyWith(color: AppTheme.textPrimary),
          ),
          if (product.stock < 10) StockBadge(product: product),

          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(color: AppTheme.primary),
                ),
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  color: AppTheme.black,
                  onPressed: quantity > 0
                      ? () {
                          ref.read(cartProvider.notifier).remove(product);
                        }
                      : null,
                ),
              ),
              SizedBox(width: 8),
              Text(
                quantity.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(width: 8),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(color: AppTheme.primary),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  color: AppTheme.black,
                  onPressed: quantity < product.stock
                      ? () {
                          ref.read(cartProvider.notifier).add(product);
                        }
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
