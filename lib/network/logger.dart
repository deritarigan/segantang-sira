// // ignore_for_file: avoid_print

// part of http;

// final dioLoggerInterceptor =
//     InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
//   String headers = '';
//   options.headers.forEach((key, value) {
//     headers += '| $key: $value';
//   });

//   print(
//       '┌------------------------------------------------------------------------------');
//   print('''| [DIO] Request: ${options.method} ${options.uri}
// | ${json.encode(options.data)}
// | Headers:\n$headers''');
//   print(
//       '├------------------------------------------------------------------------------');
//   aliceInterceptor.onRequest(options, handler);
// }, onResponse: (Response response, handler) async {
//   print(
//       '| [DIO] Response [code ${response.statusCode}]: ${json.encode(response.data)}');
//   print(
//       '└------------------------------------------------------------------------------');
//   aliceInterceptor.onResponse(response, handler);
// }, onError: (DioError error, handler) async {
//   print('| [DIO] Error: ${error.error}: ${error.response}');
//   print(
//       '└------------------------------------------------------------------------------');
//   aliceInterceptor.onError(error, handler);
// });
