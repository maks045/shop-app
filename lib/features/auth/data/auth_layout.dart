import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/auth/data/auth_services.dart';
import 'package:shop_app/features/auth/presentation/screen/onboarding/first_onboarding.dart';
import 'package:shop_app/features/auth/presentation/screen/splash_screen.dart';

import '../../../core/utils/app_loading_page.dart';
import '../../../home_screen.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key,this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authService.value.authStateChanges, // ← бул жерде .value керек!
      builder: (context, snapshot) {
        // 1. Firebase жүктөлүп жатса → SplashScreen
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        // 2. Колдонуучу кирдиби?
        if (snapshot.hasData && snapshot.data != null) {
          return const ShopAppScreen();
        }

        // 3. Кирбеген болсо → Онбординг же Login
        return pageIfNotConnected ?? const FirstOnboarding();
      },
    );
  }
}
