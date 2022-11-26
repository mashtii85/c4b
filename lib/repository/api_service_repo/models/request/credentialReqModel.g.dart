// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentialReqModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialReqModel _$CredentialReqModelFromJson(Map<String, dynamic> json) {
  return CredentialReqModel(
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      grantType: json['grant_Type'] as String?,
      shortCode: json['Short-Code'] as String?
      );
}

Map<String, dynamic> _$CredentialReqModelToJson(CredentialReqModel instance) {
    if (instance.shortCode == null)
        return <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'grant_type': instance.grantType,
    };
    else
    return <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'grant_type': instance.grantType,
      'Short-Code':instance.shortCode
    };
    }
