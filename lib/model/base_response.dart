import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

mixin BaseResponse {
  ErrorModel? get error;
  Meta? get meta;
}

mixin BaseData {
  int? get total;
  String? get message;
  String? get title;
  int? get count;
}

@freezed
class Meta with _$Meta {
  const factory Meta({String? version}) = _Meta;

  factory Meta.fromJson(dynamic json) => _$MetaFromJson(json);
}

@freezed
class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    required int code,
    required String title,
    required String message,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(dynamic json) => _$ErrorModelFromJson(json);
}
