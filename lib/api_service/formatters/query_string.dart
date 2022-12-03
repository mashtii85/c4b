class QueryString {
  String queryStringer(Map<dynamic, dynamic> params) {
    var qs = '?';
    var counter = 0;
    for (var key in params.keys) {
      var prefix = counter == 0 ? '' : '&';
      qs += prefix + key + '=' + params[key].toString();
      counter++;
    }
    return qs;
  }
}
