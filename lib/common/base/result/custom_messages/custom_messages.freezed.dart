// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomMessages _$CustomMessagesFromJson(Map<String, dynamic> json) {
  return _CustomMessages.fromJson(json);
}

/// @nodoc
mixin _$CustomMessages {
  String? get navigationUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomMessagesCopyWith<CustomMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomMessagesCopyWith<$Res> {
  factory $CustomMessagesCopyWith(
          CustomMessages value, $Res Function(CustomMessages) then) =
      _$CustomMessagesCopyWithImpl<$Res, CustomMessages>;
  @useResult
  $Res call({String? navigationUrl});
}

/// @nodoc
class _$CustomMessagesCopyWithImpl<$Res, $Val extends CustomMessages>
    implements $CustomMessagesCopyWith<$Res> {
  _$CustomMessagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigationUrl = freezed,
  }) {
    return _then(_value.copyWith(
      navigationUrl: freezed == navigationUrl
          ? _value.navigationUrl
          : navigationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomMessagesImplCopyWith<$Res>
    implements $CustomMessagesCopyWith<$Res> {
  factory _$$CustomMessagesImplCopyWith(_$CustomMessagesImpl value,
          $Res Function(_$CustomMessagesImpl) then) =
      __$$CustomMessagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? navigationUrl});
}

/// @nodoc
class __$$CustomMessagesImplCopyWithImpl<$Res>
    extends _$CustomMessagesCopyWithImpl<$Res, _$CustomMessagesImpl>
    implements _$$CustomMessagesImplCopyWith<$Res> {
  __$$CustomMessagesImplCopyWithImpl(
      _$CustomMessagesImpl _value, $Res Function(_$CustomMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigationUrl = freezed,
  }) {
    return _then(_$CustomMessagesImpl(
      navigationUrl: freezed == navigationUrl
          ? _value.navigationUrl
          : navigationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomMessagesImpl implements _CustomMessages {
  _$CustomMessagesImpl({this.navigationUrl});

  factory _$CustomMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomMessagesImplFromJson(json);

  @override
  final String? navigationUrl;

  @override
  String toString() {
    return 'CustomMessages(navigationUrl: $navigationUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomMessagesImpl &&
            (identical(other.navigationUrl, navigationUrl) ||
                other.navigationUrl == navigationUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, navigationUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomMessagesImplCopyWith<_$CustomMessagesImpl> get copyWith =>
      __$$CustomMessagesImplCopyWithImpl<_$CustomMessagesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomMessagesImplToJson(
      this,
    );
  }
}

abstract class _CustomMessages implements CustomMessages {
  factory _CustomMessages({final String? navigationUrl}) = _$CustomMessagesImpl;

  factory _CustomMessages.fromJson(Map<String, dynamic> json) =
      _$CustomMessagesImpl.fromJson;

  @override
  String? get navigationUrl;
  @override
  @JsonKey(ignore: true)
  _$$CustomMessagesImplCopyWith<_$CustomMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
