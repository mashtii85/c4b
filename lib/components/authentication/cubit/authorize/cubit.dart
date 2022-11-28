import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c4b/components/authentication/cubit/authenticate_repository.dart';
import 'package:c4b/components/authentication/models/request/credential_req_model.dart';
import 'package:c4b/components/authentication/models/response/credential_res_model.dart';
import 'package:c4b/components/authentication/models/response/jwt_res_model.dart';
import 'package:c4b/components/authentication/models/user_credentials_model.dart';
import 'package:flutter/material.dart';
import 'package:c4b/config/context_provider.dart' as context_provider;

part 'states.dart';

class AuthorizeCubit extends Cubit<AuthorizeState> {
  final AuthenticateRepository userRepository;

  AuthorizeCubit({required this.userRepository})
      : super(AuthorizeUninitialized());

  Future<void> appStarted() async {
    final UserCredentialsModel? userCredentials =
        await userRepository.retrieveToken();
    bool localRetrieved = userCredentials != null;

    if (userCredentials != null &&
        userCredentials!.accessToken != null &&
        userCredentials!.tokenType != null) {
      if (userCredentials.expireDate!.isBefore(DateTime.now())) {
        emit(AuthorizeUnauthenticated());
        context_provider.userCredentials = userCredentials;

        emit(AuthorizeAuthenticated(userCredentials: userCredentials));
      } else {
        userRepository.deleteToken();
        emit(AuthorizeUnauthenticated());
      }
    } else {
      emit(AuthorizeUnauthenticated());
    }
  }

  Future<void> loggedIn(
      {required CredentialReqModel credentials,
      required JwtResModel jwtPayload}) async {
    emit(AuthorizeLoading());
    UserCredentialsModel userCredentials = UserCredentialsModel()
      ..accessToken = jwtPayload!.accessToken!
      ..expireDate = jwtPayload!.expireDate!
      ..tokenType = jwtPayload!.tokenType!
      ..password = credentials!.password!
      ..username = credentials!.username!;

    await userRepository.persistToken(userCredentials);
    context_provider.userCredentials = userCredentials;
    emit(AuthorizeAuthenticated(userCredentials: userCredentials));
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
