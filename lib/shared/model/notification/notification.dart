import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
part 'notification.g.dart';
part 'notification.freezed.dart';

@freezed
@immutable
class NotificationModel with _$NotificationModel {
  const NotificationModel._();
  const factory NotificationModel({
    String? title,
    String? message,
    DateTime? date,
    String? type,
    @Default(true) bool isUnread,
  }) = _NotificationModel;

  String get formattedDate {
    DateFormat _fmt = new DateFormat('MMM d , hh:mm aaa');
    return _fmt.format(date!.toLocal());
  }

  String get formattedDateGroup {
    DateFormat _fmt = new DateFormat('MMM d');
    return _fmt.format(date!.toLocal());
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
