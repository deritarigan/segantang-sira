// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'default_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) {
  return _DefaultResponse.fromJson(json);
}

/// @nodoc
mixin _$DefaultResponse {
  ErrorModel? get error => throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;
  DefaultData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultResponseCopyWith<DefaultResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultResponseCopyWith<$Res> {
  factory $DefaultResponseCopyWith(
          DefaultResponse value, $Res Function(DefaultResponse) then) =
      _$DefaultResponseCopyWithImpl<$Res, DefaultResponse>;
  @useResult
  $Res call({ErrorModel? error, Meta? meta, DefaultData? data});

  $ErrorModelCopyWith<$Res>? get error;
  $MetaCopyWith<$Res>? get meta;
  $DefaultDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DefaultResponseCopyWithImpl<$Res, $Val extends DefaultResponse>
    implements $DefaultResponseCopyWith<$Res> {
  _$DefaultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorModelCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrorModelCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DefaultDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DefaultResponseCopyWith<$Res>
    implements $DefaultResponseCopyWith<$Res> {
  factory _$$_DefaultResponseCopyWith(
          _$_DefaultResponse value, $Res Function(_$_DefaultResponse) then) =
      __$$_DefaultResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ErrorModel? error, Meta? meta, DefaultData? data});

  @override
  $ErrorModelCopyWith<$Res>? get error;
  @override
  $MetaCopyWith<$Res>? get meta;
  @override
  $DefaultDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_DefaultResponseCopyWithImpl<$Res>
    extends _$DefaultResponseCopyWithImpl<$Res, _$_DefaultResponse>
    implements _$$_DefaultResponseCopyWith<$Res> {
  __$$_DefaultResponseCopyWithImpl(
      _$_DefaultResponse _value, $Res Function(_$_DefaultResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DefaultResponse(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DefaultResponse implements _DefaultResponse {
  _$_DefaultResponse({this.error, this.meta, this.data});

  factory _$_DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DefaultResponseFromJson(json);

  @override
  final ErrorModel? error;
  @override
  final Meta? meta;
  @override
  final DefaultData? data;

  @override
  String toString() {
    return 'DefaultResponse(error: $error, meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DefaultResponse &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, meta, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DefaultResponseCopyWith<_$_DefaultResponse> get copyWith =>
      __$$_DefaultResponseCopyWithImpl<_$_DefaultResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefaultResponseToJson(
      this,
    );
  }
}

abstract class _DefaultResponse implements DefaultResponse, BaseResponse {
  factory _DefaultResponse(
      {final ErrorModel? error,
      final Meta? meta,
      final DefaultData? data}) = _$_DefaultResponse;

  factory _DefaultResponse.fromJson(Map<String, dynamic> json) =
      _$_DefaultResponse.fromJson;

  @override
  ErrorModel? get error;
  @override
  Meta? get meta;
  @override
  DefaultData? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultResponseCopyWith<_$_DefaultResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

DefaultData _$DefaultDataFromJson(Map<String, dynamic> json) {
  return _DefaultData.fromJson(json);
}

/// @nodoc
mixin _$DefaultData {
  int? get total => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  List<dynamic>? get rows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultDataCopyWith<DefaultData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultDataCopyWith<$Res> {
  factory $DefaultDataCopyWith(
          DefaultData value, $Res Function(DefaultData) then) =
      _$DefaultDataCopyWithImpl<$Res, DefaultData>;
  @useResult
  $Res call(
      {int? total,
      String? message,
      String? title,
      int? count,
      List<dynamic>? rows});
}

/// @nodoc
class _$DefaultDataCopyWithImpl<$Res, $Val extends DefaultData>
    implements $DefaultDataCopyWith<$Res> {
  _$DefaultDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? message = freezed,
    Object? title = freezed,
    Object? count = freezed,
    Object? rows = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      rows: freezed == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DefaultDataCopyWith<$Res>
    implements $DefaultDataCopyWith<$Res> {
  factory _$$_DefaultDataCopyWith(
          _$_DefaultData value, $Res Function(_$_DefaultData) then) =
      __$$_DefaultDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      String? message,
      String? title,
      int? count,
      List<dynamic>? rows});
}

/// @nodoc
class __$$_DefaultDataCopyWithImpl<$Res>
    extends _$DefaultDataCopyWithImpl<$Res, _$_DefaultData>
    implements _$$_DefaultDataCopyWith<$Res> {
  __$$_DefaultDataCopyWithImpl(
      _$_DefaultData _value, $Res Function(_$_DefaultData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? message = freezed,
    Object? title = freezed,
    Object? count = freezed,
    Object? rows = freezed,
  }) {
    return _then(_$_DefaultData(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      rows: freezed == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DefaultData implements _DefaultData {
  _$_DefaultData(
      {this.total,
      this.message,
      this.title,
      this.count,
      final List<dynamic>? rows})
      : _rows = rows;

  factory _$_DefaultData.fromJson(Map<String, dynamic> json) =>
      _$$_DefaultDataFromJson(json);

  @override
  final int? total;
  @override
  final String? message;
  @override
  final String? title;
  @override
  final int? count;
  final List<dynamic>? _rows;
  @override
  List<dynamic>? get rows {
    final value = _rows;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DefaultData(total: $total, message: $message, title: $title, count: $count, rows: $rows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DefaultData &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, message, title, count,
      const DeepCollectionEquality().hash(_rows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DefaultDataCopyWith<_$_DefaultData> get copyWith =>
      __$$_DefaultDataCopyWithImpl<_$_DefaultData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefaultDataToJson(
      this,
    );
  }
}

abstract class _DefaultData implements DefaultData {
  factory _DefaultData(
      {final int? total,
      final String? message,
      final String? title,
      final int? count,
      final List<dynamic>? rows}) = _$_DefaultData;

  factory _DefaultData.fromJson(Map<String, dynamic> json) =
      _$_DefaultData.fromJson;

  @override
  int? get total;
  @override
  String? get message;
  @override
  String? get title;
  @override
  int? get count;
  @override
  List<dynamic>? get rows;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultDataCopyWith<_$_DefaultData> get copyWith =>
      throw _privateConstructorUsedError;
}
