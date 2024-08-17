// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mock_custom_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MockCustomMessages _$MockCustomMessagesFromJson(Map<String, dynamic> json) {
  return _MockCustomMessages.fromJson(json);
}

/// @nodoc
mixin _$MockCustomMessages {
  String? get navigationUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MockCustomMessagesCopyWith<MockCustomMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MockCustomMessagesCopyWith<$Res> {
  factory $MockCustomMessagesCopyWith(
          MockCustomMessages value, $Res Function(MockCustomMessages) then) =
      _$MockCustomMessagesCopyWithImpl<$Res, MockCustomMessages>;
  @useResult
  $Res call({String? navigationUrl});
}

/// @nodoc
class _$MockCustomMessagesCopyWithImpl<$Res, $Val extends MockCustomMessages>
    implements $MockCustomMessagesCopyWith<$Res> {
  _$MockCustomMessagesCopyWithImpl(this._value, this._then);

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
abstract class _$$MockCustomMessagesImplCopyWith<$Res>
    implements $MockCustomMessagesCopyWith<$Res> {
  factory _$$MockCustomMessagesImplCopyWith(_$MockCustomMessagesImpl value,
          $Res Function(_$MockCustomMessagesImpl) then) =
      __$$MockCustomMessagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? navigationUrl});
}

/// @nodoc
class __$$MockCustomMessagesImplCopyWithImpl<$Res>
    extends _$MockCustomMessagesCopyWithImpl<$Res, _$MockCustomMessagesImpl>
    implements _$$MockCustomMessagesImplCopyWith<$Res> {
  __$$MockCustomMessagesImplCopyWithImpl(_$MockCustomMessagesImpl _value,
      $Res Function(_$MockCustomMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigationUrl = freezed,
  }) {
    return _then(_$MockCustomMessagesImpl(
      navigationUrl: freezed == navigationUrl
          ? _value.navigationUrl
          : navigationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MockCustomMessagesImpl implements _MockCustomMessages {
  _$MockCustomMessagesImpl({this.navigationUrl});

  factory _$MockCustomMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MockCustomMessagesImplFromJson(json);

  @override
  final String? navigationUrl;

  @override
  String toString() {
    return 'MockCustomMessages(navigationUrl: $navigationUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MockCustomMessagesImpl &&
            (identical(other.navigationUrl, navigationUrl) ||
                other.navigationUrl == navigationUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, navigationUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MockCustomMessagesImplCopyWith<_$MockCustomMessagesImpl> get copyWith =>
      __$$MockCustomMessagesImplCopyWithImpl<_$MockCustomMessagesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MockCustomMessagesImplToJson(
      this,
    );
  }
}

abstract class _MockCustomMessages implements MockCustomMessages {
  factory _MockCustomMessages({final String? navigationUrl}) =
      _$MockCustomMessagesImpl;

  factory _MockCustomMessages.fromJson(Map<String, dynamic> json) =
      _$MockCustomMessagesImpl.fromJson;

  @override
  String? get navigationUrl;
  @override
  @JsonKey(ignore: true)
  _$$MockCustomMessagesImplCopyWith<_$MockCustomMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
