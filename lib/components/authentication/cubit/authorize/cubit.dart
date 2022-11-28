import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c4b/components/authentication/cubit/authenticate_repository.dart';
import 'package:c4b/repository/login_repo/models/response/credential_res_model.dart';
import 'package:c4b/repository/login_repo/models/response/jwt_res_model.dart';
import 'package:flutter/material.dart';
import 'package:c4b/config/context_provider.dart' as contextProvider;

part 'states.dart';

class AuthorizeCubit extends Cubit<AuthorizeState> {
  final AuthenticateRepository userRepository;

  AuthorizeCubit({required this.userRepository})
      : super(AuthorizeUninitialized());

  Future<void> appStarted() async {
    final JwtResModel? _jwtToken = await userRepository.retrieveToken();

    if (_jwtToken != null &&
        _jwtToken.accessToken != null &&
        _jwtToken.tokenType!.isNotEmpty) {
      if (_jwtToken.accessToken!.length > 10) {
        //get global variable
        contextProvider.jwtPayload = _jwtToken;
        emit(AuthorizeAuthenticated(jwtToken: _jwtToken));
      } else {
        emit(AuthorizeUnauthenticated());
      }
    } else {
      emit(AuthorizeUnauthenticated());
    }
  }

  Future<void> loggedIn() async {
    emit(AuthorizeLoading());

    await userRepository.persistToken(contextProvider.jwtPayload!);
    // contextProvider.userCredential = userCredential;
    emit(AuthorizeAuthenticated(jwtToken: contextProvider.jwtPayload!));
  }

  Future<void> logOut() async {
    emit(AuthorizeLoading());
    await userRepository.deleteToken();
    emit(AuthorizeUnauthenticated());
  }

  Future<void> unInitialize() async {
    emit(AuthorizeUnauthenticated());
  }
}
