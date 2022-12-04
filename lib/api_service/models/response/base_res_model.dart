import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'message_res_model.dart';

part 'base_res_model.g.dart';

@JsonSerializable()
class BaseResModel<T> {
  BaseResModel(
      {this.payloads,
      this.statusCode,
      this.success,
      this.message,
      this.payloadObjects});

  num? statusCode;
  dynamic payloads;
  List<MessageResModel>? message;
  bool? success;
  List<T>? payloadObjects;

  factory BaseResModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResModelFromJson<T>(json) as BaseResModel<T>;

  Map<String, dynamic> toJson() => _$BaseResModelToJson(this);
}
