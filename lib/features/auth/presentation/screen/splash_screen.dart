import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/gradient.dart';

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
