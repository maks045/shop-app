import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/app/shop/presentation/product_detail/widget/add_to_card_button.dart';
import 'package:shop_app/app/shop/presentation/product_detail/widget/bottom_sheet_card.dart';
import 'package:shop_app/app/shop/presentation/product_detail/widget/quantity.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class ProductBottomSheet extends ConsumerWidget {
  final ProductModel product;

  const ProductBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        return Container(
          height: 400,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.close, color: AppTheme.black),
                ),
                BottomSheetCard(product: product),
                SizedBox(height: 18),
                QuantitySection(product: product),
                SizedBox(height: 18),
                AddToCardButton(product: product),
              ],
            ),
          ),
        );
      },
    );
  }
}
