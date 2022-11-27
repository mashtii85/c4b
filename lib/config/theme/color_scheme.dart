part of 'theme.dart';

var colorScheme = ColorScheme(
    background: fixtures.colorPalette.red,
    primary: colorPalette.primaryColor[500]!,
    secondary: colorPalette.primaryColor,
    surface: fixtures.colorPalette.grey,
    error: colorPalette.red[600]!,
    onPrimary: colorPalette.primaryColor[300]!,
    onSecondary: colorPalette.primaryColor[300]!,
    onError: colorPalette.red[300]!,
    onBackground: fixtures.colorPalette.green,
    onSurface: fixtures.colorPalette.yellow,
    brightness: Brightness.light);
