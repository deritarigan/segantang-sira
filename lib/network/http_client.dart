part of http;
// final httpProvider = Provider((_) => HttpClient());
// final cancelTokenProvider = Provider((_) => CancelToken());

class HttpClient {
  late Dio _client;
  HttpClient({
    required GlobalKey<NavigatorState> navigatorKey,
    List<Interceptor>? interceptor,
  }) {
    _client = Dio();
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

        alice.setNavigatorKey(navigatorKey);
        _client.interceptors.add(_getDioInterceptor(alice.getDioInterceptor()));
      }
    });
  }

  Future<Response> get(
    String url, {
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required CancelToken cancelToken,
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
      required CancelToken cancelToken}) {
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
          required CancelToken cancelToken}) =>
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
          required CancelToken cancelToken}) =>
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

    print(
        '┌------------------------------------------------------------------------------');
    print('''| [DIO] Request: ${options.method} ${options.uri}
    | ${json.encode(options.data)}
    | Headers:\n$headers''');
    print(
        '├------------------------------------------------------------------------------');
    aliceDioInterceptor.onRequest(options, handler);
  }, onResponse: (Response response, handler) async {
    print(
        '| [DIO] Response [code ${response.statusCode}]: ${json.encode(response.data)}');
    print(
        '└------------------------------------------------------------------------------');
    aliceDioInterceptor.onResponse(response, handler);
  }, onError: (DioError error, handler) async {
    print('| [DIO] Error: ${error.error}: ${error.response}');
    print(
        '└------------------------------------------------------------------------------');
    aliceDioInterceptor.onError(error, handler);
  });
}
