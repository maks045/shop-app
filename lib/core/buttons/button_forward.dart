import 'package:flutter/material.dart';

class ButtonForward extends StatelessWidget {
  final VoidCallback? onPressed;
  const ButtonForward({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 40,
        color: Colors.red,
        onPressed: onPressed, icon: Icon(Icons.arrow_forward_ios,color: Colors.grey,));
  }
}
