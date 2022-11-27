import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/authentication/login.dart';
import 'config/theme/theme.dart';
import 'package:c4b/config/context_provider.dart' as contextProvider;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    contextProvider.baseUrl = 'https://3a5t828wn0.execute-api.us-east-1.amazonaws.com/C4B2/';

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: theme(context, ''),
      home: Login(),
    );
  }
}


