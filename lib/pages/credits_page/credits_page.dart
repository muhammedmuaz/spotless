import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/enum.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/credits_page/widgets/credits_card.dart';
import 'package:spotless/pages/referral_history_page/widgets/point_display_card.dart';
import 'package:spotless/shared/shimmers/credit_card_shimmer.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/vendor_store/vendor_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../routes.dart';
import '../../shared/model/referral/referral.model.dart';
import '../../shared/shimmers/active_plan_shimmer.dart';
import '../../shared/widgets/redeem_dialog_box.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreditsPage> createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final VendorStore _vendorStore = locator.get<VendorStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vendorStore.getReferralPoints();
    _vendorStore.getCreditSlabList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (context) {
      return Scaffold(
          appBar: CommonAppBar(
            color: Colors.white,
            showLeading: true,
            elevation: 0,
            leadingWidth: 80.w,
            leadingPadding: const EdgeInsets.all(5),
            name: AppTranslations.of(context)!.text('REFERRAL', 'REFERRAL'),
            onTapLeading: () {
              _onBackButtonTap(context);
            },
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Observer(builder: (context) {
                if (_vendorStore.referralPointsState ==
                    LoadingStatusEnum.loading) {
                  return Container(
                      margin:
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
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
                  btnName: AppTranslations.of(context)!
                      .text('REFERRAL', 'EARN MORE'),
                  pointValue:
                      _vendorStore.userReferralPoints?.value.data == null
                          ? 0
                          : _vendorStore.userReferralPoints!.value.data,
                  description:
                      _vendorStore.userReferralPoints?.value.message == null
                          ? ""
                          : _vendorStore.userReferralPoints!.value.message,
                  onTapRedeem: () {
                    goToEarnMorePage();
                  },
                );
              }),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 16.w, bottom: 15.h, top: 20.h),
                    child: Text(
                      AppTranslations.of(context)!
                          .text('REFERRAL', 'REDEEM CREDITS'),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blackypeColor),
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: Observer(builder: (context) {
                    if (_vendorStore.creditPageState ==
                        LoadingStatusEnum.loading) {
                      return CreditCardShimmer();
                    }
                    if (_vendorStore.creditPageState ==
                        LoadingStatusEnum.error) {
                      return Center(
                          child: Text(
                        AppTranslations.of(context)!
                            .text('GENERAL', 'SOMETHING WENT WRONG'),
                        style: TextStyle(color: Colors.black),
                      ));
                    }
                    if (_vendorStore.slabListForCash.isEmpty) {
                      return Container(
                          height: 35.h,
                          child: Center(
                              child: Text(
                            AppTranslations.of(context)!
                                .text('GENERAL', 'NO DATA FOUND'),
                            style: TextStyle(color: Colors.black),
                          )));
                    }
                    return GridView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: _vendorStore.slabListForCredit.length,
                      itemBuilder: (BuildContext context, int index) {
                        SlabModel? item = _vendorStore.slabListForCredit[index];
                        return CreditsCard(
                          name: AppTranslations.of(context)!
                              .text('REFERRAL', 'CREDIT'),
                          value: item.credit.toString(),
                          point: item.point.toString(),
                          onTapCredits: () {
                            showRedeemDialogBox(item: item);
                          },
                        );
                      },
                    );
                  })),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 16.w, bottom: 15.h, top: 20.h),
                    child: Text(
                      AppTranslations.of(context)!
                          .text('REFERRAL', 'REDEEM AS CASH'),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blackypeColor),
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: Observer(builder: (context) {
                    if (_vendorStore.creditPageState ==
                        LoadingStatusEnum.loading) {
                      return CreditCardShimmer();
                    }
                    if (_vendorStore.creditPageState ==
                        LoadingStatusEnum.error) {
                      return Center(
                          child: Text(
                        AppTranslations.of(context)!
                            .text('GENERAL', 'SOMETHING WENT WRONG'),
                        style: TextStyle(color: Colors.black),
                      ));
                    }
                    if (_vendorStore.slabListForCash.isEmpty) {
                      return Container(
                          height: 35.h,
                          child: Center(
                              child: Text(
                            AppTranslations.of(context)!
                                .text('GENERAL', 'NO DATA FOUND'),
                            style: TextStyle(color: Colors.black),
                          )));
                    }
                    return GridView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: _vendorStore.slabListForCash.length,
                      itemBuilder: (BuildContext context, int index) {
                        SlabModel? item = _vendorStore.slabListForCash[index];
                        return CreditsCard(
                          name:
                              "${AppTranslations.of(context)!.text('REFERRAL', 'CASH')}",
                          value: item.cash.toString(),
                          point: item.point.toString(),
                          onTapCredits: () {
                            goToRedeemCashPage(item: item);
                          },
                        );
                      },
                    );
                  })),
            ],
          )));
    }));
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/referral_history_page",
    );
    return Future.value(false);
  }

  /// This [goToEarnMorePage] fun is used navigate to [referral_page]

  goToEarnMorePage() {
    Navigator.pushNamed(context, '/referral_page');
  }

  /// This [showRedeemDialogBox] fun is used to show the [Dialog] Box

  void showRedeemDialogBox({SlabModel? item}) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return RedeemDialogBox(
            onTapOptions: () {
              goToRedeemSuccessPage(item: item);
            },
          );
        });
  }

  /// This [goToRedeemSuccessPage] fun is used redeem credit using [redeemCredit] fun that inside the [_vendorStore]

  goToRedeemSuccessPage({SlabModel? item}) {
    var dto = {
      "referral_settings_id": item!.id,
      "referral_type": 1,
    };
    _vendorStore.redeemCredit(dto, context, _authStore.accessToken!,
        item: item);
  }

  /// This [goToRedeemCashPage] fun is used navigate to [redeem_cash_page]

  goToRedeemCashPage({SlabModel? item}) {
    Navigator.pushNamed(context, '/redeem_cash_page',
        arguments: RedeemSuccessPageParam(
            type: "CASH",
            value: "${item!.cash}",
            point: "${item.point}",
            message: "",
            selectedItem: item));
  }
}
