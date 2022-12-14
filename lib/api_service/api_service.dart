import 'dart:convert';
import 'dart:io';

import 'package:c4b/api_service/constants/api_service_constants.dart';
import 'package:c4b/api_service/formatters/query_string.dart';
import 'package:c4b/components/authentication/models/request/credential_req_model.dart';
import 'package:c4b/components/authentication/models/response/credential_res_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:c4b/config/context_provider.dart' as context_provider;
import 'models/response/base_res_model.dart';
import 'models/response/message_res_model.dart';

part 'fixtures.dart';

final log = Logger(
  printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 3,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: false),
);

class ApiService extends QueryString {
  static ApiService? _singleton;

  ApiService._internal();

  var token;
  bool? isLoginApi;

  factory ApiService() {
    _singleton ??= ApiService._internal();
    return _singleton!;
  }

  final isDebug = !kReleaseMode;

  /// get user name and password and return a token instead
  Future<String> getCredential({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    var response = await _getCredential(
      url: url,
      body: body,
    );

    return response;
  }

  Future<BaseResModel> get({required String url}) async {
    if (isDebug) {
      log.i('get request to $url');
    }

    http.Response response;
    Map<String, String> headerData;
    if (context_provider.token != null && context_provider.token!.isNotEmpty) {
      headerData = {
        "Accept": "application/json",
        "authorization": context_provider.token!,
      };
    } else {
      headerData = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      };
    }
    Uri uri = Uri.parse(context_provider.baseUrl! + url);
//
    response = await http.get(uri, headers: headerData);
    debugPrint(response.body);
    return BaseResModel.fromJson(json.decode(response.body));
  }

  Future<BaseResModel<T>> post<T>({
    required String url,
    required dynamic body,
  }) async {
    try {
      debugPrint(context_provider.token!);
      token = context_provider.token ?? '';
      final String completeUrl = context_provider.baseUrl! + url;
      Uri uri = Uri.parse(completeUrl);

      final Map<String, String> headerData = {
        "Content-type": "application/json",
        "Accept": "application/json",
        "authorization": token,
      };
      var _body = body != null ? json.encode(body) : {};
      if (isDebug) {
        log.i('post request to $completeUrl with data: $_body');
      }
      http.Response result;

      result = await http.post(uri, body: _body, headers: headerData);

      // log.i(bodyContent);
      // var res = BaseResModel<T>.fromJson(bodyContent);
      var res =
          await isAuthenticated<T>(RequestTypes.POST, result, url, _body);
      return res;
    } catch (error) {
      return _generalCatchException<T>(error);
    }
  }

  Future<BaseResModel> put({
    required String url,
    required dynamic body,
  }) async {
    try {
      token = context_provider.token;
      final String completeUrl = context_provider.baseUrl! + url;
      Uri uri = Uri.parse(completeUrl);

      final Map<String, String> headerData = {
        "Content-type": "application/json; charset=utf-8",
        "authorization": token
      };

      var _body = body != null ? json.encode(body) : {};

      if (isDebug) {
        log.i('put request request to $url with data: $_body');
      }
      http.Response response;

      response = await http.put(uri, body: _body, headers: headerData);

      return BaseResModel.fromJson(json.decode(response.body));
    } on SocketException {
      return _socketException();
    } on Exception {
      return _httpException();
    } catch (error) {
      return _generalCatchException(error);
    }
  }

  Future<BaseResModel> delete({
    required String url,
    required dynamic body,
  }) async {
    try {
      token = context_provider.token;
      final String completeUrl = context_provider.baseUrl! + url;
      Uri uri = Uri.parse(completeUrl);

      final Map<String, String> headerData = {
        "Content-type": "application/json",
        "authorization": token
      };
      var _body = body != null ? json.encode(body) : {};

      if (isDebug) {
        log.i('delete request request to $url with data: $_body');
      }
      http.Response response;
      response = await http.delete(uri, body: _body, headers: headerData);

      return BaseResModel.fromJson(json.decode(response.body));
    } on HttpException {
      return _httpException();
    } on SocketException {
      return _socketException();
    } catch (error) {
      return _generalCatchException(error);
    }
  }

//Todo: needs to be audited
  Future<BaseResModel> getFile({required String url}) async {
    token = context_provider.token;
    if (isDebug) {
      log.i('get request to $url');
    }

    http.Response response;
    Map<String, String?> headerData;
    if (context_provider.token != null && context_provider.token!.isNotEmpty) {
      headerData = {
        "Accept": "application/json",
        "authorization": context_provider.token,
      };
    } else {
      headerData = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      };
    }
    Uri uri = Uri.parse(context_provider.baseUrl! + url);

    response = await http.get(uri, headers: headerData as Map<String, String>?);
    try {
      if (response.statusCode == 200) {
        var bytes = response.bodyBytes;
        BaseResModel _baseModel = BaseResModel(
            payloadObjects: [], statusCode: 200, message: [], success: true);
        _baseModel.payloadObjects = bytes;
        return _baseModel;
      }

      var model = BaseResModel.fromJson(json.decode(response.body));
      return model;
    } catch (error) {
      log.i(error);
      return BaseResModel(
          payloadObjects: [], statusCode: 500, message: [], success: false);
    }
  }
}
