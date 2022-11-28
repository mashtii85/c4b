part of 'api_service.dart';

BaseResModel _generalCatchException(error) {
  var _baseModel = BaseResModel(
      success: false,
      statusCode: 502,
      message: [MessageResModel(text: 'Error', description: error.toString())],
      payloads: Map<String, dynamic>());
  return _baseModel;
}

BaseResModel _httpException() {
  var _baseModel = BaseResModel(
      success: false,
      statusCode: 503,
      message: [
        MessageResModel(
            text: 'Error in fetching data',
            description: 'Service is unavailable!')
      ],
      payloads: Map<String, dynamic>());
  return _baseModel;
}

BaseResModel _socketException() {
  var _baseModel = BaseResModel(
      success: false,
      statusCode: 503,
      message: [
        MessageResModel(
            text: 'Error in fetching data',
            description: 'No internet connection!')
      ],
      payloads: Map<String, dynamic>());
  return _baseModel;
}

Future<String> _getCredential(
    {required String url, required Map<String, dynamic> body}) async {
  try {
    final Map<String, String> headerData = {
      "Content-type": "application/x-www-form-urlencoded",
    };

    http.Response response;
    Uri uri = Uri.parse(contextProvider.baseUrl! + url);

    response = await http.post(uri, body: body,);
    log.i(response.body);
    return response.body;
  } catch (error) {
    log.i(error.toString());
    return '{statusCode=400,body=$error}';
  }
}
