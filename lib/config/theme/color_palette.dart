import 'package:c4b/extensions/color.dart';
import 'package:flutter/material.dart';

import '../fixture_provider.dart';


class ColorPalette extends IColorPalette {
  // this is the colors that used in color palette
  // *********************************************
  @override
  MaterialColor get primaryColor => const Color(0xffEF6C00).generateMaterialColor();
  @override
  MaterialColor get black => const Color(0xff000000).generateMaterialColor();
  @override
  MaterialColor get green => const Color(0xff43a047).generateMaterialColor();

  @override
  MaterialColor get grey => const Color(0xffcccccc).generateMaterialColor();

  @override
  MaterialColor get red => (const Color(0xffe53935).generateMaterialColor());

  @override
  MaterialColor get white => const Color(0xffffffff).generateMaterialColor();

  @override
  MaterialColor get yellow => const Color(0xffffb300).generateMaterialColor();

  @override
  MaterialColor get backgroundColor =>
      const Color(0xfffafafa).generateMaterialColor();


}
