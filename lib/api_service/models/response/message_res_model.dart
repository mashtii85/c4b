import 'package:json_annotation/json_annotation.dart';

part 'message_res_model.g.dart';

@JsonSerializable()
class MessageResModel {
  MessageResModel({
    this.title,
    this.description,
    this.text,
  });

  String? title;
  String? text;
  String? description;

  factory MessageResModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResModelToJson(this);
}
