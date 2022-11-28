import 'package:c4b/components/authentication/cubit/authenticate_repository.dart';
import 'package:c4b/config/bloc_observer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:c4b/app.dart';

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


