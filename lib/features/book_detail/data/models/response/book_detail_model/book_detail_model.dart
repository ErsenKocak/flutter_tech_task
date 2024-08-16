import 'package:flutter_tech_task/features/home/data/models/response/villain_model/villain_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_detail_model.freezed.dart';
part 'book_detail_model.g.dart';

@freezed
class BookDetailModel with _$BookDetailModel {
  @JsonSerializable(explicitToJson: true)
  factory BookDetailModel({
    int? id,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'Title') String? title,
    String? handle,
    @JsonKey(name: 'Publisher') String? publisher,
    @JsonKey(name: 'ISBN') String? isbn,
    @JsonKey(name: 'Pages') int? pages,
    @JsonKey(name: 'Notes') List<String>? notes,
    @JsonKey(name: 'created_at') String? createdAt,
    List<VillainModel>? villains,
  }) = _BookDetailModel;

  factory BookDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BookDetailModelFromJson(json);
}
