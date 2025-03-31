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

  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
