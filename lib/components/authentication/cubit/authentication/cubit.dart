import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c4b/components/authentication/cubit/authenticate_repository.dart';
import 'package:c4b/components/authentication/cubit/authorize/cubit.dart';

import 'package:c4b/repository/api_service_repo/models/response/messageResModel.dart';
import 'package:c4b/components/authentication/models/request/credential_req_model.dart';
import 'package:c4b/components/authentication/models/response/jwt_res_model.dart';
import 'package:c4b/components/authentication/models/response/credential_res_model.dart';
import 'package:flutter/material.dart';

part 'states.dart';

class AuthenticateCubit extends Cubit<AuthenticateStates> {
  final AuthenticateRepository userRepository;
  final AuthorizeCubit? authorizeCubit;

  static String? password;

  AuthenticateCubit({
    required this.userRepository,
    this.authorizeCubit,
  }) : super(AuthenticateUnInitialized());

  Future<void> logout() async {
    emit(AuthenticateUnInitialized());
    authorizeCubit!.unInitialize();
  }

  Future<void> loginButtonPressed(CredentialReqModel credential) async {
    emit(AuthenticateLoading());
    try {
      CredentialResModel model = await userRepository.login(credential);

      if (model.statusCode == 200) {
        var token = JwtResModel.fromJson(model.body);

        authorizeCubit!.loggedIn(credentials: credential,jwtPayload: token);
        emit(SignInSuccess());
      } else {
        emit(AuthenticateFailure(
            MessageResModel(title: model.body)));
      }
    } catch (error) {
      emit(AuthenticateFailure(MessageResModel(title: error.toString())));
    }
  }
}
