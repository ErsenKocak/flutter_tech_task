// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'villain_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VillainEntity _$VillainEntityFromJson(Map<String, dynamic> json) {
  return _VillainEntity.fromJson(json);
}

/// @nodoc
mixin _$VillainEntity {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VillainEntityCopyWith<VillainEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VillainEntityCopyWith<$Res> {
  factory $VillainEntityCopyWith(
          VillainEntity value, $Res Function(VillainEntity) then) =
      _$VillainEntityCopyWithImpl<$Res, VillainEntity>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$VillainEntityCopyWithImpl<$Res, $Val extends VillainEntity>
    implements $VillainEntityCopyWith<$Res> {
  _$VillainEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VillainEntityImplCopyWith<$Res>
    implements $VillainEntityCopyWith<$Res> {
  factory _$$VillainEntityImplCopyWith(
          _$VillainEntityImpl value, $Res Function(_$VillainEntityImpl) then) =
      __$$VillainEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$VillainEntityImplCopyWithImpl<$Res>
    extends _$VillainEntityCopyWithImpl<$Res, _$VillainEntityImpl>
    implements _$$VillainEntityImplCopyWith<$Res> {
  __$$VillainEntityImplCopyWithImpl(
      _$VillainEntityImpl _value, $Res Function(_$VillainEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$VillainEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VillainEntityImpl implements _VillainEntity {
  _$VillainEntityImpl({this.name, this.url});

  factory _$VillainEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VillainEntityImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString() {
    return 'VillainEntity(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VillainEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VillainEntityImplCopyWith<_$VillainEntityImpl> get copyWith =>
      __$$VillainEntityImplCopyWithImpl<_$VillainEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VillainEntityImplToJson(
      this,
    );
  }
}

abstract class _VillainEntity implements VillainEntity {
  factory _VillainEntity({final String? name, final String? url}) =
      _$VillainEntityImpl;

  factory _VillainEntity.fromJson(Map<String, dynamic> json) =
      _$VillainEntityImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$VillainEntityImplCopyWith<_$VillainEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
