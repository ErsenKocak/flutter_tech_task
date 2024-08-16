import 'package:flutter_tech_task/features/home/domain/entities/response/villain_entity/villain_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_detail_entity.freezed.dart';
part 'book_detail_entity.g.dart';

@freezed
class BookDetailEntity with _$BookDetailEntity {
  @JsonSerializable(explicitToJson: true)
  factory BookDetailEntity({
    int? id,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'Title') String? title,
    String? handle,
    @JsonKey(name: 'Publisher') String? publisher,
    @JsonKey(name: 'ISBN') String? isbn,
    @JsonKey(name: 'Pages') int? pages,
    @JsonKey(name: 'Notes') List<String>? notes,
    @JsonKey(name: 'created_at') String? createdAt,
    List<VillainEntity>? villains,
  }) = _BookDetailEntity;

  factory BookDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$BookDetailEntityFromJson(json);
}
