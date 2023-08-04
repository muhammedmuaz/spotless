import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/no_connection_error_page.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/shimmers/extra_creditspage_shimmer.dart';
import '../../store/auth_store/auth_store.dart';

class ExtarCreditPage extends StatefulWidget {
  const ExtarCreditPage({Key? key}) : super(key: key);

  @override
  State<ExtarCreditPage> createState() => _ExtarCreditPageState();
}

class _ExtarCreditPageState extends State<ExtarCreditPage> {
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
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (context) {
      if (_authStore.contactAdminState == LoadingStatusEnum.loading) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: MainTheme.whiteTypeColor,
              elevation: 0,
              leading: Container(),
              leadingWidth: 0,
              automaticallyImplyLeading: false,
            ),
            body: ExtraCreditsPageShimmer());
      }
      if (_authStore.contactAdminState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(onTap: () {
          _authStore.getContactAdmin();
        });
      }

      return Scaffold(
        appBar: CommonAppBar(
          color: Colors.white,
          showLeading: true,
          leadingWidth: 80.w,
          leadingPadding: const EdgeInsets.all(5),
          elevation: 0,
          name: AppTranslations.of(context)!
              .text('EXTRA CREDITS', 'EXTRA CREDITS'),
          onTapLeading: () {
            _onBackButtonTap(context);
          },
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 12.h, bottom: 15.h),
                child: WebsafeSvg.asset('assets/images/call_large.svg')),
            Text(
              AppTranslations.of(context)!
                  .text('EXTRA CREDITS', 'CONTACT ADMIN'),
              style: TextStyle(
                  color: MainTheme.blackypeColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(color: MainTheme.blackypeColor, blurRadius: 0.5)
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300.w,
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text(
                    AppTranslations.of(context)!
                        .text('EXTRA CREDITS', 'TO BUY EXTRA'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: MainTheme.greyTypeColor,
                        fontSize: 12.sp,
                        height: 1.5,
                        shadows: const [
                          Shadow(
                              color: MainTheme.greyTypeColor, blurRadius: 0.4)
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: MainTheme.blueTypeFiveColor,
                          radius: 25.sp,
                          child:
                              WebsafeSvg.asset('assets/images/user_large.svg'),
                        ),
                        Container(
                          width: 80.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: Text(
                            _authStore.adminContactDetails?.value.name == null
                                ? ""
                                : _authStore.adminContactDetails!.value.name!,
                            textAlign: TextAlign.center,
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
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          _authStore.adminContactDetails?.value.phone == null
                              ? () {}
                              : _makePhoneCall(
                                  "${_authStore.countryCode}${_authStore.adminContactDetails!.value.phone!}");
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: MainTheme.blueTypeFiveColor,
                              radius: 25.sp,
                              child: WebsafeSvg.asset('assets/images/call.svg'),
                            ),
                            Container(
                              width: 80.w,
                              margin: EdgeInsets.only(top: 10.h),
                              child: Text(
                                _authStore.adminContactDetails?.value.phone ==
                                        null
                                    ? ""
                                    : "${_authStore.countryCode}${_authStore.adminContactDetails!.value.phone!}",
                                textAlign: TextAlign.center,
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
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,

          margin: EdgeInsets.only(left: 33.w, right: 33.w, bottom: 10.h),
          // height: 40.h,
          child: CommonButton(
            name: AppTranslations.of(context)!.text('SUCCESS', 'BACK'),
            colorBtn: MainTheme.blueTypeOneColor,
            colorText: MainTheme.whiteTypeColor,
            textStyle: TextStyle(
                color: MainTheme.whiteTypeColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
            height: 50.h,
            radius: BorderRadius.all(Radius.circular(30.sp)),
            onTap: () {
              goToHome();
              // goToCartPage();
            },
          ),
        ),
      );
    }));
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  _onBackButtonTap(context) {
    Navigator.pushNamed(context, '/profile_page');
  }

  /// This [goToHome] is used navigate to [home_page]

  goToHome() {
    Navigator.pushNamed(context, '/home_page');
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
