import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/app_localizations.dart';
import 'package:spotless/enum.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/all_service_page/widget/bottom_card.dart';
import 'package:spotless/pages/all_service_page/widget/services_card.dart';
import 'package:spotless/pages/home_page/widgets/service_card.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/no_connection_error_page.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:mobx/mobx.dart';
import '../../shared/model/product/product.model.dart';
import '../../shared/shimmers/category_feild_shimmer.dart';
import '../../shared/shimmers/service_shimmer.dart';
import '../../store/vendor_store/vendor_store.dart';

class AllServicePage extends StatefulWidget {
  final bool fromAppBar;

  const AllServicePage({Key? key, this.fromAppBar = true}) : super(key: key);

  @override
  State<AllServicePage> createState() => _AllServicePageState();
}

class _AllServicePageState extends State<AllServicePage> {
  final VendorStore _vendorStore = locator.get<VendorStore>();
  final AuthStore _authStore = locator.get<AuthStore>();
  final CartStore _cartStore = locator.get<CartStore>();
  late ReactionDisposer _refreshDisposer;
  Completer<dynamic> refreshCompleter = new Completer();

  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.fromAppBar) {
      _vendorStore.selectedCategory = null;
      _vendorStore.getCatergoryList(isFromRefresh: true);
      _vendorStore.getManyServiceList(isFromRefresh: true);
    }

    _vendorStore.getManyServiceList(isFromRefresh: true);
    _vendorStore.getCatergoryList(isFromRefresh: true);
    _refreshDisposer = reaction((_) => _vendorStore.serviceListPageState, (_) {
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
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (BuildContext context) {
      if (_vendorStore.serviceListPageState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(
          onTap: () {
            if (widget.fromAppBar) {
              _vendorStore.selectedCategory = null;
              _vendorStore.getCatergoryList(isFromRefresh: true);
              _vendorStore.getManyServiceList();
            }
            _vendorStore.getManyServiceList(isFromRefresh: true);
            _vendorStore.getCatergoryList();
          },
        );
      }
      return Scaffold(
          appBar: CommonAppBar(
            color: Colors.white,
            showLeading: true,
            leadingWidth: 80.w,
            leadingPadding: const EdgeInsets.all(5),
            elevation: 0,
            name: AppTranslations.of(context)!
                .text('ALL SERVICES', 'ALL SERVICES'),
            onTapLeading: () {
              _onBackButtonTap(context);
            },
            onTapAction: () {
              goToSearchPage();
            },
            showAction: true,
            actionIcon: Container(
                margin: EdgeInsets.only(right: 19.w),
                child: WebsafeSvg.asset('assets/images/search.svg',
                    width: 25.w, height: 25.h)),
          ),
          body: Observer(builder: (context) {
            return Column(
              children: [
                Observer(builder: (BuildContext context) {
                  if (_vendorStore.categoryState == LoadingStatusEnum.loading
                      //  &&
                      //  _vendorStore.categoryList.isEmpty
                      ) {
                    return CategoryFieldShimmer();
                  }
                  if (_vendorStore.categoryState == LoadingStatusEnum.error) {
                    return Container(
                        height: 35.h,
                        child: Center(
                            child: Text(
                          AppTranslations.of(context)!
                              .text('GENERAL', 'SOMETHING WENT WRONG'),
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.sp),
                        )));
                  }

                  if (_vendorStore.categoryList.isEmpty) {
                    return Container(
                        height: 35.h,
                        child: Center(
                            child: Text(
                          AppTranslations.of(context)!
                              .text('GENERAL', 'NO DATA FOUND'),
                          style: TextStyle(color: Colors.black),
                        )));
                  }

                  return Container(
                    height: 35.h,
                    margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16.w),
                      children: <Widget>[
                        InkWell(
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _vendorStore.selectedCategory = null;
                            _vendorStore.getCatergoryList(isFromRefresh: true);
                            _vendorStore.getManyServiceList();
                          },
                          child: Container(
                            width: 35.w,
                            height: 35.h,
                            margin: EdgeInsets.only(
                              right: 5.w,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _vendorStore.selectedCategory == null
                                    ? MainTheme.blueTypeOneColor
                                    : MainTheme.greyTypeTwoColor),
                            alignment: Alignment.center,
                            child: Text(
                              AppTranslations.of(context)!
                                  .text('ALL SERVICES', 'ALL'),
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: _vendorStore.selectedCategory == null
                                      ? MainTheme.whiteTypeColor
                                      : MainTheme.blackTypeColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                          child: ListView.builder(
                            itemCount: _vendorStore.categoryList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              ServiceCategoryModel item =
                                  _vendorStore.categoryList[index];
                              return ServiceCategoryCard(
                                name: item.name == null ? "" : item.name,
                                index: index,
                                isActive: item.isSelected!,
                                onTap: () {
                                  _vendorStore.toSelectCategory(index, item);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: _cartStore.cartItemList.isEmpty
                        ? MediaQuery.of(context).size.height - 150.h
                        : MediaQuery.of(context).size.height - 215.h,
                    child: Observer(builder: (BuildContext context) {
                      if (_vendorStore.serviceListPageState ==
                              LoadingStatusEnum.loading &&
                          _vendorStore.serviceList.isEmpty) {
                        return ServiceShimmer();
                      }

                      // if (_vendorStore.serviceListPageState ==
                      //     LoadingStatusEnum.error) {
                      //   return Container(
                      //       height: MediaQuery.of(context).size.width,
                      //       child: Center(
                      //           child: Text(
                      //         'Something went wrong , Please Check Your Internet Connection',
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(color: Colors.black),
                      //       )));
                      // }

                      if (_vendorStore.serviceList.isEmpty) {
                        return Container(
                            height: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Text(
                              AppTranslations.of(context)!
                                  .text('GENERAL', 'NO DATA FOUND'),
                              style: TextStyle(color: Colors.black),
                            )));
                      }

                      return LazyLoadRefreshIndicator(
                          onEndOfPage: onEndOfPage,
                          onRefresh: onRefresh,
                          scrollOffset: 150,
                          // isLoading: _vendorStore.serviceListPageState ==
                          //     LoadingStatusEnum.loading,
                          child: SingleChildScrollView(
                            child: GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(
                                    left: 16.w, right: 16.w, top: 7.5.h),
                                physics: const ClampingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 18,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 18,
                                        childAspectRatio: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            2.4 /
                                            1.48),
                                itemCount: _vendorStore.serviceList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  ServiceModel item =
                                      _vendorStore.serviceList[index];
                                  return ServiceCard(
                                    quantity: item.quantity == null
                                        ? 0
                                        : item.quantity,
                                    currencyCode:
                                        _authStore.currencyCode == null
                                            ? ""
                                            : _authStore.currencyCode,
                                    name: item.name == null ? "" : item.name,
                                    image: item.imageUrl == null
                                        ? null
                                        : item.imageUrl,
                                    price: item.price == null
                                        ? ''
                                        : item.price.toString(),
                                    credit: item.itemCredit == null
                                        ? 0
                                        : item.itemCredit,
                                    itemId: item.id,
                                    onTapAdd: () {
                                      _cartStore.updateCartItem(
                                        item,
                                        isIncrement: true,
                                        context: context,
                                      );
                                    },
                                    onTapBtns: (bool value) {
                                      _cartStore.updateCartItem(
                                        item,
                                        isIncrement: value,
                                        context: context,
                                      );
                                    },
                                  );
                                }),
                          ));
                    })),
              ],
            );
          }),
          bottomSheet: Observer(builder: (context) {
            if (_vendorStore.serviceListPageState ==
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
          }),
          bottomNavigationBar: Observer(builder: (context) {
            if (_cartStore.cartItemList.isEmpty) {
              return Container(
                height: 1.h,
                width: 1.w,
              );
            }
            return BottomCard(
              itemCount: _cartStore.cartItemList.length.toString(),
            );
          }));
    }));
  }

  /// go to home page

  Future<bool> _onBackButtonTap(BuildContext context) async {
    widget.fromAppBar
        ? Navigator.pushReplacementNamed(
            context,
            "/home_page",
          )
        : Navigator.pop(context);
    return Future.value(false);
  }

  /// go to search page

  goToSearchPage() {
    Navigator.pushNamed(context, '/search_page');
  }

  /// refresh the page

  Future<void> onRefresh() async {
    print(
        '********************************************* refresh of Page ***************************');
    _vendorStore.getManyServiceList(isFromRefresh: true);

    print(
        '********************************************* end of Page ***************************');
    return refreshCompleter.future;
  }

  /// go to end of the page

  void onEndOfPage() async {
    print(
        '********************************************* end of Page ***************************');
    _vendorStore.getManyServiceList();
  }
}
