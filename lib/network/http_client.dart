// ignore_for_file: avoid_print

part of http;

class BaseHttpClient {
  late Dio _client;
  BaseHttpClient(
      {GlobalKey<NavigatorState>? navigatorKey,
      List<Interceptor>? interceptor,
      BaseOptions? option}) {
    _client = Dio(option);
    (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    if (interceptor != null) {
      interceptor.forEach((element) {
        _client.interceptors.add(element);
      });
    }
    PackageInfo.fromPlatform().then((package) {
      if (kDebugMode || package.packageName.contains('dev')) {
        final Alice alice = Alice(showNotification: false, maxCallsCount: 500);
        ShakeDetector.autoStart(
          onPhoneShake: () {
            alice.showInspector();
          },
          shakeThresholdGravity: 5,
        );
        if (navigatorKey != null) {
          alice.setNavigatorKey(navigatorKey);
        }

        _client.interceptors.add(_getDioInterceptor(alice.getDioInterceptor()));
      }
    });
  }

  Future<Response> get(
    String url, {
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) {
    if (headers != null) {
      _client.options.headers = headers;
    }
    return _client.get(
      url,
      options: options,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<Response> post(String url,
      {dynamic body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) {
    if (headers != null) {
      _client.options.headers = headers;
    }
    return _client.post(
      url,
      data: body,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put(String url,
          {dynamic body,
          Options? options,
          Map<String, dynamic>? headers,
          Map<String, dynamic>? queryParameters,
          CancelToken? cancelToken}) =>
      _client.put(url,
          data: body,
          options: options,
          queryParameters: queryParameters,
          cancelToken: cancelToken);

  Future<Response> delete(String url,
          {dynamic body,
          Options? options,
          Map<String, dynamic>? headers,
          Map<String, dynamic>? queryParameters,
          CancelToken? cancelToken}) =>
      _client.delete(url,
          options: options,
          queryParameters: queryParameters,
          cancelToken: cancelToken);
}

Interceptor _getDioInterceptor(AliceDioInterceptor aliceDioInterceptor) {
  return InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
    String headers = '';
    options.headers.forEach((key, value) {
      headers += '| $key: $value';
    });

    log('┌------------------------------------------------------------------------------');
    log('''| [DIO] Request: ${options.method} ${options.uri}
    | ${json.encode(options.data)}
    | Headers:\n$headers''');
    log('├------------------------------------------------------------------------------');
    aliceDioInterceptor.onRequest(options, handler);
  }, onResponse: (Response response, handler) async {
    log('| [DIO] Response [code ${response.statusCode}]: ${json.encode(response.data)}');
    log('└------------------------------------------------------------------------------');
    aliceDioInterceptor.onResponse(response, handler);
  }, onError: (DioError error, handler) async {
    log('| [DIO] Error: ${error.error}: ${error.response}');
    log('└------------------------------------------------------------------------------');
    aliceDioInterceptor.onError(error, handler);
  });
}
