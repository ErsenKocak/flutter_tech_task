import 'package:freezed_annotation/freezed_annotation.dart';

part 'villain_model.freezed.dart';
part 'villain_model.g.dart';

@freezed
class VillainModel with _$VillainModel {
  factory VillainModel({
    String? name,
    String? url,
  }) = _VillainModel;

  factory VillainModel.fromJson(Map<String, dynamic> json) =>
      _$VillainModelFromJson(json);
}
