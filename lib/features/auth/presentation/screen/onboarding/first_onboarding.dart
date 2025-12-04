import 'package:flutter/material.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import 'package:shop_app/core/theme/app_theme.dart';
import 'package:shop_app/features/auth/presentation/screen/register_screen.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/Image.png'),
            SizedBox(height: 16),
            Text(
              'Wishing for an item but it is too\nexpensive?',
              textAlign: TextAlign.center,
              style: AppTheme.headlineMedium,
            ),
            SizedBox(height: 16),

            Text(
              'You will be notified of promotions for products in your wishlist.',
              style: AppTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: () => context.push(RegisterScreen()), child: Text('Next')),
          ],
        ),
      ),
    );
  }
}
