// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDetailModelImpl _$$BookDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookDetailModelImpl(
      id: (json['id'] as num?)?.toInt(),
      year: (json['Year'] as num?)?.toInt(),
      title: json['Title'] as String?,
      handle: json['handle'] as String?,
      publisher: json['Publisher'] as String?,
      isbn: json['ISBN'] as String?,
      pages: (json['Pages'] as num?)?.toInt(),
      notes:
          (json['Notes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['created_at'] as String?,
      villains: (json['villains'] as List<dynamic>?)
          ?.map((e) => VillainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookDetailModelImplToJson(
        _$BookDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Year': instance.year,
      'Title': instance.title,
      'handle': instance.handle,
      'Publisher': instance.publisher,
      'ISBN': instance.isbn,
      'Pages': instance.pages,
      'Notes': instance.notes,
      'created_at': instance.createdAt,
      'villains': instance.villains?.map((e) => e.toJson()).toList(),
    };
