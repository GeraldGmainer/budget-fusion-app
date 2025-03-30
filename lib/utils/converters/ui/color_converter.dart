import 'package:flutter/material.dart';

class ColorConverter {
  static Color stringToColor(String? hex) {
    if (hex == null) {
      return Colors.white;
    }
    String cleanHex = hex.toUpperCase().replaceAll("#", "");
    if (cleanHex.length == 6) {
      cleanHex = "FF$cleanHex";
    }
    return Color(int.parse(cleanHex, radix: 16));
  }
}
