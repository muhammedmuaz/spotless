// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      title: json['title'] as String?,
      message: json['message'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      type: json['type'] as String?,
      isUnread: json['isUnread'] as bool? ?? true,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'date': instance.date?.toIso8601String(),
      'type': instance.type,
      'isUnread': instance.isUnread,
    };
