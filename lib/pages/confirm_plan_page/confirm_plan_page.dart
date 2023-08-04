import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/confirm_plan_page/widgets/confirom_plan_card.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/no_connection_error_page.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/vendor_store/vendor_store.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/shimmers/extra_creditspage_shimmer.dart';

class ConfirmPlanPage extends StatefulWidget {
  const ConfirmPlanPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPlanPage> createState() => _ConfirmPlanPageState();
}

class _ConfirmPlanPageState extends State<ConfirmPlanPage> {
  final VendorStore _vendorStore = locator.get<VendorStore>();
  final AuthStore _authStore = locator.get<AuthStore>();

  bool _hasCallSupport = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authStore.getContactAdmin();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      if (_authStore.contactAdminState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(
          onTap: () {
            _authStore.getContactAdmin();
          },
        );
      }
      return Scaffold(
          appBar: CommonAppBar(
            color: Colors.white,
            showLeading: true,
            elevation: 0,
            name: '',
            onTapLeading: () {
              // _onBackButtonTap(context);
              Navigator.pop(context);
            },
          ),
          body: Observer(builder: (context) {
            if (_authStore.contactAdminState == LoadingStatusEnum.loading) {
              return ExtraCreditsPageShimmer();
            }

            if (_authStore.adminContactDetails == null) {
              return Container(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: Text(
                    AppTranslations.of(context)!
                        .text('GENERAL', 'NO DATA FOUND'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  )));
            }

            // if (_authStore.contactAdminState == LoadingStatusEnum.error) {
            //   return Container(
            //       padding: EdgeInsets.only(left: 30.w, right: 30.w),
            //       height: MediaQuery.of(context).size.height,
            //       child: Center(
            //           child: Text(
            //         'Something went wrong , Please Check Your Internet Connection',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(color: Colors.black),
            //       )));
            // }

            return SingleChildScrollView(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: ConfirmPlanCard(
                        name: _vendorStore.selectedPlan?.name == null
                            ? ''
                            : _vendorStore.selectedPlan!.name,
                        price: _vendorStore.selectedPlan?.price == null
                            ? null
                            : _vendorStore.selectedPlan!.price,
                        currencyCode: _authStore.currencyCode,
                        credits: _vendorStore.selectedPlan?.credits == null
                            ? null
                            : _vendorStore.selectedPlan!.credits,
                        durationType:
                            _vendorStore.selectedPlan?.durationType == null
                                ? ''
                                : _vendorStore.selectedPlan!.durationTypeName,
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: WebsafeSvg.asset('assets/images/call_large.svg')),
                  Text(
                    AppTranslations.of(context)!
                        .text('EXTRA CREDITS', 'CONTACT ADMIN'),
                    style: TextStyle(
                        color: MainTheme.blackypeColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        shadows: const [
                          Shadow(
                              color: MainTheme.blackypeColor, blurRadius: 0.5)
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250.w,
                        margin: EdgeInsets.only(top: 4.h),
                        child: Text(
                          AppTranslations.of(context)!
                              .text('EXTRA CREDITS', 'TO PROCEED'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MainTheme.greyTypeColor,
                              fontSize: 12.sp,
                              height: 1.8,
                              shadows: const [
                                Shadow(
                                    color: MainTheme.greyTypeColor,
                                    blurRadius: 0.4)
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 58.h,
                  ),
                  Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: MainTheme.blueTypeFiveColor,
                                radius: 25.sp,
                                child: WebsafeSvg.asset(
                                    'assets/images/user_large.svg'),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  _authStore.adminContactDetails?.value.name ==
                                          null
                                      ? ""
                                      : _authStore
                                          .adminContactDetails!.value.name!,
                                  style: TextStyle(
                                      color: MainTheme.blackypeColor,
                                      fontSize: 13.sp),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 62.h,
                            margin: EdgeInsets.only(left: 69.w, right: 69.w),
                            child: VerticalDivider(
                              color: MainTheme.blueTypeFiveColor,
                              thickness: 2,
                              width: 2.w,
                              indent: 5,
                              endIndent: 10,
                            ),
                          ),
                          InkWell(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                _authStore.adminContactDetails?.value.phone ==
                                        null
                                    ? () {}
                                    : _makePhoneCall(
                                        "${_authStore.countryCode}${_authStore.adminContactDetails!.value.phone!}");
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        MainTheme.blueTypeFiveColor,
                                    radius: 25.sp,
                                    child: WebsafeSvg.asset(
                                        'assets/images/call.svg'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: Text(
                                      _authStore.adminContactDetails?.value
                                                  .phone ==
                                              null
                                          ? ""
                                          : "${_authStore.countryCode}${_authStore.adminContactDetails!.value.phone!}",
                                      style: TextStyle(
                                          color: MainTheme.blackypeColor,
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 33.w, right: 33.w, bottom: 3.h),
            // height: 40.h,
            child: CommonButton(
              name: AppTranslations.of(context)!
                  .text('GENERAL', 'CONTINUE TO CART'),
              colorBtn: MainTheme.blueTypeOneColor,
              colorText: MainTheme.whiteTypeColor,
              textStyle: TextStyle(
                  color: MainTheme.whiteTypeColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
              height: 50.h,
              radius: BorderRadius.all(Radius.circular(30.sp)),
              onTap: () {
                goToCartPage();
              },
            ),
          ));
    });
  }

  /// This [goToCartPage] is used navigate to [cart_page]

  goToCartPage() {
    Navigator.pushNamedAndRemoveUntil(context, "/cart_page", (route) => false);
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/choose_plan_page",
    );

    return Future.value(false);
  }

  /// This [_makePhoneCall] fun is used to launch phone number in dial pad 

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
