import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:spotless/pages/home_page/widgets/header_card.dart';
import 'package:spotless/pages/home_page/widgets/scrollbuilder_with_indication.dart';
import 'package:spotless/pages/home_page/widgets/service_card.dart';
import 'package:spotless/pages/home_page/widgets/swipper.dart';
import 'package:spotless/shared/widgets/no_connection_error_page.dart';
import 'package:spotless/shared/model/product/product.model.dart';
import 'package:spotless/shared/shimmers/home_shimmer.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spotless/shared/widgets/bottom_tab_bar.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import 'package:spotless/store/notification_store/notification_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../locator.dart';
import '../../shared/widgets/common_button.dart';
import '../../store/auth_store/auth_store.dart';
import '../../store/vendor_store/vendor_store.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ReactionDisposer _refreshDisposer;
  Completer<dynamic> refreshCompleter = new Completer();
  final VendorStore _vendorStore = locator.get<VendorStore>();
  final NotificationStore _notificationStore = locator.get<NotificationStore>();
  final CartStore _cartStore = locator.get<CartStore>();
  final AuthStore _authStore = locator.get<AuthStore>();
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _authStore.getCurrencyData();
    _authStore.getCountryData();
    _vendorStore.getHomePageData();
    _notificationStore.addNotificationCount();
    _cartStore.checkPlanIsExpired(token: _authStore.accessToken);
    _refreshDisposer = reaction((_) => _cartStore.expiredValue, (_) {
      if (_ != 2) {
        YYNoticeDialog();
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

  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    print(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${_authStore.accessToken}");

    print(
        "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww ${_notificationStore.notificationLength}");

    YYDialog.init(context);

    return WillPopScope(onWillPop: () {
      return _onBackButtonTap();
    }, child: Observer(builder: (BuildContext context) {
      if (_vendorStore.homePageState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(
          onTap: () {
            _authStore.getCurrencyData();
            _authStore.getCountryData();
            _vendorStore.getHomePageData();
          },
        );
      }
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MainTheme.whiteTypeColor,
          toolbarHeight: 1,
        ),
        backgroundColor: MainTheme.whiteTypeColor,
        body: Observer(builder: (BuildContext context) {
          if (_vendorStore.homePageState == LoadingStatusEnum.loading) {
            return HomeShimmer();
          }

          if (_vendorStore.homeList.isEmpty) {
            return Container(
                height: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  AppTranslations.of(context)!.text('GENERAL', 'NO DATA FOUND'),
                  style: TextStyle(color: Colors.black),
                )));
          }

          return SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 40.h,
              ),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(left: 16.w, right: 11.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _authStore.appUser?.value.imageUrl == null ||
                              _authStore.appUser?.value.imageUrl == ''
                          ? CircleAvatar(
                              radius: 16.sp,
                              backgroundImage: AssetImage(
                                "assets/images/placeholder.png",
                              ))
                          : CircleAvatar(
                              radius: 16.sp,
                              backgroundImage: NetworkImage(
                                _authStore.appUser!.value.imageUrl,
                              )),
                      InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            goToNotifiactionPage();
                          },
                          child: Observer(builder: (BuildContext context) {
                            if (_notificationStore.notificationLength == 0 ||
                                _notificationStore.notificationLength == null) {
                              return WebsafeSvg.asset(
                                  'assets/images/notification_without.svg');
                            }
                            if (!_notificationStore.showPoint) {
                              return WebsafeSvg.asset(
                                  'assets/images/notification_without.svg');
                            }
                            return WebsafeSvg.asset(
                                'assets/images/notification.svg');
                          }))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 13.h, bottom: 20.h),
                  padding: EdgeInsets.only(left: 14.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            child: Text(
                              _authStore.appUser?.value.name == null
                                  ? "${AppTranslations.of(context)!.text('HOME', 'HEY')} "
                                  : "${AppTranslations.of(context)!.text('HOME', 'HEY')} ${_authStore.appUser!.value.name}",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: MainTheme.greyTypeColor),
                            ),
                          ),
                          Text(
                            AppTranslations.of(context)!
                                .text('HOME', 'WELCOME'),
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: MainTheme.blackypeColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Observer(builder: (BuildContext context) {
                  if (_vendorStore.homeList[0].banners!.isEmpty) {
                    return Container();
                  }
                  return SizedBox(
                    height: 247.h,
                    width: MediaQuery.of(context).size.width,
                    child: Swiper(
                        itemCount: _vendorStore.homeList[0].banners!.length,
                        itemBuilder: (BuildContext context, int index) {
                          BannersModel? item =
                              _vendorStore.homeList[0].banners![index];
                          return InkWell(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                YYNoticeDialog();
                              },
                              child: Stack(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 202.h,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: item.imageUrl == null ||
                                                  item.imageUrl == ''
                                              ? Image.asset(
                                                  "assets/images/placeholder.png",
                                                  fit: BoxFit.contain,
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl: item.imageUrl,
                                                  fit: BoxFit.fill,
                                                  errorWidget:
                                                      (BuildContext context,
                                                              message, n) =>
                                                          Image.asset(
                                                    "assets/images/placeholdercommon.png",
                                                    fit: BoxFit.contain,
                                                  ),
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                    "assets/images/placeholder.png",
                                                    fit: BoxFit.contain,
                                                  ),
                                                ))),
                                ],
                              ));
                        },
                        viewportFraction: .94,
                        scale: .9,
                        pagination: SwiperPagination(builder:
                            SwiperCustomPagination(builder: (context, config) {
                          return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 11.h),
                                height: 10,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      _vendorStore.homeList[0].banners!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    currentIndex = index + 1;
                                    return config.activeIndex == index
                                        ? Container(
                                            margin: EdgeInsets.only(right: 7.w),
                                            child: CircleAvatar(
                                              radius: 3.5.sp,
                                              backgroundColor:
                                                  MainTheme.blueTypeOneColor,
                                            ),
                                          )
                                        : Container(
                                            margin: EdgeInsets.only(right: 7.w),
                                            child: CircleAvatar(
                                                radius: 3.5.sp,
                                                backgroundColor:
                                                    MainTheme.greyTypeOneColor),
                                          );
                                  },
                                ),
                              ));
                        }))),

                    //  const CardSwipper()
                  );
                }),
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 5.h),
                  child: HeaderCard(
                    name: AppTranslations.of(context)!
                        .text('HOME', 'SERVICES CATEGORY'),
                    actionName: AppTranslations.of(context)!
                        .text('HOME', 'ALL CATEGORY'),
                    actionOnTap: () {
                      goToCategoryPage();
                    },
                  ),
                ),
                Observer(builder: (BuildContext context) {
                  if (_vendorStore.homeList[0].serviceCategories!.isEmpty) {
                    return Container();
                  }
                  return ScrollBuilderWithIndication(
                    itemList: _vendorStore.homeList[0].serviceCategories!,
                    limt: 4,
                    onTapItem: () {
                      goToAllServicePage();
                    },
                  );
                }),
                HeaderCard(
                  name: AppTranslations.of(context)!
                      .text('HOME', 'POPULAR SERVICES'),
                  actionName:
                      AppTranslations.of(context)!.text('HOME', 'ALL CATEGORY'),
                  actionOnTap: () {
                    _vendorStore.getCatergoryList(isFromRefresh: true);
                    goToAllServicePage();
                  },
                ),
                Observer(builder: (BuildContext context) {
                  if (_vendorStore.homeList[0].popularServices!.isEmpty) {
                    return Container();
                  }
                  return GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      physics: const ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 18,
                          crossAxisCount: 2,
                          mainAxisSpacing: 18,
                          childAspectRatio:
                              MediaQuery.of(context).size.aspectRatio *
                                  2.4 /
                                  1.48),
                      itemCount:
                          _vendorStore.homeList[0].popularServices!.length,
                      itemBuilder: (BuildContext context, int index) {
                        ProductServiceModel item =
                            _vendorStore.homeList[0].popularServices![index];
                        return ServiceCard(
                          quantity: item.service?.quantity == null
                              ? 0
                              : item.service!.quantity,
                          // currencyCode: "Credits",
                          currencyCode: _authStore.currencyCode == null
                              ? ''
                              : _authStore.currencyCode,
                          name: item.service?.name == null
                              ? ''
                              : item.service!.name,
                          image: item.service?.imageUrl == null
                              ? ''
                              : item.service!.imageUrl,
                          price: item.service?.price == null
                              ? ""
                              : item.service!.price.toString(),
                          credit: item.service?.itemCredit == null
                              ? 0
                              : item.service!.itemCredit,
                          itemId:
                              item.service?.id == null ? 0 : item.service!.id,
                          onTapAdd: () {
                            _cartStore.updateCartItem(
                              item.service,
                              isIncrement: true,
                              context: context,
                            );
                          },
                          onTapBtns: (bool value) {
                            _cartStore.updateCartItem(
                              item.service!,
                              isIncrement: value,
                              context: context,
                            );
                          },
                        );
                      });
                }),
                SizedBox(
                  height: 20.h,
                )
              ]));
        }),
        bottomNavigationBar: const BottomTabBar(
          currentIndex: 0,
        ),
      );
    }));
  }

  /// This [goToNotifiactionPage] is used navigate to [notification_page]

  goToNotifiactionPage() {
    Navigator.pushNamed(context, '/notification_page');
  }

  /// This [goToCategoryPage] is used navigate to [category_page]

  goToCategoryPage() {
    Navigator.pushNamed(context, '/category_page');
  }

  /// This [goToAllServicePage] is used navigate to [all_service_page]

  goToAllServicePage() {
    Navigator.pushNamed(context, '/all_service_page', arguments: false);
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) >
            const Duration(milliseconds: 500)) {
      currentBackPressTime = now;
      BotToast.showText(
        text: 'DOUBLE TAP EXIT MSG',
        contentColor: Colors.black,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  /// This [YYNoticeDialog] fun is used to show the left side animated box , according to the conditions

  YYDialog YYNoticeDialog() {
    return YYDialog().build()
      ..gravity = Gravity.left
      ..width = 303.w
      // ..height = 200.h
      ..gravityAnimationEnable = true
      ..decoration = BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: Radius.circular(12),
        bottomLeft: Radius.zero,
        bottomRight: Radius.circular(12),
      ))
      ..widget(Container(
        width: 303.w,
        height: 100.h,
        padding: EdgeInsets.only(
          left: 30.w,
          top: 10.h,
        ),
        margin: EdgeInsets.only(
          top: 400.h,
        ),
        decoration: BoxDecoration(
            color: MainTheme.blackypeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.circular(12),
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(12),
            )),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Subscription",
                  style: TextStyle(
                      color: MainTheme.whiteTypeColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Expires Soon",
                  style: TextStyle(
                      color: MainTheme.whiteTypeColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 100.w,
                  height: 24.h,
                  margin: EdgeInsets.only(top: 10.h),
                  child: CommonButton(
                    height: 24.h,
                    name: 'RENEW',
                    colorBtn: MainTheme.blueTypeOneColor,
                    colorText: MainTheme.whiteTypeColor,
                    textStyle: TextStyle(
                        color: MainTheme.whiteTypeColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                    radius: BorderRadius.all(Radius.circular(30.sp)),
                    onTap: () {},
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Image.asset('assets/images/expired.png', height: 100.h),
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 100.h,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 15.sp,
                      ),
                    )))
          ],
        ),
      ))
      ..show();
  }
}
