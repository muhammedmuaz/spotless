import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spotless/pages/home_page/widgets/header_card.dart';
import 'package:spotless/pages/referral_page/widgets/step_indicater.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../locator.dart';
import '../../store/vendor_store/vendor_store.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({Key? key}) : super(key: key);

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  final VendorStore _vendorStore = locator.get<VendorStore>();
  final AuthStore _authStore = locator.get<AuthStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vendorStore.getReferralPoints();
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
          elevation: 0,
          leadingWidth: 80.w,
          leadingPadding: const EdgeInsets.all(5),
          name: AppTranslations.of(context)!.text('REFERRAL', 'REFERRAL'),
          showAction: true,
          onTapAction: () {},
          actionIcon: Observer(builder: (context) {
            if (_vendorStore.referralPointsState == LoadingStatusEnum.loading) {
              return Container();
            }

            if (_vendorStore.referralPointsState == LoadingStatusEnum.error) {
              return Container();
            }

            if (_vendorStore.userReferralPoints == null) {
              return Container();
            }

            return Container(
              margin: EdgeInsets.only(right: 11.23.w),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 3.w),
                    child: Text(
                      _vendorStore.userReferralPoints!.value.data == 0 ||
                              _vendorStore.userReferralPoints!.value.data ==
                                  null
                          ? "0"
                          : "${_vendorStore.userReferralPoints!.value.data}",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blackypeColor),
                    ),
                  ),
                  WebsafeSvg.asset('assets/images/verify.svg')
                ],
              ),
            );
          }),
          onTapLeading: () {
            _onBackButtonTap(context);
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10.w, bottom: 15.w),
                    child: Image.asset(
                      'assets/images/loud.png',
                      width: 200.w,
                      height: 200.h,
                    )),
              ],
            ),
            Text(
              AppTranslations.of(context)!.text('REFERRAL', 'REF AND EARN'),
              style: TextStyle(
                  color: MainTheme.blackypeColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.only(top: 7..h),
              child: Text(
                AppTranslations.of(context)!.text('REFERRAL', 'REFER'),
                style:
                    TextStyle(fontSize: 12.sp, color: MainTheme.greyTypeColor),
              ),
            ),
            InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Clipboard.setData(ClipboardData(
                      text: "${_authStore.appUser!.value.referralCode}"));
                  BotToast.showText(
                    text: AppTranslations.of(context)!
                        .text('REFERRAL', 'CLIPBOARD'),
                  );
                },
                child: Container(
                  width: 148.w,
                  height: 40.h,
                  margin: EdgeInsets.only(top: 20.h, bottom: 5.h),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: MainTheme.blackypeColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    _authStore.appUser!.value.referralCode == null
                        ? ""
                        : "${_authStore.appUser!.value.referralCode}",
                    style: TextStyle(
                        color: MainTheme.whiteTypeColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Text(
              AppTranslations.of(context)!.text('REFERRAL', 'COPY'),
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: MainTheme.greyTypeOneColor),
            ),
            SizedBox(
              height: 20.h,
            ),
            StepIndicatorCard(
                index: 1,
                text: AppTranslations.of(context)!
                    .text('REFERRAL', 'INVITE FRIENDS'),
                color: MainTheme.maroonTypeOneColor,
                isEnd: false),
            StepIndicatorCard(
                index: 2,
                text: AppTranslations.of(context)!.text('REFERRAL', 'DOWNLOAD'),
                color: MainTheme.greenTypeColor,
                isEnd: false),
            StepIndicatorCard(
                index: 3,
                text: AppTranslations.of(context)!.text('REFERRAL', 'GET'),
                color: MainTheme.blueTypeOneColor,
                isEnd: true),
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.only(left: 35.w, right: 35.w),
          child: CommonButton(
            onTap: () {
              share();
            },
            name: AppTranslations.of(context)!.text('REFERRAL', 'INVITE'),
            textStyle: TextStyle(
                color: MainTheme.whiteTypeColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
            colorBtn: MainTheme.blueTypeOneColor,
            colorText: MainTheme.whiteTypeColor,
            height: 50.h,
            radius: BorderRadius.all(Radius.circular(25.sp)),
          ),
        ),
      ),
    );
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    // Navigator.pushReplacementNamed(
    //   context,
    //   "/referral_history_page",
    // );
    Navigator.pop(context);
    return Future.value(false);
  }

  /// This [share] fun is used to share the app url to other app

  Future<void> share() async {
    await Share.share(
      'check out my website https://example.com',
      subject: 'Look what I made!',
    );
  }
}
