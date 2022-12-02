part of 'cubit.dart';

@immutable
abstract class AuthorizeState extends Equatable {
  const AuthorizeState();
  @override
  List<Object> get props => [];
}

class AuthorizeUninitialized extends AuthorizeState {
  AuthorizeUninitialized() {
    debugPrint('AuthorizeUninitialized');
  }
}

class AuthorizeAuthenticated extends AuthorizeState {
  final UserCredentialsModel userCredentials;
  AuthorizeAuthenticated({required this.userCredentials}) {
    debugPrint('AuthorizeAuthenticated=>${userCredentials.toJson()}');
  }
  @override
  String toString() {
    return 'LoggedIn { token: ${userCredentials.accessToken} }';
  }
}

class AuthorizeUnauthenticated extends AuthorizeState {
  AuthorizeUnauthenticated() {
    debugPrint('AuthorizeUnauthenticated');
  }
}


class AuthorizeLoading extends AuthorizeState {
  AuthorizeLoading() {
    debugPrint('AuthorizeLoading');
  }
}
