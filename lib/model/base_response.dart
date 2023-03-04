abstract class BaseResponse {
  Error? error;
  Meta? meta;

  BaseResponse({this.error, this.meta});

  fromJson(dynamic json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  BaseResponse.fromJson(dynamic json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (error != null) {
      map['error'] = error?.toJson();
    }

    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }
}

class Meta {
  String? version;

  Meta({this.version});

  Meta.fromJson(dynamic json) {
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['version'] = version;
    return map;
  }
}

abstract class BaseData {
  int? total;
  String? message;
  String? title;
  int? count;

  BaseData({this.total, this.message, this.title, this.count});

  baseFromJson(dynamic json) {
    total = json['total'];
    message = json['message'];
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['total'] = total;
    map['message'] = message;
    map['title'] = title;
    map['count'] = count;
    return map;
  }
}

class Error {
  int? code;
  String? title;
  String? message;

  Error({this.code, this.title, this.message});

  Error.fromJson(dynamic json) {
    code = json['code'];
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = code;
    map['title'] = title;
    map['message'] = message;
    return map;
  }
}

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'base_response.freezed.dart';
// part 'base_response.g.dart';

// mixin BaseResponse {
//   ErrorModel? get error;
//   Meta? get meta;
// }

// mixin BaseData {
//   int? get total;
//   String? get message;
//   String? get title;
//   int? get count;
// }

// @freezed
// class Meta with _$Meta {
//   const factory Meta({String? version}) = _Meta;

//   factory Meta.fromJson(dynamic json) => _$MetaFromJson(json);
// }

// @freezed
// class ErrorModel with _$ErrorModel {
//   const factory ErrorModel({
//     required int code,
//     required String title,
//     required String message,
//   }) = _ErrorModel;

//   factory ErrorModel.fromJson(dynamic json) => _$ErrorModelFromJson(json);
// }
