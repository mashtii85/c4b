part of 'cubit.dart';

@immutable
abstract class AuthorizeState {
  const AuthorizeState();
}

class AuthorizeUninitialized extends AuthorizeState {
  AuthorizeUninitialized() {
    debugPrint('AuthorizeUninitialized');
  }
}

class AuthorizeAuthenticated extends AuthorizeState {
  final JwtResModel jwtToken;
  AuthorizeAuthenticated({required this.jwtToken}) {
    debugPrint('AuthorizeAuthenticated=>${jwtToken.toJson()}');
  }
  @override
  String toString() {
    return 'LoggedIn { token: $jwtToken }';
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
