part of '../../api_service/api_service.dart';

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


Future<BaseResModel<T>> isAuthenticated<T>(
    RequestTypes requestType, http.Response result, String url, body) async {
  try {
    var json = jsonDecode(result.body);

    if (json['statusCode'] != 401) {
      var res = BaseResModel<T>.fromJson(json);
      return res;
    } else {
      context_provider.logout();
      return BaseResModel();

    }
  } on SocketException {
    return _socketException<T>();
  } on HttpException {
    return _httpException<T>();
  } catch (error) {
    return BaseResModel<T>()
      ..statusCode = 503
      ..message = [
        MessageResModel(text: 'error', description: error.toString())
      ]
      ..payloadObjects = []
      ..payloads = {'message': 'error from refresh token catch'};
  }
}
