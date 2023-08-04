import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/cart_page/widgets/active_plan.dart';
import 'package:spotless/pages/cart_page/widgets/cart_item_card.dart';
import 'package:spotless/pages/cart_page/widgets/empty_subscription_card.dart';
import 'package:spotless/pages/cart_page/widgets/waiting_for_card.dart';
import 'package:spotless/shared/model/product/product.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/cart_store/cart_store.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/shimmers/active_plan_shimmer.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartStore _cartStore = locator.get<CartStore>();
  final AuthStore _authStore = locator.get<AuthStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartStore.getOneActivePlan(token: _authStore.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return _onBackButtonTap(context);
        },
        child: Scaffold(
            backgroundColor: MainTheme.whiteTypeColor,
            appBar: CommonAppBar(
              color: Colors.white,
              leadingWidth: 80.w,
              leadingPadding: const EdgeInsets.all(5),
              showLeading: true,
              elevation: 0,
              name: AppTranslations.of(context)!.text('MY CART', 'MY CART'),
              onTapLeading: () {
                _onBackButtonTap(context);
              },
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 12.h,
                left: 16.w,
                right: 16.w,
              ),
              child: Column(
                children: [
                  Observer(builder: (context) {
                    if (_cartStore.activePlanState ==
                        LoadingStatusEnum.loading) {
                      return ActivePlanShimmer();
                    }

                    if (_cartStore.activePlanState == LoadingStatusEnum.error) {
                      return Center(
                          child: Text(
                        AppTranslations.of(context)!
                            .text('GENERAL', 'SOMETHING WENT WRONG'),
                        style: TextStyle(color: Colors.black),
                      ));
                    }

                    if (_cartStore.activePlan!.value.planeStatus == 0) {
                      return EmptySubScriptionCard(
                        isAdd: false,
                        onTap: () {
                          goToPlanPage();
                        },
                      );
                    }

                    // if (_vendorStore.homeList.isEmpty) {
                    //   return Container(
                    //       height: MediaQuery.of(context).size.width,
                    //       child: Center(
                    //           child: Text(
                    //         AppTranslations.of(context)!
                    //             .text('GENERAL', 'NO DATA FOUND'),
                    //         style: TextStyle(color: Colors.black),
                    //       )));
                    // }

                    return ActivePlan(
                        dateOfValidity: _cartStore
                                    .activePlan?.value.validTill ==
                                null
                            ? ""
                            : _cartStore.activePlan!.value.validTill,
                        reminningQty:
                            _cartStore.activePlan?.value.balanceQty ==
                                    null
                                ? ""
                                : "${_cartStore.activePlan!.value.balanceQty}",
                        subscriptionCode: _authStore
                                        .currencyCode ==
                                    null &&
                                _cartStore
                                        .activePlan?.value.subscriptionPrice ==
                                    null &&
                                _cartStore
                                        .activePlan?.value.durationTypeName ==
                                    null
                            ? ""
                            : "${_authStore.currencyCode}${_cartStore.activePlan!.value.subscriptionPrice}/${_cartStore.activePlan!.value.durationTypeName}",
                        subscriptionName:
                            _cartStore.activePlan?.value.subscriptionName ==
                                    null
                                ? ""
                                : _cartStore.activePlan!.value.subscriptionName,
                        totalQty: _cartStore.activePlan?.value.totalQty == null
                            ? ""
                            : "${_cartStore.activePlan!.value.totalQty}",
                        usedQty: _cartStore.activePlan?.value.usedQty == null
                            ? ""
                            : "${_cartStore.activePlan!.value.usedQty}");
                  }),

                  // WaitingForCard(),
                  // EmptySubScriptionCard(
                  //   isAdd: false,
                  //   onTap: () {
                  //     goToPlanPage();
                  //   },
                  // ),

                  Container(
                    margin: EdgeInsets.only(top: 18.h, bottom: 15.h), //top:15
                    child: Row(
                      children: [
                        Text(
                          AppTranslations.of(context)!
                              .text('MY CART', 'CART ITEMS'),
                          style: TextStyle(
                              color: MainTheme.blackypeColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Observer(builder: (context) {
                    if (_cartStore.cartItemList.isEmpty) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 64.h), //64 27
                            child: Image.asset('assets/images/empty-cart.jpg',
                                height: 200.h, width: 200.w),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.h, bottom: 5.h),
                            child: Text(
                              AppTranslations.of(context)!
                                  .text('MY CART', 'EMPTY'),
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: MainTheme.blackypeColor),
                            ),
                          ),
                          Text(
                            AppTranslations.of(context)!
                                .text('MY CART', 'ADD SERVICES'),
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: MainTheme.greyTypeColor,
                                shadows: const [
                                  Shadow(
                                      color: MainTheme.greyTypeColor,
                                      blurRadius: .5)
                                ]),
                          ),
                        ],
                      );
                    }
                    return ListView.builder(
                      itemCount: _cartStore.cartItemList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        ServiceModel item = _cartStore.cartItemList[index];
                        return CartItemCard(
                          name: item.name == null ? "" : item.name,
                          currencyCode: AppTranslations.of(context)!
                              .text('REFERRAL', 'CREDIT'),
                          // _authStore.currencyCode == null
                          //     ? ""
                          //     : _authStore.currencyCode,
                          price: item.itemCredit.toString(),
                          serviceName: item.category!.name == null
                              ? ""
                              : item.category!.name,
                          quantity: item.quantity == null ? 0 : item.quantity,
                          onTapBtns: (bool value) {
                            _cartStore.updateCartItem(
                              item,
                              isIncrement: value,
                              context: context,
                            );
                          },
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
            bottomNavigationBar: Observer(builder: (context) {
              if (_cartStore.cartItemList.isEmpty) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 33.w, right: 33.w, bottom: 10.h),
                  child: CommonButton(
                    name: AppTranslations.of(context)!
                        .text('MY CART', 'VIEW SERVICES'),
                    colorBtn: MainTheme.blueTypeOneColor,
                    colorText: MainTheme.whiteTypeColor,
                    textStyle: TextStyle(
                        color: MainTheme.whiteTypeColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                    height: 50.h,
                    radius: BorderRadius.all(Radius.circular(30.sp)),
                    onTap: () {
                      goToAllServicePage();
                    },
                  ),
                );
              }

              return Container(
                width: MediaQuery.of(context).size.width,
                height: 60.h,
                decoration: const BoxDecoration(
                    color: MainTheme.whiteTypeColor,
                    border: Border(
                        top: BorderSide(
                            color: MainTheme.greyTypeFiveColor, width: .2))),
                padding: EdgeInsets.only(
                    left: 29.w, right: 29.w, top: 10.h, bottom: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTranslations.of(context)!
                              .text('ALL SERVICES', 'TOTAL'),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: MainTheme.greyTypeFourColor),
                        ),
                        Text(
                          _cartStore.cartTotalCredit.toInt() != null
                              ? "${_cartStore.cartTotalCredit.toInt()} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}"
                              : "0 ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: MainTheme.blueTypeOneColor),
                        )
                      ],
                    ),
                    Observer(builder: (context) {
                      if (_cartStore.activePlanState ==
                          LoadingStatusEnum.loading) {
                        return SizedBox(
                            width: 143.w,
                            height: 40.h,
                            child: MaterialButton(
                              onPressed: () {},
                              onLongPress: null,
                              highlightElevation: 2.5,
                              padding: EdgeInsets.zero,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              elevation: 0,
                              shape: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(55.sp)),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              color: MainTheme.blueTypeOneColor,
                              child: SizedBox(
                                height: 20.h,
                                child: LoadingIndicator(
                                  colors: [Colors.white],
                                  indicatorType:
                                      Indicator.lineScalePulseOutRapid,
                                ),
                              ),
                            ));
                      }
                      if (_cartStore.activePlanState ==
                          LoadingStatusEnum.error) {
                        return Container();
                      }

                      if (_cartStore.activePlan?.value.planeStatus == 0) {
                        return SizedBox(
                          width: 143.w,
                          height: 40.h,
                          child: CommonButton(
                            name: AppTranslations.of(context)!
                                .text('MY CART', 'CONTINUE'),
                            isEnable: false,
                            colorBtn: MainTheme.blueTypeOneColor,
                            colorBtnDisable:
                                MainTheme.blueTypeOneTransparentColor,
                            colorText: MainTheme.whiteTypeColor,
                            textStyle: TextStyle(
                                color: MainTheme.whiteTypeColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                            height: 50.h,
                            radius: BorderRadius.all(Radius.circular(30.sp)),
                            onTap: () {
                              if (_cartStore.activePlan!.value.balanceQty ==
                                  0) {
                                BotToast.showText(
                                    text: AppTranslations.of(context)!
                                        .text('MY CART', 'NO CREDIT FOUND'),
                                    duration: Duration(seconds: 5));
                              } else if (_cartStore.cartTotalCredit.toInt() >
                                  _cartStore.activePlan!.value.balanceQty!) {
                                BotToast.showText(
                                    text: AppTranslations.of(context)!
                                        .text('MY CART', 'EXCEEDED'),
                                    duration: Duration(seconds: 5));
                              } else {
                                goToCheckOutPage();
                              }
                            },
                          ),
                        );
                      }
                      return SizedBox(
                        width: 143.w,
                        height: 40.h,
                        child: CommonButton(
                          name: AppTranslations.of(context)!
                              .text('MY CART', 'CONTINUE'),
                          isEnable: true,
                          colorBtn: MainTheme.blueTypeOneColor,
                          colorBtnDisable:
                              MainTheme.blueTypeOneTransparentColor,
                          colorText: MainTheme.whiteTypeColor,
                          textStyle: TextStyle(
                              color: MainTheme.whiteTypeColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          height: 50.h,
                          radius: BorderRadius.all(Radius.circular(30.sp)),
                          onTap: () {
                            if (_cartStore.activePlan!.value.balanceQty == 0) {
                              BotToast.showText(
                                  text: AppTranslations.of(context)!
                                      .text('MY CART', 'NO CREDIT FOUND'),
                                  duration: Duration(seconds: 5));
                            } else if (_cartStore.cartTotalCredit.toInt() >
                                _cartStore.activePlan!.value.balanceQty!) {
                              BotToast.showText(
                                  text: AppTranslations.of(context)!
                                      .text('MY CART', 'EXCEEDED'),
                                  duration: Duration(seconds: 5));
                            } else {
                              goToCheckOutPage();
                            }
                          },
                        ),
                      );
                    })
                  ],
                ),
              );
            })));
  }

  /// go to choose plan page

  goToPlanPage() {
    Navigator.pushNamed(context, '/choose_plan_page');
  }

  /// go to check out page

  goToCheckOutPage() {
    Navigator.pushNamed(context, '/checkout_page');
  }

  /// go to all service page

  goToAllServicePage() {
    Navigator.pushNamed(
      context,
      '/all_service_page',
    );
  }

  /// go to home page

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
    return Future.value(false);
  }
}
