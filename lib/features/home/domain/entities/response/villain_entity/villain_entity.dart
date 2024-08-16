import 'package:freezed_annotation/freezed_annotation.dart';

part 'villain_entity.freezed.dart';
part 'villain_entity.g.dart';

@freezed
class VillainEntity with _$VillainEntity {
  factory VillainEntity({
    String? name,
    String? url,
  }) = _VillainEntity;

  factory VillainEntity.fromJson(Map<String, dynamic> json) =>
      _$VillainEntityFromJson(json);
}
