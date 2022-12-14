import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_response.dart';

part 'default_response.freezed.dart';
part 'default_response.g.dart';

@freezed
abstract class DefaultResponse with _$DefaultResponse, BaseResponse {
  @Implements<BaseResponse>()
  factory DefaultResponse({ErrorModel? error, Meta? meta, DefaultData? data}) =
      _DefaultResponse;

  factory DefaultResponse.fromJson(dynamic json) =>
      _$DefaultResponseFromJson(json);
}

@freezed
abstract class DefaultData with _$DefaultData, BaseData {
  factory DefaultData(
      {int? total,
      String? message,
      String? title,
      int? count,
      List<dynamic>? rows}) = _DefaultData;
  factory DefaultData.fromJson(dynamic json) => _$DefaultDataFromJson(json);
}
