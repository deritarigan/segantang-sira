import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segantang_sira/segantang_sira.dart';

class BaseNotifier extends StateNotifier<BaseState> {
  CancelToken? cancelToken;
  BaseNotifier(BaseState initState) : super(initState) {}
  // void doHandleDefaultResponse<T extends BaseResponse>(
  //   Response<dynamic> response,
  //   Function(T) onSuccessResponse,
  //   T instance,
  // ) {
  //   final statusCode = response.statusCode;
  //   try {
  //     final data = instance;
  //     if (statusCode != null) {
  //       if ((response.statusCode ?? 0) < 300 &&
  //           (response.statusCode ?? 0) >= 200) {
  //         onSuccessResponse(data);
  //       } else if (statusCode == 504) {
  //         state = onStateError("Couldn't fetch ${instance.runtimeType}.");
  //       } else if (statusCode >= 500) {
  //         state = onStateSpecificError(
  //             message: data.error?.message ??
  //                 'Terjadi kesalahan pada server. Silahkan coba lagi atau hubungi tim kami.',
  //             title: 'Oops!',
  //             errorCode: 500);
  //       } else if (statusCode >= 400 && statusCode < 500 && statusCode != 401) {
  //         state = onStateSpecificError(
  //             message: data.error?.message ?? '-',
  //             title: 'Oops!',
  //             errorCode: 400,
  //             specificErrorCode: data.error?.code ?? 0);
  //       } else {
  //         state = onStateError(data.error?.message ?? '');
  //       }
  //     } else {
  //       onStateError(data.error?.message ?? '');
  //     }
  //   } catch (e) {
  //     state = onStateError("Couldn't fetch ${instance.runtimeType}.");
  //   }
  // }

  // void _handleDefaultNetworkError(Response<dynamic> response) {
  //   final ErrorModel error =
  //       DefaultResponse.fromJson(response.data).error ?? ErrorModel();
  // }
}
