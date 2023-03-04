import 'package:segantang_sira/model/base_response.dart';

class DefaultResponse extends BaseResponse {
  DefaultResponse(error, meta, this.data) : super(error: error, meta: meta);

  DefaultData? data;

  DefaultResponse.fromJson(dynamic json) {
    data = json['data'] != null ? DefaultData.fromJson(json['data']) : null;
    super.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class DefaultData extends BaseData {
  List<dynamic>? rows;

  DefaultData({this.rows});

  DefaultData.fromJson(dynamic json) {
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(v);
      });
    }
    baseFromJson(json);
  }
}


// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'base_response.dart';

// part 'default_response.freezed.dart';
// part 'default_response.g.dart';

// @freezed
// abstract class DefaultResponse with _$DefaultResponse, BaseResponse {
//   @Implements<BaseResponse>()
//   factory DefaultResponse({ErrorModel? error, Meta? meta, DefaultData? data}) =
//       _DefaultResponse;

//   factory DefaultResponse.fromJson(dynamic json) =>
//       _$DefaultResponseFromJson(json);
// }

// @freezed
// abstract class DefaultData with _$DefaultData, BaseData {
//   factory DefaultData(
//       {int? total,
//       String? message,
//       String? title,
//       int? count,
//       List<dynamic>? rows}) = _DefaultData;
//   factory DefaultData.fromJson(dynamic json) => _$DefaultDataFromJson(json);
// }


