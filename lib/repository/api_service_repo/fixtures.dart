part of 'api_service.dart';

BaseResModel _generalCatchException(error) {
  var _baseModel = BaseResModel(
      success: false,
      statusCode: 502,
      message: [MessageResModel(text: 'خطا', description: error.toString())],
      payloads: Map<String, dynamic>());
  return _baseModel;
}

BaseResModel _httpException() {
  var _baseModel = BaseResModel(
      success: false,
      statusCode: 503,
      message: [
        MessageResModel(
            text: 'خطا در واکشی', description: 'سرویس در دسترس نیست')
      ],
      payloads: Map<String, dynamic>());
  return _baseModel;
}

BaseResModel _socketException() {
  var _baseModel = BaseResModel(
      success: false,
      statusCode: 503,
      message: [
        MessageResModel(text: 'خطا در واکشی', description: 'اینترنت قطع است')
      ],
      payloads: Map<String, dynamic>());
  return _baseModel;
}



Future<Map<String, dynamic>?> _getCredential(
    {required String url,
    required Map<String, dynamic> body,
    String? appName}) async {
  try {
    final Map<String, String> headerData = {
      "Content-type": "application/x-www-form-urlencoded",
    };

    http.Response response;
    Uri uri = Uri.parse(contextProvider.baseUrl! + url);
    response = await http.post(uri, body: body, headers: headerData);
    log.i(json.decode(response.body).runtimeType.toString());
    return json.decode(response.body);
  } catch (error) {
    log.i(error.toString());
    return null;
  }
}
