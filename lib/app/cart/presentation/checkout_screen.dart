import 'package:flutter/material.dart';
import 'package:shop_app/core/buttons/app_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Out')),
      body: Center(child: AppButton(text: 'Confirm')),
    );
  }
}
