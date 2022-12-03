// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baseResModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResModel _$BaseResModelFromJson<T>(Map<String, dynamic> json) {
  var _payload = json['body'];

  var parse = _payload != null ? jsonDecode(_payload) : null;

  return BaseResModel<T>()
    ..statusCode = json['statusCode'] as num?
    ..payloads = parse
    // ..message = (json['message'] as List?)
    //     ?.map((e) => MessageResModel.fromJson(e as Map<String, dynamic>))
    //     .toList()
    ..payloadObjects = []
    ..success = json['statusCode'] == 200;
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
