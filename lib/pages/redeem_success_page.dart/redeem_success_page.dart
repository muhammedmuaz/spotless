import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/routes.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../app_localizations.dart';
import '../../shared/widgets/app_bar.dart';

class RedeemSuccessPage extends StatefulWidget {
  final RedeemSuccessPageParam? item;
  RedeemSuccessPage({Key? key, this.item}) : super(key: key);
  @override
  State<RedeemSuccessPage> createState() => _RedeemSuccessPageState();
}

class _RedeemSuccessPageState extends State<RedeemSuccessPage> {
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
            name: '',
            onTapLeading: () {
              goToHomePage();
            },
          ),
          body: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                      margin: EdgeInsets.all(16.sp),
                      width: MediaQuery.of(context).size.width,
                      height: 165,
                      child: WebsafeSvg.asset("assets/images/redeem_card.svg")),
                  Positioned(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  widget.item?.value == null
                                      ? ""
                                      : widget.item!.value!,
                                  style: TextStyle(
                                      color: MainTheme.blueTypeOneColor,
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Container(
                                child: Text(
                                  widget.item?.type == null
                                      ? ""
                                      : widget.item!.type!,
                                  style: TextStyle(
                                      height: 0.2,
                                      color: MainTheme.whiteTypeColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ))),
                  Positioned(
                      right: 0,
                      bottom: 30,
                      child: Container(
                          margin: EdgeInsets.only(right: 30.w),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5.w),
                                child: Text(
                                  "${AppTranslations.of(context)!.text('REFERRAL', 'REDEEMED USING')} ${widget.item!.point}",
                                  style: TextStyle(
                                      color: MainTheme.whiteTypeColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                  child: WebsafeSvg.asset(
                                      "assets/images/check.svg"))
                            ],
                          )))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 700.h,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        AppTranslations.of(context)!.text('SUCCESS', 'SUCCESS'),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: MainTheme.blackTypeColor1),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 38.w, right: 38.w, top: 10.h),
                      child: Text(
                        widget.item?.message == null
                            ? ""
                            : widget.item!.message!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MainTheme.greyType1Color,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.only(left: 35.w, right: 35.w),
            child: CommonButton(
              onTap: () {
                goToHomePage();
              },
              name: AppTranslations.of(context)!.text('SUCCESS', 'BACK'),
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
        ));
  }

  /// This [goToHomePage] is used navigate to [home_page]

  goToHomePage() {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
    return Future.value(false);
  }
}
