import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';
part 'notification_entity.g.dart';

@freezed
class NotificationEntity with _$NotificationEntity {
  @JsonSerializable(explicitToJson: true)
  factory NotificationEntity({
    int? id,
    DateTime? notificationDate,
    String? title,
    String? body,
    String? payload,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}
