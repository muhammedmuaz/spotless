import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/referral_history_page/widgets/my_referrals_card.dart';
import 'package:spotless/pages/referral_history_page/widgets/point_display_card.dart';
import 'package:spotless/pages/referral_history_page/widgets/status_card.dart';
import 'package:spotless/routes.dart';
import 'package:spotless/shared/model/referral/referral.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/redeem_dialog_box.dart';
import 'package:spotless/store/vendor_store/vendor_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/shimmers/active_plan_shimmer.dart';
import '../../shared/shimmers/order_shimmer.dart';

class ReferralHistoryPage extends StatefulWidget {
  const ReferralHistoryPage({Key? key}) : super(key: key);

  @override
  State<ReferralHistoryPage> createState() => _ReferralHistoryPageState();
}

class _ReferralHistoryPageState extends State<ReferralHistoryPage> {
  final VendorStore _vendorStore = locator.get<VendorStore>();
  late ReactionDisposer _refreshDisposerForMyList;
  late ReactionDisposer _refreshDisposerForHistory;
  Completer<dynamic> refreshCompleterForMyList = new Completer();
  Completer<dynamic> refreshCompleterForHistory = new Completer();
  bool isHistoryActive = false;

  @override
  void initState() {
    super.initState();
    _vendorStore.getReferralPoints();
    _vendorStore.getMyReferralList(isFromRefresh: true);
    _vendorStore.getReferralHistory(isFromRefresh: true);
    _refreshDisposerForMyList =
        reaction((_) => _vendorStore.myReferralState, (_) {
      if (_ != LoadingStatusEnum.loading) {
        refreshCompleterForMyList.complete();
        refreshCompleterForMyList = Completer();
      }
    });
    _refreshDisposerForHistory =
        reaction((_) => _vendorStore.referralHistoryList, (_) {
      if (_ != LoadingStatusEnum.loading) {
        refreshCompleterForHistory.complete();
        refreshCompleterForHistory = Completer();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshDisposerForMyList();
    _refreshDisposerForHistory();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            titleSpacing: 0,
            leadingWidth: 80.w,
            backgroundColor: MainTheme.whiteTypeColor,
            centerTitle: true,
            title: Text(
              AppTranslations.of(context)!.text('REFERRAL', 'REFERRAL'),
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: MainTheme.blackTypeColor),
            ),
            leading: IconButton(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  _onBackButtonTap(context);
                },
                icon: Container(
                  height: 36.h,
                  width: 36.w,
                  margin: EdgeInsets.only(right: 25.w),
                  padding: EdgeInsets.all(5),
                  child: WebsafeSvg.asset(
                    'assets/images/back_button.svg',
                    fit: BoxFit.contain,
                  ),
                )),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(180.h),
                child: Container(
                    height: 180.h,
                    child: Column(
                      children: [
                        Observer(builder: (context) {
                          if (_vendorStore.referralPointsState ==
                              LoadingStatusEnum.loading) {
                            return Container(
                                margin: EdgeInsets.only(
                                    left: 16.w, right: 16.w, top: 10.h),
                                child: ActivePlanShimmer());
                          }

                          if (_vendorStore.referralPointsState ==
                              LoadingStatusEnum.error) {
                            return Center(
                                child: Text(
                              AppTranslations.of(context)!
                                  .text('GENERAL', 'SOMETHING WENT WRONG'),
                              style: TextStyle(color: Colors.black),
                            ));
                          }

                          if (_vendorStore.userReferralPoints == null) {
                            return Container(
                                height: 35.h,
                                child: Center(
                                    child: Text(
                                  AppTranslations.of(context)!
                                      .text('GENERAL', 'NO DATA FOUND'),
                                  style: TextStyle(color: Colors.black),
                                )));
                          }

                          return PointDisplayCard(
                            pointValue: _vendorStore
                                        .userReferralPoints?.value.data ==
                                    null
                                ? 0
                                : _vendorStore.userReferralPoints!.value.data,
                            description: _vendorStore
                                        .userReferralPoints?.value.message ==
                                    null
                                ? ""
                                : _vendorStore
                                    .userReferralPoints!.value.message,
                            onTapRedeem: () {
                              goToCreditsPage();
                              // goToRedeemSuccessPage();
                              // showRedeemDialogBox();
                            },
                          );
                        }),
                      ],
                    )))),
        body: isHistoryActive ? myHistory() : myReferrals(),
        bottomSheet: Observer(builder: (context) {
          if (_vendorStore.referralHistoryState == LoadingStatusEnum.loading) {
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
        bottomNavigationBar: isHistoryActive
            ? Container(
                height: 0,
                width: 0,
              )
            : Container(
                padding: EdgeInsets.only(left: 35.w, right: 35.w, bottom: 5.h),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 52.h,
                  child: MaterialButton(
                    onLongPress: null,
                    highlightElevation: 2.5,
                    padding: EdgeInsets.zero,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    elevation: 0,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(55.sp)),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    color: MainTheme.blueTypeOneColor,
                    child:
                        // Observer(builder: (BuildContext context) {
                        //   if (_authStore.editPageState ==
                        //       LoadingStatusEnum.loading) {
                        //     return SizedBox(
                        //       height: 30.h,
                        //       child: LoadingIndicator(
                        //         colors: [Colors.white],
                        //         indicatorType: Indicator.lineScalePulseOutRapid,
                        //       ),
                        //     );
                        //   }
                        //   return
                        Text(
                      AppTranslations.of(context)!
                          .text('REFERRAL', 'EARN MORE'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),

                    // ; // }),

                    onPressed: () {
                      goToEarnMorePage();
                    },
                  ),
                )),
      );
    }));
  }

  Widget myReferrals() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20.h, left: 18.w),
                child: Text(
                  AppTranslations.of(context)!.text('REFERRAL', 'MY REFERRALS'),
                  style: TextStyle(
                      color: MainTheme.blackypeColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    isHistoryActive = true;
                  });
                },
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                    margin: EdgeInsets.only(top: 20.h, right: 18.w),
                    child: Text(
                      AppTranslations.of(context)!
                          .text('REFERRAL', 'POINTS HISTORY'),
                      style: TextStyle(
                          color: MainTheme.blueTypeOneColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                    ))),
          ],
        ),
        Observer(builder: (BuildContext context) {
          if (_vendorStore.myReferralState == LoadingStatusEnum.loading &&
              _vendorStore.myReferralList.isEmpty) {
            return Container(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                height: 460.h,
                child: OrderShimmer());
          }

          if (_vendorStore.myReferralState == LoadingStatusEnum.error) {
            return Container(
                height: 35.h,
                child: Center(
                    child: Text(
                  AppTranslations.of(context)!
                      .text('GENERAL', 'SOMETHING WENT WRONG'),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                )));
          }

          if (_vendorStore.myReferralList.isEmpty) {
            return Container(
                height: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  AppTranslations.of(context)!.text('GENERAL', 'NO DATA FOUND'),
                  style: TextStyle(color: Colors.black),
                )));
          }

          return LazyLoadRefreshIndicator(
              onEndOfPage: onEndOfPageForMyList,
              onRefresh: onRefreshForMyList,
              scrollOffset: 150,
              isLoading:
                  _vendorStore.myReferralState == LoadingStatusEnum.loading,
              child: Container(
                  height: 460.h,
                  child: ListView.builder(
                    itemCount: _vendorStore.myReferralList.length,
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.only(left: 18.w, right: 18.w, top: 12.h),
                    itemBuilder: (BuildContext context, int index) {
                      MyReferralsModel? item =
                          _vendorStore.myReferralList[index];
                      return MyReferralsCard(
                          name: item.name == null ? '' : item.name,
                          email: item.email == null ? '' : item.email,
                          image: null,
                          points: item.pointsSum == null
                              ? null
                              : item.pointsSum.toString());
                    },
                  )));
        })
      ],
    );
  }

  Widget myHistory() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20.h, left: 18.w),
                child: Text(
                  AppTranslations.of(context)!.text('REFERRAL', 'HISTORY'),
                  style: TextStyle(
                      color: MainTheme.blackypeColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    isHistoryActive = false;
                  });
                },
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                    margin: EdgeInsets.only(top: 20.h, right: 18.w),
                    child: Text(
                      AppTranslations.of(context)!
                          .text('REFERRAL', 'MY REFERRALS'),
                      style: TextStyle(
                          color: MainTheme.blueTypeOneColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                    ))),
          ],
        ),
        Observer(builder: (BuildContext context) {
          if (_vendorStore.referralHistoryState == LoadingStatusEnum.loading &&
              _vendorStore.referralHistoryList.isEmpty) {
            return Container(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                height: 510.h,
                child: OrderShimmer());
          }

          if (_vendorStore.referralHistoryState == LoadingStatusEnum.error) {
            return Container(
                height: 35.h,
                child: Center(
                    child: Text(
                  AppTranslations.of(context)!
                      .text('GENERAL', 'SOMETHING WENT WRONG'),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                )));
          }

          if (_vendorStore.referralHistoryList.isEmpty) {
            return Container(
                height: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  AppTranslations.of(context)!.text('GENERAL', 'NO DATA FOUND'),
                  style: TextStyle(color: Colors.black),
                )));
          }

          return LazyLoadRefreshIndicator(
              onEndOfPage: onEndOfPageForHistory,
              onRefresh: onRefreshForHistory,
              scrollOffset: 150,
              isLoading: _vendorStore.referralHistoryState ==
                  LoadingStatusEnum.loading,
              child: Container(
                  height: 510.h,
                  child: ListView.builder(
                    itemCount: _vendorStore.referralHistoryList.length,
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.only(left: 18.w, right: 18.w, top: 12.h),
                    itemBuilder: (BuildContext context, int index) {
                      ReferralHistoryModel? item =
                          _vendorStore.referralHistoryList[index];
                      return StatusCard(
                        credit: item.orderCredit == null
                            ? "0"
                            : "${item.orderCredit!.points}",
                        itemStatus: item.status == null ? 0 : item.status,
                        value: item.redeem == null
                            ? ""
                            : item.redeem?.price == null
                                ? item.redeem!.credits == null
                                    ? ""
                                    : "${item.redeem!.credits}"
                                : "${item.redeem!.price}",
                        type: item.type == null ? 1 : item.type,
                        status: item.type == null ? "" : item.typeName,
                        date: item.updatedAt == null ? null : item.updatedAt!,
                        description: item.message == null ? "" : item.message,
                        point: item.redeem == null ? null : item.redeem!.points,
                      );
                    },
                  )));
        })
      ],
    );
  }

  /// This [goToCreditsPage] is used navigate to [credits_page]

  goToCreditsPage() {
    Navigator.pushNamed(context, '/credits_page');
  }

  /// This [goToEarnMorePage] is used navigate to [referral_page]

  goToEarnMorePage() {
    Navigator.pushNamed(context, '/referral_page');
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/profile_page",
    );
    return Future.value(false);
  }

  /// This [onRefresh] is used to refresh the page

  Future<void> onRefreshForMyList() async {
    _vendorStore.getMyReferralList(isFromRefresh: true);
    return refreshCompleterForMyList.future;
  }

  /// This [onEndOfPage] is used to find the End of the page and updated the page

  void onEndOfPageForMyList() async {
    _vendorStore.getMyReferralList();
  }

  /// This [onRefresh] is used to refresh the page

  Future<void> onRefreshForHistory() async {
    _vendorStore.getReferralHistory(isFromRefresh: true);
    return refreshCompleterForHistory.future;
  }

  /// This [onEndOfPage] is used to find the End of the page and updated the page

  void onEndOfPageForHistory() async {
    _vendorStore.getReferralHistory();
  }
}
