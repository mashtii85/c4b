// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messageResModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResModel _$MessageResModelFromJson(Map<String, dynamic> json) {
  return MessageResModel()
    ..type = json['type'] as String?
    ..title = json['title'] as String?
    ..text = json['text'] as String?
    ..description = json['description'] as String?
    ..developerMessage = json['developerMessage'] as String?;
}

Map<String, dynamic> _$MessageResModelToJson(MessageResModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'text': instance.text,
      'description': instance.description,
      'developerMessage': instance.developerMessage
    };
