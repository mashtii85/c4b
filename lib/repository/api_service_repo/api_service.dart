import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:c4b/config/context_provider.dart' as contextProvider;
import 'formatters/query_string.dart';
import 'models/response/baseResModel.dart';
import 'models/response/messageResModel.dart';

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
  Future<Map<String, dynamic>?> getCredential(
      {required String url,
      required Map<String, dynamic> body,
      String? appName}) async {
    return _getCredential(url: url, body: body);
  }

  Future<BaseResModel> get({required String url}) async {
    if (isDebug) {
      log.i('get request to $url');
    }

    http.Response response;
    Map<String, String> headerData;
    if (contextProvider.token != null && contextProvider.token!.isNotEmpty) {
      headerData = {
        "Accept": "application/json",
        "authorization": contextProvider.token!,
      };
    } else {
      headerData = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      };
    }
    Uri uri = Uri.parse(contextProvider.baseUrl! + url);
//
    response = await http.get(uri, headers: headerData);
    debugPrint(response.body);
    return BaseResModel.fromJson(json.decode(response.body));

  }

  Future<BaseResModel> post(
      ////
      {required String url,
      required dynamic body,
      String? shortCode}) async {
    try {
      token = contextProvider.token;
      final String completeUrl = contextProvider.baseUrl! + url;
      Uri uri = Uri.parse(completeUrl);

      final Map<String, String> headerData = {
        "Content-type": "application/json",
        "authorization": token,
        "Short-Code": shortCode ?? ""
      };
      var _body = body != null ? json.encode(body) : {};
      if (isDebug) {
        log.i('post request to $completeUrl with data: $_body');
      }
      http.Response response;

      response = await http.post(uri, body: _body, headers: headerData);
      var string = response.body;
      log.i(string);
      return BaseResModel.fromJson(json.decode(response.body));


    } on SocketException {
      return _socketException();
    } on HttpException {
      return _httpException();
    } catch (error) {
      return _generalCatchException(error);
    }
  }

  Future<BaseResModel> put({
    required String url,
    required dynamic body,
  }) async {
    try {
      token = contextProvider.token;
      final String completeUrl = contextProvider.baseUrl! + url;
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
      token = contextProvider.token;
      final String completeUrl = contextProvider.baseUrl! + url;
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
    token = contextProvider.token;
    if (isDebug) {
      log.i('get request to $url');
    }

    http.Response response;
    Map<String, String?> headerData;
    if (contextProvider.token != null && contextProvider.token!.isNotEmpty) {
      headerData = {
        "Accept": "application/json",
        "authorization": contextProvider.token,
      };
    } else {
      headerData = {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      };
    }
    Uri uri = Uri.parse(contextProvider.baseUrl! + url);

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
