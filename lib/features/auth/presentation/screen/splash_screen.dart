import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/gradient.dart';
import 'package:shop_app/features/auth/presentation/screen/onboarding/first_onboarding.dart';
import 'package:shop_app/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(gradient: Gradients.blueGradient),
            child: Center(child: Image.asset('asset/logo/logo_n.png')),
          ),
        ],
      ),
    );
  }
}
