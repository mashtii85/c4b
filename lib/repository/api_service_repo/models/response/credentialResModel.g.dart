// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentialResModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialResModel _$CredentialResModelFromJson(Map<String, dynamic> json) {
  return CredentialResModel()
    ..access_token = json['access_token'] as String?
    ..token_type = json['token_type'] as String?
    ..expires_in = json['expires_in'] as num?
    ..refresh_token = json['refresh_token'] as String?
    ..issued =
        json['issued'] == null ? null : DateTime.parse(json['issued'] as String)
    ..expires = json['expires'] == null
        ? null
        : DateTime.parse(json['expires'] as String)
    ..error = json['error'] as String?
    ..baseUrl = json['baseUrl'] as String?
    ..error_description = json['error_description'] as String?;
}

Map<String, dynamic> _$CredentialResModelToJson(CredentialResModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
      'refresh_token': instance.refresh_token,
      'issued': instance.issued?.toIso8601String(),
      'expires': instance.expires?.toIso8601String(),
      'error': instance.error,
      'error_description': instance.error_description,
      'baseUrl': instance.baseUrl
    };
