import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/cart/presentation/checkout_screen.dart';
import 'package:shop_app/core/buttons/app_button.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import '../../../core/theme/app_theme.dart';
import '../app/card_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    final totalPrice = cart.values.fold<double>(
      0,
      (sum, item) => sum + item.quantity * item.product.price,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        title: Text(
          'My Cart',
          style: TextTheme.of(
            context,
          ).headlineMedium!.copyWith(color: AppTheme.textPrimary),
        ),
      ),
      body: cart.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('asset/img/illustration.png'),
                Center(
                  child: Text(
                    'Nothing of interest lately? Check out some great discounts below!',
                    style: AppTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: cart.values.map((item) {
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 26,
                          ),
                          leading: Image.network(
                            item.product.images.isNotEmpty
                                ? item.product.images.first
                                : '',
                            width: 130,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            item.product.name,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppTheme.textPrimary),
                          ),
                          subtitle: Text(
                            '${item.quantity} × ${item.product.price} USD',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppTheme.primary),
                          ),
                          trailing: Text(
                            '${(item.quantity * item.product.price).toStringAsFixed(2)} USD',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppTheme.secondary),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Colors.black12),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(color: AppTheme.textPrimary),
                        ),
                        Text(
                          '${totalPrice.toStringAsFixed(2)} USD',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(color: AppTheme.primary),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AppButton(
                      text: 'Checkout',
                      onPressed: () {
                        context.push(CheckoutScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
