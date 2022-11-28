import 'package:equatable/equatable.dart';

class CredentialModelReq extends Equatable {
  String? username;
  String? password;

  CredentialModelReq({this.username, this.password});

  Map<String, dynamic> toJson() => {'username': username, 'password': password};

  @override
  // TODO: implement props
  List<Object?> get props => [username,password];
}
