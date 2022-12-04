// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResModel _$BaseResModelFromJson<T>(Map<String, dynamic> json) {
  var _payload = json['body'];

  var parse = _payload != null ? jsonDecode(_payload) : null;

  return BaseResModel<T>()
    ..statusCode = json['statusCode'] as num?
    ..payloads = parse
    ..payloadObjects = []
    ..success = json['statusCode'] == 200;
}

Map<String, dynamic> _$BaseResModelToJson(BaseResModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'payloads': instance.payloads,
      'message': instance.message,
      'success': instance.success,
    };
