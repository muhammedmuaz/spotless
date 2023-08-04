// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on _NotificationStore, Store {
  late final _$notificationPageStateAtom =
      Atom(name: '_NotificationStore.notificationPageState', context: context);

  @override
  LoadingStatusEnum get notificationPageState {
    _$notificationPageStateAtom.reportRead();
    return super.notificationPageState;
  }

  @override
  set notificationPageState(LoadingStatusEnum value) {
    _$notificationPageStateAtom.reportWrite(value, super.notificationPageState,
        () {
      super.notificationPageState = value;
    });
  }

  late final _$notificationAtom =
      Atom(name: '_NotificationStore.notification', context: context);

  @override
  Observable<NotificationModel>? get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(Observable<NotificationModel>? value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  late final _$notificationListAtom =
      Atom(name: '_NotificationStore.notificationList', context: context);

  @override
  ObservableList<NotificationModel> get notificationList {
    _$notificationListAtom.reportRead();
    return super.notificationList;
  }

  @override
  set notificationList(ObservableList<NotificationModel> value) {
    _$notificationListAtom.reportWrite(value, super.notificationList, () {
      super.notificationList = value;
    });
  }

  late final _$notificationLengthAtom =
      Atom(name: '_NotificationStore.notificationLength', context: context);

  @override
  int? get notificationLength {
    _$notificationLengthAtom.reportRead();
    return super.notificationLength;
  }

  @override
  set notificationLength(int? value) {
    _$notificationLengthAtom.reportWrite(value, super.notificationLength, () {
      super.notificationLength = value;
    });
  }

  late final _$showPointAtom =
      Atom(name: '_NotificationStore.showPoint', context: context);

  @override
  bool get showPoint {
    _$showPointAtom.reportRead();
    return super.showPoint;
  }

  @override
  set showPoint(bool value) {
    _$showPointAtom.reportWrite(value, super.showPoint, () {
      super.showPoint = value;
    });
  }

  late final _$onFCMReceivedAsyncAction =
      AsyncAction('_NotificationStore.onFCMReceived', context: context);

  @override
  Future<dynamic> onFCMReceived(Map<String, dynamic> message,
      {BuildContext? context}) {
    return _$onFCMReceivedAsyncAction
        .run(() => super.onFCMReceived(message, context: context));
  }

  late final _$clearNotificationlistListAsyncAction = AsyncAction(
      '_NotificationStore.clearNotificationlistList',
      context: context);

  @override
  Future<void> clearNotificationlistList() {
    return _$clearNotificationlistListAsyncAction
        .run(() => super.clearNotificationlistList());
  }

  late final _$saveMsgListAsyncAction =
      AsyncAction('_NotificationStore.saveMsgList', context: context);

  @override
  Future<void> saveMsgList(List<NotificationModel> resp) {
    return _$saveMsgListAsyncAction.run(() => super.saveMsgList(resp));
  }

  late final _$saveNotificationListLengthAsyncAction = AsyncAction(
      '_NotificationStore.saveNotificationListLength',
      context: context);

  @override
  Future<void> saveNotificationListLength(int resp) {
    return _$saveNotificationListLengthAsyncAction
        .run(() => super.saveNotificationListLength(resp));
  }

  late final _$clearNotificationLengthAsyncAction = AsyncAction(
      '_NotificationStore.clearNotificationLength',
      context: context);

  @override
  Future<void> clearNotificationLength() {
    return _$clearNotificationLengthAsyncAction
        .run(() => super.clearNotificationLength());
  }

  late final _$_NotificationStoreActionController =
      ActionController(name: '_NotificationStore', context: context);

  @override
  void getStoredNotificationList() {
    final _$actionInfo = _$_NotificationStoreActionController.startAction(
        name: '_NotificationStore.getStoredNotificationList');
    try {
      return super.getStoredNotificationList();
    } finally {
      _$_NotificationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getStoredNotificationLength() {
    final _$actionInfo = _$_NotificationStoreActionController.startAction(
        name: '_NotificationStore.getStoredNotificationLength');
    try {
      return super.getStoredNotificationLength();
    } finally {
      _$_NotificationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notificationPageState: ${notificationPageState},
notification: ${notification},
notificationList: ${notificationList},
notificationLength: ${notificationLength},
showPoint: ${showPoint}
    ''';
  }
}
