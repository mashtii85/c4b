import 'package:json_annotation/json_annotation.dart';

part 'credentialResModel.g.dart';

@JsonSerializable()
class CredentialResModel {
  CredentialResModel(
      {this.access_token,
      this.error,
      this.error_description,
      this.expires,
      this.expires_in,
      this.issued,
      this.refresh_token,
      this.token_type,
      this.baseUrl});

  String? access_token;
  String? token_type;
  num? expires_in;
  String? refresh_token;
  DateTime? issued;
  DateTime? expires;
  String? error;
  String? error_description;
  String? baseUrl;
  factory CredentialResModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialResModelFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialResModelToJson(this);
}
