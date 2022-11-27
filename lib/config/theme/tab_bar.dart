part of 'theme.dart';

var tabBar = TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    unselectedLabelStyle: TextStyle(
        color: fixtures.colorPalette.red,
        fontSize: 12,
        fontFamily: Constants().fontFamily),
    indicator: UnderlineTabIndicator(
      borderSide:
          BorderSide(color: colorPalette.primaryColor[500]!, width: 1.0),
    ),
    labelColor: colorPalette.primaryColor[500],
    labelStyle: TextStyle(
        fontSize: 14,
        color: fixtures.colorPalette.red,
        fontFamily: Constants().fontFamily),
    unselectedLabelColor: fixtures.colorPalette.black);
