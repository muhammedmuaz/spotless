import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/app_localizations.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';

class CheckoutSucessPage extends StatefulWidget {
  const CheckoutSucessPage({Key? key}) : super(key: key);

  @override
  State<CheckoutSucessPage> createState() => _CheckoutSucessPageState();
}

class _CheckoutSucessPageState extends State<CheckoutSucessPage> {
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
            showLeading: true,
            leadingWidth: 80.w,
            leadingPadding: const EdgeInsets.all(5),
            elevation: 0,
            name: '',
            onTapLeading: () {
              _onBackButtonTap(context);
            },
          ),
          body: Column(
            children: [
              SizedBox(
                height: 120.h,
              ),
              Image.asset('assets/images/sucess.gif'),
              SizedBox(
                height: 55.h,
              ),
              Text(
                AppTranslations.of(context)!.text('SUCCESS', 'SUCCESS'),
                style: TextStyle(
                    fontSize: 18.sp,
                    color: MainTheme.blackypeColor,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(top: 11.5.h),
                width: 200.w,
                child: Text(
                  AppTranslations.of(context)!
                      .text('SUCCESS', 'PLACED SUCCESSFULLY'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: MainTheme.greyTypeColor,
                      height: 1.5),
                ),
              )
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
                goToHomePage();
              },
            ),
          ),
        ));
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
    return Future.value(false);
  }

  /// This [goToHomePage] is used navigate to [home_page]

  goToHomePage() {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
  }
}
