import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppTheme.grey, indent: 20);
  }
}
