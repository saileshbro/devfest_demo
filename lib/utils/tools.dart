import 'package:flutter/material.dart';

class Tools {
  static Color hexToColor(String code) {
    return Color(
        int.parse(code.substring(1, code.length), radix: 16) + 0xFF00000000);
  }

  static List<Color> multiColors = [
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.blue
  ];
}
