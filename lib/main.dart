import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/presentation/shop_screen.dart';
import 'package:shop_app/core/theme/app_theme.dart';
import 'package:shop_app/features/auth/data/auth_layout.dart';
import 'package:shop_app/features/auth/presentation/screen/onboarding/first_onboarding.dart';
import 'package:shop_app/features/auth/presentation/screen/onboarding/second_onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/features/auth/presentation/screen/register_screen.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: AuthLayout(),
    );
  }
}
