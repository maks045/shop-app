import 'package:flutter/material.dart';

class Gradients {
  Gradients._();

  static final blueGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF506EFF), Color(0xFF00FFC7)],
  );

  static final triangleTopRight = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF30C8BF).withOpacity(0.6),
      Color(0xFF36DDC4),
      Color(0xFF50F6DA),
      Colors.transparent,
    ],
    stops: [0.0, 0.8, 1.0],
  );
}
