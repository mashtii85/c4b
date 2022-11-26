import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            width: double.infinity,
            color: /*AbBanColors.primaryColor.withOpacity(.7)*/ Theme.of(context)
                .primaryColor
                .withOpacity(.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                fixtures.appLogo,
                Column(
                  children: <Widget>[
                    CustomProgressIndicator(
                      color: fixtures.colorPalette.white,
                      size: 80,
                      type: ProgressIndicatorType.DoubleBounce,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(
                          color: fixtures.colorPalette.white, fontSize: 17),
                    )
                  ],
                ),
                Container(
                  height: 40,
                )
              ],
            ),
          )),
    );
  }
}
