part of 'theme.dart';

var floatingActionButton = FloatingActionButtonThemeData(
    elevation: fixtures!.elevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(fixtures!.borderRadius),
    ),
    backgroundColor: colorPalette.primaryColor[500],
    foregroundColor: fixtures.colorPalette.white,
    focusColor: colorPalette.primaryColor[700],
    highlightElevation: .4,
    splashColor: colorPalette.primaryColor,
    focusElevation: .9);
