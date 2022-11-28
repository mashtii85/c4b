import 'package:json_annotation/json_annotation.dart';

part 'messageResModel.g.dart';

@JsonSerializable()
class MessageResModel {
  MessageResModel(
      {this.type,
      this.title,
      this.description,
      this.text,
      this.developerMessage});

  String? type;
  String? title;
  String? text;
  String? description;
  String? developerMessage;

  factory MessageResModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageResModelToJson(this);
}
