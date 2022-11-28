part of 'cubit.dart';

@immutable
abstract class AuthenticateStates {
  const AuthenticateStates();
}

class AuthenticateUnInitialized extends AuthenticateStates {
  AuthenticateUnInitialized() {
    debugPrint('AuthenticateUnInitialized');
  }
}

class UserCredentialSuccess extends AuthenticateStates {
  final CredentialModelReq userCredential;

  UserCredentialSuccess(this.userCredential) {
    debugPrint('userCredentialSuccess=>${userCredential.toJson()}');
  }
}

class AuthenticateSucceeded extends AuthenticateStates {
  AuthenticateSucceeded() {
    debugPrint('AuthenticateSucceeded');
  }
}

class UserAuthenticateSucceeded extends AuthenticateStates {}

class AuthenticateLoading extends AuthenticateStates {
  AuthenticateLoading() {
    debugPrint('LoginLoading');
  }
}

class AuthenticateFailure extends AuthenticateStates {
  final MessageResModel message;

  const AuthenticateFailure(this.message);
}

class SignInSuccess extends AuthenticateStates {
  SignInSuccess() {
    debugPrint('GoToRegisterSuccess');
  }
}
