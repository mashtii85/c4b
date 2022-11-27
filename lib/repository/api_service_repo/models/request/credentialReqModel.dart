import 'package:json_annotation/json_annotation.dart';

part 'credentialReqModel.g.dart';

@JsonSerializable()
class CredentialReqModel {
  CredentialReqModel({this.password, this.userName, this.grantType,this.shortCode});
  String? userName;
  String? password;
  String? grantType;
  String? shortCode;
  factory CredentialReqModel.fromString(Map<String, dynamic> json) =>
      _$CredentialReqModelFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialReqModelToJson(this);
}
