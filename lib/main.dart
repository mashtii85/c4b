import 'package:c4b/components/common/custom_progress_indicator.dart';
import 'package:c4b/config/constants.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';


import 'components/authentication/login.dart';
import 'config/theme/theme.dart';

void main() {
  // withFixtures = Fixtures(
  //     drawer: const Drawer(),
  //     appLogo: const Logo(),
  //     loadingPage: const Loading(),
  //     colorPalette: colorPalette,
  //     borderRadius: 5,
  //     margin: Distance(),
  //     padding: Distance(),
  //     sizedBox: Distance(),
  //     elevation: 3,
  //     font:font
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: theme(context, ''),
      home: const Login(),
    );
  }
}


