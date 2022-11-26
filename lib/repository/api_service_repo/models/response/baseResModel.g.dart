// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baseResModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResModel _$BaseResModelFromJson(Map<String, dynamic> json) {
  return BaseResModel()
    ..statusCode = json['statusCode'] as num?
    ..targetUrl = json['targetUrl'] as String?
    ..payloads = json['payloads'] as Map<String, dynamic>?
    ..message = (json['message'] as List?)
        ?.map((e) => MessageResModel.fromJson(e as Map<String, dynamic>))
        .toList()
    ..success = json['success'] as bool?
    ..unAuthorizedRequest = json['unAuthorizedRequest'] as bool?;
}

Map<String, dynamic> _$BaseResModelToJson(BaseResModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'targetUrl': instance.targetUrl,
      'payloads': instance.payloads,
      'message': instance.message,
      'success': instance.success,
      'unAuthorizedRequest': instance.unAuthorizedRequest
    };
