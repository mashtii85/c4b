import 'package:c4b/components/authentication/cubit/authenticate_repository.dart';
import 'package:c4b/components/authentication/cubit/authentication/cubit.dart';
import 'package:c4b/components/authentication/cubit/authorize/cubit.dart';
import 'package:c4b/components/products/models/response/product_res_model.dart';
import 'package:c4b/components/products/screens/product_list.dart';
import 'package:flutter/material.dart';

import 'components/authentication/screens/authorize.dart';
import 'config/theme/theme.dart';
import 'package:c4b/config/context_provider.dart' as context_provider;
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context_provider.baseUrl =
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
          theme: theme(context, 'fontFamily'),
          home: ProductList([
            ProductResModel(
                id: 1,
                name: "Motorola Edge (2022)",
                price: 1319,
                color: 'green',
                count: 50,
                image: "https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge-2022-1.jpg",
                brand: "Motorola")
          ]),
          // home: const Authorize(),
        ));
  }
}
