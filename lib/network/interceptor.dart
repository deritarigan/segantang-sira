part of http;

class SecurityInterceptor extends Interceptor {
  late final String pubKey;
  String? tokenKey;
  SecurityInterceptor({required this.pubKey, this.tokenKey});
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final timeStamp =
        (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    String token = '';
    if (options.headers.containsKey('Authorization') && tokenKey != null) {
      token = (await FlutterKeychain.get(key: tokenKey!)) ?? '';
    }

    var sign = '';
    if (options.method == 'POST' ||
        options.method == 'PUT' ||
        options.method == 'DELETE') {
      String stringReq = '{}';
      if (options.data != null && json.encode(options.data) != '') {
        stringReq = json.encode(options.data);
      }
      sign = SecurityUtil.signData(
          strPublicKey: pubKey,
          data: SecurityUtil.arrangeDataSign(stringReq, token, timeStamp),
          is256Hashed: true);
    } else if (options.method == 'GET') {
      Map<String, dynamic> params = Map.from(options.queryParameters);
      params.removeWhere((key, value) => value == null);
      sign = SecurityUtil.signData(
          strPublicKey: pubKey,
          data: SecurityUtil.arrangeDataSign(
              params.isEmpty
                  ? '{}'
                  : json.encode(params.map<String, String>((key, value) {
                      return MapEntry(key, value.toString());
                    })).toString(),
              token,
              timeStamp),
          is256Hashed: true);
    }
    var headers = Map<String, String>.from(options.headers);
    final deviceId = await FlutterKeychain.get(key: 'VentenyKey.KEY_DEVICE_ID');
    String platform = '';
    if (Platform.isAndroid) {
      platform = 'android';
    } else if (Platform.isIOS) {
      platform = 'ios';
    }
    headers.addAll({
      'timestamp': timeStamp,
      'sign': sign,
      'device-id': deviceId ?? '',
      'platform': platform,
    });
    if (token != '') {
      headers['Authorization'] = token;
    }
    var newRequestOption = options.copyWith(headers: headers);

    super.onRequest(newRequestOption, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}

class SessionExpiredInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      err.requestOptions.cancelToken?.cancel('Unauthorized');
    }
    super.onError(err, handler);
  }
}
