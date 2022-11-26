class _Sizes {
  double appBarHeight = 50;
  double borderRadius = 15;
}

class Constants {
  static final Constants _constants = Constants._internal();
  factory Constants() {
    return _constants;
  }
  Constants._internal();
  _Sizes get sizes => _Sizes();
  String get loginPageBackGroundImage => 'assets/images/background.png';
  String fontFamily = 'Shabnam';
  String get appLogo => 'lib/assets/images/logo.png';
  String get loginImage => 'lib/assets/images/logo.png';
}
