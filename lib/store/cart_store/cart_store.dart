import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:spotless/enum.dart';
import 'package:spotless/provider/vendor.provider.dart';
import 'package:spotless/shared/model/home/home.model.dart';
import 'package:spotless/shared/model/product/product.model.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import '../../locator.dart';
import '../../provider/order.provider.dart';
import '../../shared/model/order/order.model.dart';
import '../../storage_manager.dart';
part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  _CartStore() {
    getStoredSavedListValues();
  }

  final OrderProvider _orderProvider = locator.get<OrderProvider>();

  @observable
  LoadingStatusEnum activePlanState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum createdOrderState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum orderViewPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum orderListViewPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum expiredPlanState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum orderValueState = LoadingStatusEnum.init;

  @observable
  ObservableMap<int, ServiceModel> cartItems =
      ObservableMap<int, ServiceModel>.of(<int, ServiceModel>{});

  @observable
  ObservableList<ServiceModel> cartItemList = ObservableList<ServiceModel>();

  @observable
  Observable<ActivePlanModel>? activePlan;

  @observable
  ObservableList<OrderModel> orderListView = ObservableList<OrderModel>();

  @observable
  Observable<SingleOrderModel>? orderItemDetails;

  int pageIndex = 1;

  @observable
  bool isPaginationEnded = false;

  @observable
  int? expiredValue;

  @observable
  Observable<orderValueModel>? orderValues;

  /// [updateCartItem] this fun is used for add and remove product [_productItem] in cart
  /// This fun is responsible for adding a product [_productItem] to cart list [cartItemList] if the product is not present in the cart list [cartItemList]
  /// and also it will also remove the product [_productItem] in cart list [cartItemList]
  /// after the add or remove the item will store in temporary variable [cartItemList]

  @action
  void updateCartItem(ServiceModel? productItem,
      {bool? isIncrement, BuildContext? context}) {
    ServiceModel? _productItem = productItem!;
    if (cartItems.containsKey(productItem.id)) {
      _productItem = cartItems[productItem.id];
      if (isIncrement!) {
        _productItem =
            _productItem!.copyWith(quantity: _productItem.quantity! + 1);
        cartItems[_productItem.id!] = _productItem;
      } else if (_productItem!.quantity! > 1) {
        _productItem =
            _productItem.copyWith(quantity: _productItem.quantity! - 1);
        cartItems[_productItem.id!] = _productItem;
      } else if (_productItem.quantity! <= 1) {
        cartItems.removeWhere((key, value) => key == _productItem!.id);
      }
    } else {
      if (isIncrement!) {
        _productItem = _productItem.copyWith(quantity: 1);
        cartItems.putIfAbsent(productItem.id!, () => _productItem!);
        // showCartItemAddedToast(context);
      }
    }
    cartItemList = ObservableList.of(cartItems.values.toList());
    saveCartItemsToSharedPref();
  }

  /// this [cartTotal] get method is calculate the cart total

  @computed
  double get cartTotalCredit {
    double _sum = 0;
    for (final ServiceModel _item in cartItemList) {
      _sum = _item.itemCredit! * _item.quantity! + _sum;
    }
    return _sum;
  }

  /// [getOneActivePlan] this fun is used for retrieve  response from [getActivePlan] inside the [_orderProvider]
  /// and covert [json] response  from the Api to [ActivePlanModel] List object ,
  /// Save the [model] in temporary variable, that is [activePlan]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getOneActivePlan({String? token}) async {
    activePlanState = LoadingStatusEnum.loading;
    dynamic _resp = await _orderProvider.getActivePlan(
      token: token,
    );

    if (_resp['success'] == true) {
      ActivePlanModel _activePlan = ActivePlanModel.fromJson(_resp["data"][0]);
      activePlan = Observable(_activePlan);
      activePlanState = LoadingStatusEnum.success;
    } else {
      activePlanState = LoadingStatusEnum.error;
    }
  }

  /// This [saveCartItemsToSharedPref] is used to save the cart item in local storage

  void saveCartItemsToSharedPref() {
    StorageManager.instance!.saveList(StorageManager.savedCartItems,
        cartItemList.map((e) => json.encode(e)).toList());
  }

  /// this [getStoredSavedListValues] fun is used for get saved cart item from StorageManager,
  /// it will retrive [cartItemList] inside the local storage

  @action
  void getStoredSavedListValues() {
    try {
      List<String>? _savedCartItem =
          StorageManager.instance?.getList(StorageManager.savedCartItems);
      if (_savedCartItem != null && _savedCartItem != []) {
        List<ServiceModel>? _cartItem = _savedCartItem
            .map((e) => ServiceModel.fromJson(json.decode(e)))
            .toList();
        cartItemList = ObservableList.of(_cartItem);
      }
    } catch (e) {
      print(e);
    }
  }

  /// [createItemOrder] this fun is used for retrieve response from [createOrders] inside the [_cartProvider]
  /// It used to create order ,  If the response is positive , navigated to [successPage]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> createItemOrder(
      CreateOrderDto input, BuildContext context, String token) async {
    if (createdOrderState == LoadingStatusEnum.loading) {
      return;
    }
    createdOrderState = LoadingStatusEnum.loading;

    dynamic _resp =
        await _orderProvider.createOrders(input: input, token: token);

    if (_resp['success'] == true) {
      createdOrderState = LoadingStatusEnum.success;
      clearCartAfterOrderPlaced();

      Navigator.of(context).pushNamedAndRemoveUntil(
          '/checkout_sucess_page', (Route<dynamic> route) => false);
    } else {
      BotToast.showText(
          text: _resp['message'] ??
              'Something went wrong , Please Check Your Internet Connection');
      createdOrderState = LoadingStatusEnum.error;
    }
  }

  /// after the creation of order . The cart list [cartItemList] should be clear,
  /// so using this [clearCartAfterOrderPlaced] fun , it will clear the cart page

  @action
  void clearCartAfterOrderPlaced() {
    cartItems = ObservableMap.of({});
    cartItemList = ObservableList.of([]);
    StorageManager.instance!.clearValueFromPrefs(StorageManager.savedCartItems);
  }

  /// [getOrderList] this fun is used for retrieve  response from [getManyOrders] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [OrderModel] List object
  /// Save the list in temporary variable, that is [orderListView]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getOrderList(
      {bool isFromRefresh = false,
      required String token,
      required String? orderStatus}) async {
    if (isFromRefresh) {
      orderListView = ObservableList<OrderModel>.of({});
      pageIndex = 1;
      isPaginationEnded = false;
    }
    orderListViewPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _orderProvider.getManyOrders(
        pageIndex: pageIndex, token: token, orderStatus: orderStatus);
    if (_resp['success'] == true) {
      List<OrderModel> _orderListView = List<OrderModel>.from(
          _resp['data']['data'].map((res) => OrderModel.fromJson(res)));
      if (pageIndex == 1) {
        orderListView = ObservableList<OrderModel>.of(_orderListView);
      } else if (!isPaginationEnded) {
        orderListView.addAll(_orderListView);
      }

      isPaginationEnded = _orderListView.isEmpty || _orderListView.length < 10;
      if (!isPaginationEnded) {
        pageIndex++;
      }

      orderListViewPageState = LoadingStatusEnum.success;
    } else {
      orderListViewPageState = LoadingStatusEnum.error;
    }
  }

  /// [ViewOrderDetails] this fun is used for retrieve  response from [getOrderDetails] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [OrderModel] object
  /// Save the list in temporary variable, that is [orderItem]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> viewOrderDetails({
    String? token,
    int? orderId,
  }) async {
    orderViewPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _orderProvider.getOneOrder(id: orderId, token: token);
    if (_resp['success'] == true) {
      SingleOrderModel _singleOrder = SingleOrderModel.fromJson(_resp["data"]);
      orderItemDetails = Observable(_singleOrder);
      orderViewPageState = LoadingStatusEnum.success;
    } else {
      orderViewPageState = LoadingStatusEnum.error;
    }
  }

  /// [checkPlanIsExpired] this fun is used to know the plane is expired
  /// it will pass token as arg
  /// after the positive respons the value will temporary store the [expiredValue]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> checkPlanIsExpired({
    String? token,
  }) async {
    expiredPlanState = LoadingStatusEnum.loading;
    dynamic _resp = await _orderProvider.getExpiredSoon(token: token);
    print("${_resp}");
    if (_resp['success'] == true) {
      expiredValue = _resp["data"];
      expiredPlanState = LoadingStatusEnum.success;
    } else {
      expiredPlanState = LoadingStatusEnum.error;
    }
  }

  /// [getOrdersValue] this fun is used to get the count of all oders
  /// it will pass token as arg
  /// after the positive respons the value will temporary store the [orderValues]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getOrdersValue({
    String? token,
  }) async {
    orderValueState = LoadingStatusEnum.loading;
    dynamic _resp = await _orderProvider.getOrderCount(token: token);
    if (_resp['success'] == true) {
      orderValueModel _values = orderValueModel.fromJson(_resp);
      orderValues = Observable(_values);
      orderValueState = LoadingStatusEnum.success;
    } else {
      orderValueState = LoadingStatusEnum.error;
    }
  }
}
