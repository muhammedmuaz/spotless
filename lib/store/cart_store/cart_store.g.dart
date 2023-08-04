// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  Computed<double>? _$cartTotalCreditComputed;

  @override
  double get cartTotalCredit => (_$cartTotalCreditComputed ??= Computed<double>(
          () => super.cartTotalCredit,
          name: '_CartStore.cartTotalCredit'))
      .value;

  late final _$activePlanStateAtom =
      Atom(name: '_CartStore.activePlanState', context: context);

  @override
  LoadingStatusEnum get activePlanState {
    _$activePlanStateAtom.reportRead();
    return super.activePlanState;
  }

  @override
  set activePlanState(LoadingStatusEnum value) {
    _$activePlanStateAtom.reportWrite(value, super.activePlanState, () {
      super.activePlanState = value;
    });
  }

  late final _$createdOrderStateAtom =
      Atom(name: '_CartStore.createdOrderState', context: context);

  @override
  LoadingStatusEnum get createdOrderState {
    _$createdOrderStateAtom.reportRead();
    return super.createdOrderState;
  }

  @override
  set createdOrderState(LoadingStatusEnum value) {
    _$createdOrderStateAtom.reportWrite(value, super.createdOrderState, () {
      super.createdOrderState = value;
    });
  }

  late final _$orderViewPageStateAtom =
      Atom(name: '_CartStore.orderViewPageState', context: context);

  @override
  LoadingStatusEnum get orderViewPageState {
    _$orderViewPageStateAtom.reportRead();
    return super.orderViewPageState;
  }

  @override
  set orderViewPageState(LoadingStatusEnum value) {
    _$orderViewPageStateAtom.reportWrite(value, super.orderViewPageState, () {
      super.orderViewPageState = value;
    });
  }

  late final _$orderListViewPageStateAtom =
      Atom(name: '_CartStore.orderListViewPageState', context: context);

  @override
  LoadingStatusEnum get orderListViewPageState {
    _$orderListViewPageStateAtom.reportRead();
    return super.orderListViewPageState;
  }

  @override
  set orderListViewPageState(LoadingStatusEnum value) {
    _$orderListViewPageStateAtom
        .reportWrite(value, super.orderListViewPageState, () {
      super.orderListViewPageState = value;
    });
  }

  late final _$expiredPlanStateAtom =
      Atom(name: '_CartStore.expiredPlanState', context: context);

  @override
  LoadingStatusEnum get expiredPlanState {
    _$expiredPlanStateAtom.reportRead();
    return super.expiredPlanState;
  }

  @override
  set expiredPlanState(LoadingStatusEnum value) {
    _$expiredPlanStateAtom.reportWrite(value, super.expiredPlanState, () {
      super.expiredPlanState = value;
    });
  }

  late final _$orderValueStateAtom =
      Atom(name: '_CartStore.orderValueState', context: context);

  @override
  LoadingStatusEnum get orderValueState {
    _$orderValueStateAtom.reportRead();
    return super.orderValueState;
  }

  @override
  set orderValueState(LoadingStatusEnum value) {
    _$orderValueStateAtom.reportWrite(value, super.orderValueState, () {
      super.orderValueState = value;
    });
  }

  late final _$cartItemsAtom =
      Atom(name: '_CartStore.cartItems', context: context);

  @override
  ObservableMap<int, ServiceModel> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableMap<int, ServiceModel> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$cartItemListAtom =
      Atom(name: '_CartStore.cartItemList', context: context);

  @override
  ObservableList<ServiceModel> get cartItemList {
    _$cartItemListAtom.reportRead();
    return super.cartItemList;
  }

  @override
  set cartItemList(ObservableList<ServiceModel> value) {
    _$cartItemListAtom.reportWrite(value, super.cartItemList, () {
      super.cartItemList = value;
    });
  }

  late final _$activePlanAtom =
      Atom(name: '_CartStore.activePlan', context: context);

  @override
  Observable<ActivePlanModel>? get activePlan {
    _$activePlanAtom.reportRead();
    return super.activePlan;
  }

  @override
  set activePlan(Observable<ActivePlanModel>? value) {
    _$activePlanAtom.reportWrite(value, super.activePlan, () {
      super.activePlan = value;
    });
  }

  late final _$orderListViewAtom =
      Atom(name: '_CartStore.orderListView', context: context);

  @override
  ObservableList<OrderModel> get orderListView {
    _$orderListViewAtom.reportRead();
    return super.orderListView;
  }

  @override
  set orderListView(ObservableList<OrderModel> value) {
    _$orderListViewAtom.reportWrite(value, super.orderListView, () {
      super.orderListView = value;
    });
  }

  late final _$orderItemDetailsAtom =
      Atom(name: '_CartStore.orderItemDetails', context: context);

  @override
  Observable<SingleOrderModel>? get orderItemDetails {
    _$orderItemDetailsAtom.reportRead();
    return super.orderItemDetails;
  }

  @override
  set orderItemDetails(Observable<SingleOrderModel>? value) {
    _$orderItemDetailsAtom.reportWrite(value, super.orderItemDetails, () {
      super.orderItemDetails = value;
    });
  }

  late final _$isPaginationEndedAtom =
      Atom(name: '_CartStore.isPaginationEnded', context: context);

  @override
  bool get isPaginationEnded {
    _$isPaginationEndedAtom.reportRead();
    return super.isPaginationEnded;
  }

  @override
  set isPaginationEnded(bool value) {
    _$isPaginationEndedAtom.reportWrite(value, super.isPaginationEnded, () {
      super.isPaginationEnded = value;
    });
  }

  late final _$expiredValueAtom =
      Atom(name: '_CartStore.expiredValue', context: context);

  @override
  int? get expiredValue {
    _$expiredValueAtom.reportRead();
    return super.expiredValue;
  }

  @override
  set expiredValue(int? value) {
    _$expiredValueAtom.reportWrite(value, super.expiredValue, () {
      super.expiredValue = value;
    });
  }

  late final _$orderValuesAtom =
      Atom(name: '_CartStore.orderValues', context: context);

  @override
  Observable<orderValueModel>? get orderValues {
    _$orderValuesAtom.reportRead();
    return super.orderValues;
  }

  @override
  set orderValues(Observable<orderValueModel>? value) {
    _$orderValuesAtom.reportWrite(value, super.orderValues, () {
      super.orderValues = value;
    });
  }

  late final _$getOneActivePlanAsyncAction =
      AsyncAction('_CartStore.getOneActivePlan', context: context);

  @override
  Future<void> getOneActivePlan({String? token}) {
    return _$getOneActivePlanAsyncAction
        .run(() => super.getOneActivePlan(token: token));
  }

  late final _$createItemOrderAsyncAction =
      AsyncAction('_CartStore.createItemOrder', context: context);

  @override
  Future<void> createItemOrder(
      CreateOrderDto input, BuildContext context, String token) {
    return _$createItemOrderAsyncAction
        .run(() => super.createItemOrder(input, context, token));
  }

  late final _$getOrderListAsyncAction =
      AsyncAction('_CartStore.getOrderList', context: context);

  @override
  Future<void> getOrderList(
      {bool isFromRefresh = false,
      required String token,
      required String? orderStatus}) {
    return _$getOrderListAsyncAction.run(() => super.getOrderList(
        isFromRefresh: isFromRefresh, token: token, orderStatus: orderStatus));
  }

  late final _$viewOrderDetailsAsyncAction =
      AsyncAction('_CartStore.viewOrderDetails', context: context);

  @override
  Future<void> viewOrderDetails({String? token, int? orderId}) {
    return _$viewOrderDetailsAsyncAction
        .run(() => super.viewOrderDetails(token: token, orderId: orderId));
  }

  late final _$checkPlanIsExpiredAsyncAction =
      AsyncAction('_CartStore.checkPlanIsExpired', context: context);

  @override
  Future<void> checkPlanIsExpired({String? token}) {
    return _$checkPlanIsExpiredAsyncAction
        .run(() => super.checkPlanIsExpired(token: token));
  }

  late final _$getOrdersValueAsyncAction =
      AsyncAction('_CartStore.getOrdersValue', context: context);

  @override
  Future<void> getOrdersValue({String? token}) {
    return _$getOrdersValueAsyncAction
        .run(() => super.getOrdersValue(token: token));
  }

  late final _$_CartStoreActionController =
      ActionController(name: '_CartStore', context: context);

  @override
  void updateCartItem(ServiceModel? productItem,
      {bool? isIncrement, BuildContext? context}) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.updateCartItem');
    try {
      return super.updateCartItem(productItem,
          isIncrement: isIncrement, context: context);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getStoredSavedListValues() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.getStoredSavedListValues');
    try {
      return super.getStoredSavedListValues();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCartAfterOrderPlaced() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.clearCartAfterOrderPlaced');
    try {
      return super.clearCartAfterOrderPlaced();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activePlanState: ${activePlanState},
createdOrderState: ${createdOrderState},
orderViewPageState: ${orderViewPageState},
orderListViewPageState: ${orderListViewPageState},
expiredPlanState: ${expiredPlanState},
orderValueState: ${orderValueState},
cartItems: ${cartItems},
cartItemList: ${cartItemList},
activePlan: ${activePlan},
orderListView: ${orderListView},
orderItemDetails: ${orderItemDetails},
isPaginationEnded: ${isPaginationEnded},
expiredValue: ${expiredValue},
orderValues: ${orderValues},
cartTotalCredit: ${cartTotalCredit}
    ''';
  }
}
