import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class DiscountHeader extends StatelessWidget {
  const DiscountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Bulk Discounts!',
          style: TextTheme.of(
            context,
          ).titleLarge!.copyWith(color: AppTheme.black),
        ),
        Text(
          'View All',
          style: TextTheme.of(
            context,
          ).titleMedium!.copyWith(color: AppTheme.blue),
        ),
      ],
    );
  }
}
