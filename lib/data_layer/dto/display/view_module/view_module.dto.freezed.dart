// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_module.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewModuleDto _$ViewModuleDtoFromJson(Map<String, dynamic> json) {
  return _ViewModuleDto.fromJson(json);
}

/// @nodoc
mixin _$ViewModuleDto {
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewModuleDtoCopyWith<ViewModuleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewModuleDtoCopyWith<$Res> {
  factory $ViewModuleDtoCopyWith(
          ViewModuleDto value, $Res Function(ViewModuleDto) then) =
      _$ViewModuleDtoCopyWithImpl<$Res, ViewModuleDto>;
  @useResult
  $Res call({String? type});
}

/// @nodoc
class _$ViewModuleDtoCopyWithImpl<$Res, $Val extends ViewModuleDto>
    implements $ViewModuleDtoCopyWith<$Res> {
  _$ViewModuleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewModuleDtoCopyWith<$Res>
    implements $ViewModuleDtoCopyWith<$Res> {
  factory _$$_ViewModuleDtoCopyWith(
          _$_ViewModuleDto value, $Res Function(_$_ViewModuleDto) then) =
      __$$_ViewModuleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type});
}

/// @nodoc
class __$$_ViewModuleDtoCopyWithImpl<$Res>
    extends _$ViewModuleDtoCopyWithImpl<$Res, _$_ViewModuleDto>
    implements _$$_ViewModuleDtoCopyWith<$Res> {
  __$$_ViewModuleDtoCopyWithImpl(
      _$_ViewModuleDto _value, $Res Function(_$_ViewModuleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$_ViewModuleDto(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViewModuleDto implements _ViewModuleDto {
  const _$_ViewModuleDto({this.type = ''});

  factory _$_ViewModuleDto.fromJson(Map<String, dynamic> json) =>
      _$$_ViewModuleDtoFromJson(json);

  @override
  @JsonKey()
  final String? type;

  @override
  String toString() {
    return 'ViewModuleDto(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewModuleDto &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewModuleDtoCopyWith<_$_ViewModuleDto> get copyWith =>
      __$$_ViewModuleDtoCopyWithImpl<_$_ViewModuleDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewModuleDtoToJson(
      this,
    );
  }
}

abstract class _ViewModuleDto implements ViewModuleDto {
  const factory _ViewModuleDto({final String? type}) = _$_ViewModuleDto;

  factory _ViewModuleDto.fromJson(Map<String, dynamic> json) =
      _$_ViewModuleDto.fromJson;

  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_ViewModuleDtoCopyWith<_$_ViewModuleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
