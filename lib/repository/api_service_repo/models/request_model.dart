import '../constants/api_service_constants.dart';

class RequestModel {
  final String? url;
  final dynamic body;
  final RequestTypes? requestType;
  final dynamic headerData;
  RequestModel({this.url, this.body, this.requestType, this.headerData});
}
