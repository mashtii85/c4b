import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:c4b/components/authentication/cubit/authenticate_repository.dart';
import 'package:c4b/components/authentication/cubit/authorize/cubit.dart';

// import 'package:c4b/repository/api_service_repo/models/request/credentialReqModel.dart';
import 'package:c4b/repository/api_service_repo/models/response/messageResModel.dart';
import 'package:c4b/repository/login_repo/models/request/credential_model.dart';
import 'package:c4b/repository/login_repo/models/response/jwt_res_model.dart';
import 'package:c4b/repository/login_repo/models/response/credential_res_model.dart';
import 'package:flutter/material.dart';
import 'package:c4b/config/context_provider.dart' as contextProvider;

part 'states.dart';

class AuthenticateCubit extends Cubit<AuthenticateStates> {
  final AuthenticateRepository userRepository;
  final AuthorizeCubit? authorizeCubit;

  // verification properties
  static String? password;

  AuthenticateCubit({
    required this.userRepository,
    this.authorizeCubit,
  }) : super(AuthenticateUnInitialized());

  Future<void> logout() async {
    emit(AuthenticateUnInitialized());
    authorizeCubit!.unInitialize();
  }

  Future<void> loginButtonPressed(CredentialModelReq credential) async {
    emit(AuthenticateLoading());
    try {
      CredentialResModel model = await userRepository.login(credential);

      if (model.statusCode == 200) {
        var token = JwtResModel.fromJson(model.body);
        authorizeCubit!.loggedIn();
        emit(SignInSuccess());

        authorizeCubit!.loggedIn();
        emit(SignInSuccess());
      } else {
        emit(AuthenticateFailure(
            MessageResModel(title: 'User name or password is incorrect')));
      }
    } catch (error) {
      emit(AuthenticateFailure(MessageResModel(title: error.toString())));
    }
  }
}
