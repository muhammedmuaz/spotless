import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:spotless/enum.dart';

import 'package:spotless/storage_manager.dart';

import '../../shared/model/notification/notification.dart';
part 'notification_store.g.dart';

class NotificationStore = _NotificationStore with _$NotificationStore;

abstract class _NotificationStore with Store {
  _NotificationStore() {
    getStoredNotificationList();
    getStoredNotificationLength();
  }

  @observable
  LoadingStatusEnum notificationPageState = LoadingStatusEnum.init;

  @observable
  Observable<NotificationModel>? notification;

  @observable
  ObservableList<NotificationModel> notificationList =
      ObservableList<NotificationModel>();

  @observable
  int? notificationLength;

  @observable
  bool showPoint = false;

  /// This [onFCMReceived] fun is used to get notification form [OneSignal]
  /// This function is get the [massage] and listed in [notificationList] as temporary
  /// And the save [notificationList] local storage

  @action
  Future<dynamic> onFCMReceived(Map<String, dynamic> message,
      {BuildContext? context}) async {
    NotificationModel notification = NotificationModel.fromJson(message);
    notification = notification.copyWith(
      date: DateTime.now(),
    );
    if (notification != null) {
      notificationList.add(notification);
      saveMsgList(notificationList);
      addNotificationCount();
    }
  }

  /// This [clearNotificationlistList] fun will used to clear notification

  @action
  Future<void> clearNotificationlistList() async {
    notificationList.clear();
    await StorageManager.instance!.saveList(StorageManager.notification, []);
  }

  /// This [makeReadMeg] fun will used to show the massages read or unread
  /// And save the massgae list top local storage

  Future<void> makeReadMeg({NotificationModel? item}) async {
    List<NotificationModel> _notificationList = notificationList.map(
      (e) {
        if (e == item) {
          e = e.copyWith(isUnread: false);
          return e;
        } else {
          e = e.copyWith(isUnread: e.isUnread);
          return e;
        }
      },
    ).toList();

    notificationList = ObservableList<NotificationModel>.of(_notificationList);
    saveMsgList(notificationList);
  }

  /// This [saveMsgList] fun is used to save the notification list

  @action
  Future<void> saveMsgList(List<NotificationModel> resp) async {
    await StorageManager.instance!.saveList(
        StorageManager.notification, resp.map((e) => json.encode(e)).toList());
    return;
  }

  /// This [getStoredNotificationList] fun is used to get notificationList ,
  /// retrieve from local storage and  show to the page

  @action
  void getStoredNotificationList() {
    List<String>? savednotificattionMsg =
        StorageManager.instance!.getList(StorageManager.notification);

    if (savednotificattionMsg != null && savednotificattionMsg != []) {
      try {
        notificationList = ObservableList<NotificationModel>.of(
            savednotificattionMsg
                .map((e) => NotificationModel.fromJson(json.decode(e)))
                .toList());
      } catch (e) {
        print(e);
      }
    }
  }

  /// this [addNotificationCount] fun is used to get the notification length from notification list
  /// this will set pointer true if the notification length >= notification list length

  void addNotificationCount() {
    if (notificationLength != null && notificationList.length != null) {
      if (notificationLength! >= notificationList.length) {
        showPoint = false;
      } else {
        showPoint = true;
      }
    }
  }

  /// this [saveNotificationListLength] is used to store the length of notification list

  @action
  Future<void> saveNotificationListLength(int resp) async {
    await StorageManager.instance!
        .saveIntValue(StorageManager.notificationLength, resp);
    return;
  }

  /// this [getStoredNotificationLength] is used to get the length of notification list from the local storage

  @action
  void getStoredNotificationLength() {
    int? savednotificattionLength =
        StorageManager.instance!.getIntValue(StorageManager.notificationLength);
    if (savednotificattionLength != null && savednotificattionLength != null) {
      try {
        notificationLength = savednotificattionLength;
      } catch (e) {
        print(e);
      }
    }
  }

  /// This [clearNotificationLength] fun is used to clear the notification length from local storage

  @action
  Future<void> clearNotificationLength() async {
    notificationLength = 0;
    await StorageManager.instance!
        .saveIntValue(StorageManager.notificationLength, 0);
  }
}
