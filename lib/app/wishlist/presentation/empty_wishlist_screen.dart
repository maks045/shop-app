import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class EmptyWishlistScreen extends StatelessWidget {
  const EmptyWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('asset/img/no_illustration.png', width: 220),
          const SizedBox(height: 24),
          Text('Your wishlist is empty', style: AppTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Save your favorite products here',
            style: AppTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
