import 'package:json_annotation/json_annotation.dart';

import 'messageResModel.dart';

part 'baseResModel.g.dart';

@JsonSerializable()
class BaseResModel<T> {
  BaseResModel(
      {this.payloads,
      this.statusCode,
      this.success,
      this.targetUrl,
      this.unAuthorizedRequest,
      this.message,
      this.payloadObjects});

  num? statusCode;
  String? targetUrl;
  Map<String, dynamic>? payloads = Map<String, dynamic>();
  List<MessageResModel>? message;
  bool? success;
  bool? unAuthorizedRequest;
  List<T>? payloadObjects;

  factory BaseResModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResModelFromJson(json) as BaseResModel<T>;
  Map<String, dynamic> toJson() => _$BaseResModelToJson(this);
}
