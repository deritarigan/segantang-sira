// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DefaultResponse _$$_DefaultResponseFromJson(Map<String, dynamic> json) =>
    _$_DefaultResponse(
      error: json['error'] == null ? null : ErrorModel.fromJson(json['error']),
      meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
      data: json['data'] == null ? null : DefaultData.fromJson(json['data']),
    );

Map<String, dynamic> _$$_DefaultResponseToJson(_$_DefaultResponse instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'meta': instance.meta?.toJson(),
      'data': instance.data?.toJson(),
    };

_$_DefaultData _$$_DefaultDataFromJson(Map<String, dynamic> json) =>
    _$_DefaultData(
      total: json['total'] as int?,
      message: json['message'] as String?,
      title: json['title'] as String?,
      count: json['count'] as int?,
      rows: json['rows'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_DefaultDataToJson(_$_DefaultData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'message': instance.message,
      'title': instance.title,
      'count': instance.count,
      'rows': instance.rows,
    };
