import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/my_orders_page/widgets/order_card.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/model/order/order.model.dart';
import '../../shared/shimmers/order_shimmer.dart';
import '../../store/auth_store/auth_store.dart';
import '../../store/cart_store/cart_store.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  late ReactionDisposer _refreshDisposer;
  Completer<dynamic> refreshCompleter = new Completer();
  final AuthStore _authStore = locator.get<AuthStore>();
  final CartStore _cartStore = locator.get<CartStore>();

  String dropdownValue = 'ALL ORDER';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartStore.getOrdersValue(
      token: _authStore.accessToken!,
    );

    _cartStore.getOrderList(
        token: _authStore.accessToken!,
        orderStatus: dropdownValue,
        isFromRefresh: true);

    _refreshDisposer = reaction((_) => _cartStore.orderListViewPageState, (_) {
      if (_ != LoadingStatusEnum.loading) {
        refreshCompleter.complete();
        refreshCompleter = Completer();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onBackButtonTap(context);
      },
      child: Scaffold(
          appBar: CommonAppBar(
            color: Colors.white,
            showLeading: true,
            leadingWidth: 80.w,
            leadingPadding: const EdgeInsets.all(5),
            elevation: 0,
            name: AppTranslations.of(context)!.text('MY ORDERS', 'MY ORDERS'),
            onTapLeading: () {
              _onBackButtonTap(context);
            },
          ),
          body: Observer(builder: (BuildContext context) {
            return LazyLoadRefreshIndicator(
                // backgroundColor: Colors.grey.shade200,
                // color: MainTheme.darkBlueTypeColor,
                onEndOfPage: onEndOfPage,
                onRefresh: onRefresh,
                scrollOffset: 300,
                isLoading: _cartStore.orderListViewPageState ==
                    LoadingStatusEnum.loading,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Observer(builder: (BuildContext context) {
                          if (_cartStore.orderListViewPageState ==
                                  LoadingStatusEnum.loading &&
                              _cartStore.orderListView.isEmpty) {
                            return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: Colors.amber),
                                      height: 30.h,
                                      width: 100.w,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: Colors.amber),
                                      height: 30.h,
                                      width: 200.w,
                                    )
                                  ],
                                ));
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(builder: (BuildContext context) {
                                if (_cartStore.orderValueState ==
                                        LoadingStatusEnum.loading &&
                                    _cartStore.orderListView.isEmpty) {
                                  return Container();
                                }

                                if (_cartStore.orderValueState ==
                                    LoadingStatusEnum.error) {
                                  return Container();
                                }
                                return Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  child: Text(
                                    _cartStore.orderValues?.value == null
                                        ? " ${AppTranslations.of(context)!.text('MY ORDERS', 'ORDERS')}"
                                        : " ${ordersValuesNum!} ${AppTranslations.of(context)!.text('MY ORDERS', 'ORDERS')}",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: MainTheme.blackypeColor),
                                  ),
                                );
                              }),
                              Container(
                                  // width: 119.w,
                                  height: 29.h,
                                  padding: EdgeInsets.only(
                                      left: 10.w,
                                      right: 5.w,
                                      top: 6.h,
                                      bottom: 6.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.sp)),
                                      border: Border.all(
                                          color: MainTheme.greyTypeColor,
                                          width: 1.w)),
                                  child: DropdownButton<String>(
                                    value: AppTranslations.of(context)!.text(
                                        'ORDER DETAILS', '$dropdownValue'),
                                    icon: Container(
                                        margin: EdgeInsets.only(left: 35.w),
                                        child: WebsafeSvg.asset(
                                            'assets/images/arrow-down.svg')),
                                    elevation: 0,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: MainTheme.blackypeColor,
                                        overflow: TextOverflow.ellipsis,
                                        shadows: const [
                                          Shadow(
                                              color: MainTheme.blackypeColor,
                                              blurRadius: .2)
                                        ]),
                                    underline: const SizedBox.shrink(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                        _cartStore.getOrderList(
                                            token: _authStore.accessToken!,
                                            orderStatus: dropdownValue,
                                            isFromRefresh: true);
                                        _cartStore.getOrdersValue(
                                          token: _authStore.accessToken!,
                                        );
                                      });
                                    },
                                    items: <String>[
                                      AppTranslations.of(context)!
                                          .text('ORDER DETAILS', 'ALL ORDER'),
                                      AppTranslations.of(context)!
                                          .text('ORDER DETAILS', 'PENDING'),
                                      AppTranslations.of(context)!
                                          .text('ORDER DETAILS', 'ACCEPTED'),
                                      AppTranslations.of(context)!.text(
                                          'ORDER DETAILS', 'OUT FOR PICK UP'),
                                      AppTranslations.of(context)!
                                          .text('ORDER DETAILS', 'PROCESSING'),
                                      AppTranslations.of(context)!.text(
                                          'ORDER DETAILS',
                                          'READY FOR DELIVERY'),
                                      AppTranslations.of(context)!.text(
                                          'ORDER DETAILS', 'OUT FOR DELIVERY'),
                                      AppTranslations.of(context)!
                                          .text('ORDER DETAILS', 'DELIVERD'),
                                      AppTranslations.of(context)!
                                          .text('ORDER DETAILS', 'RECIVED'),
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          "${AppTranslations.of(context)!.text('MY ORDERS', '$value')}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      );
                                    }).toList(),
                                  ))
                            ],
                          );
                        }),
                        Observer(builder: (BuildContext context) {
                          if (_cartStore.orderListViewPageState ==
                                  LoadingStatusEnum.loading &&
                              _cartStore.orderListView.isEmpty) {
                            return OrderShimmer();
                          }

                          if (_cartStore.orderListViewPageState ==
                              LoadingStatusEnum.error) {
                            return Container(
                                height: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Text(
                                  'Something went wrong , Please Check Your Internet Connection',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )));
                          }

                          if (_cartStore.orderListView.isEmpty) {
                            return Container(
                                height: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Text(
                                  'No Order Found',
                                  style: TextStyle(color: Colors.black),
                                )));
                          }

                          return ListView.builder(
                            itemCount: _cartStore.orderListView.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 15.h),
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              OrderModel item = _cartStore.orderListView[index];
                              return OrderCard(
                                index: index,
                                orderNumber:
                                    item.orderId == null ? "" : item.orderId,
                                orderDate: item.createdAt == null
                                    ? null
                                    : item.createdAt,
                                color: item.status == null
                                    ? Colors.white
                                    : item.statusNameColors,
                                totalQty: item.totalQuantity == null
                                    ? 0
                                    : item.totalQuantity,
                                status:
                                    item.status == null ? "" : item.statusName,
                                onTap: () {
                                  goToOrderDetailPage(item);
                                },
                              );
                            },
                          );
                        })
                      ],
                    ),
                  ),
                ));
          }),
          bottomSheet: Observer(builder: (context) {
            if (_cartStore.orderListViewPageState ==
                LoadingStatusEnum.loading) {
              return Container(
                  color: Colors.transparent,
                  height: 40,
                  child: Center(
                    child: LoadingIndicator(
                      colors: [
                        MainTheme.blueTypeOneColor,
                      ],
                      indicatorType: Indicator.ballClipRotateMultiple,
                    ),
                  ));
            }
            return Container(
              height: 1,
            );
          })),
    );
  }

  /// This [goToOrderDetailPage] is used navigate to [my_order_details_page]

  goToOrderDetailPage(OrderModel? item) {
    Navigator.pushNamed(context, '/my_order_details_page', arguments: item);
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(
        context, "/profile_page", (route) => false);

    return Future.value(false);
  }

  /// This [onRefresh] is used to refresh the page

  Future<void> onRefresh() async {
    _cartStore.getOrderList(
        isFromRefresh: true,
        token: _authStore.accessToken!,
        orderStatus: dropdownValue);
    return refreshCompleter.future;
  }

  /// This [onEndOfPage] is used to find the End of the page and updated the page

  void onEndOfPage() async {
    _cartStore.getOrderList(
        token: _authStore.accessToken!, orderStatus: dropdownValue);
  }

  /// This [ordersValuesNum] fun is used for switch case, and
  /// it will give int value of corresponing dropdownvalue

  int? get ordersValuesNum {
    switch (dropdownValue) {
      case "ALL ORDER":
        return _cartStore.orderValues?.value.allOrders == null
            ? 0
            : _cartStore.orderValues!.value.allOrders;
      case "PENDING":
        return _cartStore.orderValues?.value.pendingOrders == null
            ? 0
            : _cartStore.orderValues!.value.pendingOrders;
      case "ACCEPTED":
        return _cartStore.orderValues?.value.acceptedOrders == null
            ? 0
            : _cartStore.orderValues!.value.acceptedOrders;
      case "OUT FOR PICK UP":
        return _cartStore.orderValues?.value.outForPickupOrders == null
            ? 0
            : _cartStore.orderValues!.value.outForPickupOrders;
      case "REJECTED":
        return _cartStore.orderValues?.value.rejectedOrders == null
            ? 0
            : _cartStore.orderValues?.value.rejectedOrders;
      case "PROCESSING":
        return _cartStore.orderValues?.value.processingOrders == null
            ? 0
            : _cartStore.orderValues?.value.processingOrders;
      case "READY FOR DELIVERY":
        return _cartStore.orderValues?.value.readyForDeliveryOrders == null
            ? 0
            : _cartStore.orderValues?.value.readyForDeliveryOrders;
      case "OUT FOR DELIVERY":
        return _cartStore.orderValues?.value.outForDeliveryOrders == null
            ? 0
            : _cartStore.orderValues?.value.outForDeliveryOrders;
      case "DELIVERD":
        return _cartStore.orderValues?.value.deliveredOrders == null
            ? 0
            : _cartStore.orderValues?.value.deliveredOrders;
      case "RECIVED":
        return _cartStore.orderValues?.value.receivedOrders == null
            ? 0
            : _cartStore.orderValues?.value.receivedOrders;
    }
  }
}
