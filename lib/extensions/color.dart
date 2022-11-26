import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExtension on Color {
  MaterialColor generateMaterialColor() {
    return MaterialColor(this.value, <int, Color>{
      50: tintColor(this, 0.9),
      100: tintColor(this, 0.8),
      150: tintColor(this, 0.7),
      200: tintColor(this, 0.6),
      300: tintColor(this, 0.4),
      400: tintColor(this, 0.2),
      500: tintColor(this, 0.0),
      600: shadeColor(this, 0.1),
      700: shadeColor(this, 0.2),
      800: shadeColor(this, 0.3),
      900: shadeColor(this, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
