import 'package:c4b/components/authentication/cubit/authentication/cubit.dart';
import 'package:c4b/components/authentication/screens/authenticate.dart';
import 'package:c4b/components/common/loading.dart';
import 'package:c4b/components/products/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:c4b/config/context_provider.dart' as context_provider;
import '../cubit/authorize/cubit.dart';

class Authorize extends StatefulWidget {
  const Authorize({super.key});

  @override
  State<Authorize> createState() => _AuthorizeState();
}

class _AuthorizeState extends State<Authorize> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizeCubit, AuthorizeState>(
      bloc: context.read<AuthorizeCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthorizeUninitialized) {
          context.read<AuthorizeCubit>().appStarted();
        } else if (state is AuthorizeUnauthenticated) {
          return const Authenticate();
        } else if (state is AuthorizeAuthenticated) {
          context_provider.logout = context.read<AuthenticateCubit>().logout;
          return const Products();
        }
        return const Loading();
      },
    );
  }
}
