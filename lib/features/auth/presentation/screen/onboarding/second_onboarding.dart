import 'package:flutter/material.dart';
import 'package:shop_app/core/buttons/app_button.dart';

import '../../../../../core/theme/app_theme.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('asset/img/Image2.png'),
          SizedBox(height: 16),
          Text(
            'Immerse in a seamless online shopping experience.',
            textAlign: TextAlign.center,
            style: AppTheme.headlineMedium,
          ),
          SizedBox(height: 16),
          Text(
            'We promise that you’ll have the most fuss-free time with us ever.',
            style: AppTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28,),
          AppButton(text: 'Get Started')
        ],
      ),
    );
  }
}
