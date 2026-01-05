import 'package:flutter/material.dart';
import 'package:shop_app/core/buttons/app_button.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import '../../../../../core/theme/app_theme.dart';
import '../register_screen.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/Image2.png'),
            const SizedBox(height: 16),
            Text(
              'Immerse in a seamless online shopping experience.',
              textAlign: TextAlign.center,
              style: AppTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'We promise that you’ll have the most fuss-free time with us ever.',
              style: AppTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 38),
            AppButton(
              text: 'Get Started',
              onPressed: () => context.push(RegisterScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
