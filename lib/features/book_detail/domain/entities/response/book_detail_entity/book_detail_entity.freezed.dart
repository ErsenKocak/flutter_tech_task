// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookDetailEntity _$BookDetailEntityFromJson(Map<String, dynamic> json) {
  return _BookDetailEntity.fromJson(json);
}

/// @nodoc
mixin _$BookDetailEntity {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  String? get handle => throw _privateConstructorUsedError;
  @JsonKey(name: 'Publisher')
  String? get publisher => throw _privateConstructorUsedError;
  @JsonKey(name: 'ISBN')
  String? get isbn => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pages')
  int? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: 'Notes')
  List<String>? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  List<VillainEntity>? get villains => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDetailEntityCopyWith<BookDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailEntityCopyWith<$Res> {
  factory $BookDetailEntityCopyWith(
          BookDetailEntity value, $Res Function(BookDetailEntity) then) =
      _$BookDetailEntityCopyWithImpl<$Res, BookDetailEntity>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'Title') String? title,
      String? handle,
      @JsonKey(name: 'Publisher') String? publisher,
      @JsonKey(name: 'ISBN') String? isbn,
      @JsonKey(name: 'Pages') int? pages,
      @JsonKey(name: 'Notes') List<String>? notes,
      @JsonKey(name: 'created_at') String? createdAt,
      List<VillainEntity>? villains});
}

/// @nodoc
class _$BookDetailEntityCopyWithImpl<$Res, $Val extends BookDetailEntity>
    implements $BookDetailEntityCopyWith<$Res> {
  _$BookDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? year = freezed,
    Object? title = freezed,
    Object? handle = freezed,
    Object? publisher = freezed,
    Object? isbn = freezed,
    Object? pages = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? villains = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      handle: freezed == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      villains: freezed == villains
          ? _value.villains
          : villains // ignore: cast_nullable_to_non_nullable
              as List<VillainEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDetailEntityImplCopyWith<$Res>
    implements $BookDetailEntityCopyWith<$Res> {
  factory _$$BookDetailEntityImplCopyWith(_$BookDetailEntityImpl value,
          $Res Function(_$BookDetailEntityImpl) then) =
      __$$BookDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'Title') String? title,
      String? handle,
      @JsonKey(name: 'Publisher') String? publisher,
      @JsonKey(name: 'ISBN') String? isbn,
      @JsonKey(name: 'Pages') int? pages,
      @JsonKey(name: 'Notes') List<String>? notes,
      @JsonKey(name: 'created_at') String? createdAt,
      List<VillainEntity>? villains});
}

/// @nodoc
class __$$BookDetailEntityImplCopyWithImpl<$Res>
    extends _$BookDetailEntityCopyWithImpl<$Res, _$BookDetailEntityImpl>
    implements _$$BookDetailEntityImplCopyWith<$Res> {
  __$$BookDetailEntityImplCopyWithImpl(_$BookDetailEntityImpl _value,
      $Res Function(_$BookDetailEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? year = freezed,
    Object? title = freezed,
    Object? handle = freezed,
    Object? publisher = freezed,
    Object? isbn = freezed,
    Object? pages = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? villains = freezed,
  }) {
    return _then(_$BookDetailEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      handle: freezed == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      villains: freezed == villains
          ? _value._villains
          : villains // ignore: cast_nullable_to_non_nullable
              as List<VillainEntity>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BookDetailEntityImpl implements _BookDetailEntity {
  _$BookDetailEntityImpl(
      {this.id,
      @JsonKey(name: 'Year') this.year,
      @JsonKey(name: 'Title') this.title,
      this.handle,
      @JsonKey(name: 'Publisher') this.publisher,
      @JsonKey(name: 'ISBN') this.isbn,
      @JsonKey(name: 'Pages') this.pages,
      @JsonKey(name: 'Notes') final List<String>? notes,
      @JsonKey(name: 'created_at') this.createdAt,
      final List<VillainEntity>? villains})
      : _notes = notes,
        _villains = villains;

  factory _$BookDetailEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookDetailEntityImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'Year')
  final int? year;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  final String? handle;
  @override
  @JsonKey(name: 'Publisher')
  final String? publisher;
  @override
  @JsonKey(name: 'ISBN')
  final String? isbn;
  @override
  @JsonKey(name: 'Pages')
  final int? pages;
  final List<String>? _notes;
  @override
  @JsonKey(name: 'Notes')
  List<String>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final List<VillainEntity>? _villains;
  @override
  List<VillainEntity>? get villains {
    final value = _villains;
    if (value == null) return null;
    if (_villains is EqualUnmodifiableListView) return _villains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookDetailEntity(id: $id, year: $year, title: $title, handle: $handle, publisher: $publisher, isbn: $isbn, pages: $pages, notes: $notes, createdAt: $createdAt, villains: $villains)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._villains, _villains));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      year,
      title,
      handle,
      publisher,
      isbn,
      pages,
      const DeepCollectionEquality().hash(_notes),
      createdAt,
      const DeepCollectionEquality().hash(_villains));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDetailEntityImplCopyWith<_$BookDetailEntityImpl> get copyWith =>
      __$$BookDetailEntityImplCopyWithImpl<_$BookDetailEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDetailEntityImplToJson(
      this,
    );
  }
}

abstract class _BookDetailEntity implements BookDetailEntity {
  factory _BookDetailEntity(
      {final int? id,
      @JsonKey(name: 'Year') final int? year,
      @JsonKey(name: 'Title') final String? title,
      final String? handle,
      @JsonKey(name: 'Publisher') final String? publisher,
      @JsonKey(name: 'ISBN') final String? isbn,
      @JsonKey(name: 'Pages') final int? pages,
      @JsonKey(name: 'Notes') final List<String>? notes,
      @JsonKey(name: 'created_at') final String? createdAt,
      final List<VillainEntity>? villains}) = _$BookDetailEntityImpl;

  factory _BookDetailEntity.fromJson(Map<String, dynamic> json) =
      _$BookDetailEntityImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'Year')
  int? get year;
  @override
  @JsonKey(name: 'Title')
  String? get title;
  @override
  String? get handle;
  @override
  @JsonKey(name: 'Publisher')
  String? get publisher;
  @override
  @JsonKey(name: 'ISBN')
  String? get isbn;
  @override
  @JsonKey(name: 'Pages')
  int? get pages;
  @override
  @JsonKey(name: 'Notes')
  List<String>? get notes;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  List<VillainEntity>? get villains;
  @override
  @JsonKey(ignore: true)
  _$$BookDetailEntityImplCopyWith<_$BookDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
