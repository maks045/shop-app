import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/cart/app/card_provider.dart';
import 'package:shop_app/app/cart/presentation/cart_screen.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class AddToCardButton extends ConsumerWidget {
  final ProductModel product;
  const AddToCardButton({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        textStyle: AppTheme.headlineMedium,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        final quantity = ref.read(cartProvider)[product.id]?.quantity ?? 0;

        if (quantity > 0) {
          context.pop();
          context.push(const CartScreen());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add item to cart first')),
          );
        }
        () => context.push(CartScreen());
      },
      child: Text(
        'Add to Cart',
        style: AppTheme.headlineMedium.copyWith(color: AppTheme.white),
      ),
    );
  }
}
