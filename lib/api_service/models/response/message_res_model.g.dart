// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResModel _$MessageResModelFromJson(Map<String, dynamic> json) {
  return MessageResModel()
    ..title = json['title'] as String?
    ..text = json['text'] as String?
    ..description = json['description'] as String;
}

Map<String, dynamic> _$MessageResModelToJson(MessageResModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'description': instance.description,
    };
