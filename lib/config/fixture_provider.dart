library fixtures_provider;

import 'package:flutter/material.dart';

late Fixtures _fixtures;

Fixtures get fixtures => _fixtures;

set withFixtures(Fixtures fixtures) => _fixtures = fixtures;

class Fixtures {
  Fixtures(
      {required this.borderRadius,
      required this.margin,
      required this.elevation,
      required this.appLogo,
      required this.drawer,
      required this.padding,
      required this.colorPalette,
      required this.loadingPage,
      required this.sizedBox,
      required this.font});

  final double borderRadius;
  final Distance margin;
  final double elevation;
  final Widget loadingPage;
  final Widget appLogo;
  final Widget drawer;
  final Distance padding;
  final Distance sizedBox;
  final IColorPalette colorPalette;
  final Font font;
}

class Distance {
  final double d04 = 4.0;
  final double d08 = 8.0;
  final double d12 = 12.0;
  final double d16 = 16.0;
  final double d20 = 20.0;
  final double d24 = 24.0;
  final double d28 = 28.0;
  final double d32 = 32.0;
  final double d36 = 36.0;
  final double d40 = 40.0;
  final double d44 = 44.0;
  final double d48 = 48.0;
  final double d52 = 52.0;
  final double d56 = 56.0;
  final double d60 = 60.0;
}

class Font {
  Font(
      {required this.labelLarge,
      required this.headlineMedium,
      required this.displayMedium,
      required this.titleLarge,
      required this.titleMedium,
      required this.bodyLarge,
      required this.bodyMedium});

  final TextStyle labelLarge;
  final TextStyle headlineMedium;
  final TextStyle displayMedium;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
}

abstract class IColorPalette {
  MaterialColor get primaryColor;

  MaterialColor get backgroundColor;

  MaterialColor get grey;

  MaterialColor get white;

  MaterialColor get black;

  MaterialColor get yellow;

  MaterialColor get red;

  MaterialColor get green;
}
