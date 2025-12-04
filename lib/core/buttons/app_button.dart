import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/gradient.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        foregroundColor: AppTheme.primary,
            backgroundColor: AppTheme.primary,
        textStyle: AppTheme.headlineMedium,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
        onPressed: onPressed, child: Text(text,style: AppTheme.headlineMedium,));
  }
}
