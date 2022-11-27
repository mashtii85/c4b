part of 'theme.dart';

var inputDecoration = InputDecorationTheme(
  filled: true,
  fillColor: fixtures.colorPalette.white,
  errorStyle: TextStyle(color: fixtures.colorPalette.red),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: fixtures.colorPalette.red),
    borderRadius: BorderRadius.circular(fixtures.borderRadius),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(fixtures.borderRadius),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: colorPalette.red),
    borderRadius: BorderRadius.circular(fixtures.borderRadius),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: colorPalette.primaryColor[500]!),
    borderRadius: BorderRadius.circular(fixtures!.borderRadius),
  ),
  labelStyle: TextStyle(color: fixtures.colorPalette.black, fontSize: 14),
  hintStyle: const TextStyle(
    fontSize: 12,
  ),
);
