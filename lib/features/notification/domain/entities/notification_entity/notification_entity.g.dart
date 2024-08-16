// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationEntityImpl _$$NotificationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      notificationDate: json['notificationDate'] == null
          ? null
          : DateTime.parse(json['notificationDate'] as String),
      title: json['title'] as String?,
      body: json['body'] as String?,
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$$NotificationEntityImplToJson(
        _$NotificationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationDate': instance.notificationDate?.toIso8601String(),
      'title': instance.title,
      'body': instance.body,
      'payload': instance.payload,
    };
