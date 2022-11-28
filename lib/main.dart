import 'package:c4b/components/authentication/cubit/authenticate_repository.dart';
import 'package:c4b/components/authentication/cubit/authentication/cubit.dart';
import 'package:c4b/components/authentication/cubit/authorize/cubit.dart';
import 'package:c4b/config/bloc_observer.dart';
import 'package:flutter/material.dart';

import 'components/authentication/login.dart';
import 'config/theme/theme.dart';
import 'package:c4b/config/context_provider.dart' as contextProvider;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  runApp( MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AuthenticateRepository>(
        create: (context) => AuthenticateRepository(),
      ),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthorizeCubit? authorizeCubit;
  late AuthenticateCubit authenticateCubit;

  @override
  void initState() {
    authorizeCubit = AuthorizeCubit(
      userRepository: RepositoryProvider.of<AuthenticateRepository>(context),
    );
    authenticateCubit = AuthenticateCubit(
      authorizeCubit: authorizeCubit,
      userRepository: RepositoryProvider.of<AuthenticateRepository>(context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    contextProvider.baseUrl =
        'https://3a5t828wn0.execute-api.us-east-1.amazonaws.com/C4B2/';
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorizeCubit>(
          create: (context) => authorizeCubit!,
        ),

        /// authenticate user
        BlocProvider<AuthenticateCubit>(
          create: (context) => authenticateCubit,
        ),
      ],

        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,
          theme: theme(context, ''),
          home: Login(),
        ));
  }
}
