import 'package:c4b/components/common/loading.dart';
import 'package:c4b/components/common/logo.dart';
import 'package:flutter/material.dart';

import 'color_palette.dart';
import '../constants.dart';
import '../fixture_provider.dart';
part 'fonts.dart';
part 'snack_bar.dart';
part 'floating_action_button.dart';
part 'button.dart';
part 'card.dart';
part 'input_decoration.dart';
part 'primary_text.dart';
part 'tab_bar.dart';
part 'text.dart';
part 'color_scheme.dart';
part 'banner.dart';

IColorPalette colorPalette = ColorPalette();

ThemeData theme(BuildContext context, String fontFamily) {
  withFixtures = Fixtures(
    drawer: const Drawer(),
    appLogo: const Logo(),
    loadingPage: const Loading(),
    colorPalette: colorPalette,
    borderRadius: 5,
    margin: Distance(),
    padding: Distance(),
    sizedBox: Distance(),
    elevation: 3,
    font:font
  );
  return ThemeData(
    errorColor: colorPalette.red,
    primaryColor: colorPalette.primaryColor[500],
    splashColor: colorPalette.primaryColor[300],
    iconTheme: IconThemeData(color: colorPalette.primaryColor[500], size: 20),
    focusColor: Theme.of(context).primaryColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: fixtures.colorPalette.white,
    ),
    snackBarTheme: snackBar,
    floatingActionButtonTheme:floatingActionButton ,
    buttonTheme: button ,
    inputDecorationTheme: inputDecoration,
    scaffoldBackgroundColor: colorPalette.grey[200],
    primaryTextTheme: primaryText,
    tabBarTheme: tabBar,
    cardTheme: card,
    appBarTheme: AppBarTheme(color: fixtures.colorPalette.white),
    backgroundColor: fixtures.colorPalette.white,
    bannerTheme: banner(fontFamily),
    indicatorColor: fixtures.colorPalette.yellow,
    fontFamily: fontFamily,
    textTheme: text,
    colorScheme:colorScheme
  );
}
