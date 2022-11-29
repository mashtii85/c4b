part of 'api_service.dart';

BaseResModel<T> _generalCatchException<T>(error) {
  var _baseModel = BaseResModel<T>(
      success: false,
      statusCode: 502,
      message: [MessageResModel(text: 'Error', description: error.toString())],
      payloads: <String, dynamic>{});
  return _baseModel;
}

BaseResModel<T> _httpException<T>() {
  var _baseModel = BaseResModel<T>(
      success: false,
      statusCode: 503,
      message: [
        MessageResModel(
            text: 'Error in fetching data',
            description: 'Service is unavailable!')
      ],
      payloads: <String, dynamic>{});
  return _baseModel;
}

BaseResModel<T> _socketException<T>() {
  var _baseModel = BaseResModel<T>(
      success: false,
      statusCode: 503,
      message: [
        MessageResModel(
            text: 'Error in fetching data',
            description: 'No internet connection!')
      ],
      payloads: <String, dynamic>{});

  return _baseModel;
}

Future<String> _getCredential(
    {required String url, required Map<String, dynamic> body}) async {
  try {
    final Map<String, String> headerData = {
      "Content-type": "application/x-www-form-urlencoded",
    };

    http.Response response;
    Uri uri = Uri.parse(context_provider.baseUrl! + url);
    // log.i(uri.toString());

    response = await http.post(uri, body: body,);
    log.i(response.body);
    return response.body;
  } catch (error) {
    log.i(error.toString());
    return '{statusCode=400,body=$error}';
  }
}
