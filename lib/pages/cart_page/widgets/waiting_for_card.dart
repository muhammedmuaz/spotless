import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../app_localizations.dart';

class WaitingForCard extends StatefulWidget {
  WaitingForCard({Key? key}) : super(key: key);

  @override
  State<WaitingForCard> createState() => _WaitingForCardState();
}

class _WaitingForCardState extends State<WaitingForCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 136.h,
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            child: Container(
              width: MediaQuery.of(context).size.width - 30.w,
              padding: EdgeInsets.only(top: 15.h, left: 15.w),
              height: 108.h,
              decoration: BoxDecoration(
                  color: MainTheme.greyTypeTwoColor,
                  borderRadius: BorderRadius.all(Radius.circular(12.sp))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTranslations.of(context)!
                        .text('MY CART', 'WAITING APPROVAL'),
                    style: TextStyle(
                        color: MainTheme.blackypeColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    AppTranslations.of(context)!.text('MY CART', 'KINDLY STAY'),
                    style: TextStyle(
                        color: MainTheme.blackypeColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: 115.w,
                    margin: EdgeInsets.only(top: 11.h),
                    // height: 40.h,
                    child: CommonButton(
                      name: AppTranslations.of(context)!
                          .text('MY CART', 'VIEW DETAILS'),
                      colorBtn: MainTheme.blueTypeOneColor,
                      colorText: MainTheme.whiteTypeColor,
                      textStyle: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                      height: 26.h,
                      radius: BorderRadius.all(Radius.circular(30.sp)),
                      onTap: () {
                        // widget.onTap!();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset('assets/images/sand_clock.png', height: 143.h),
          ),
        ],
      ),
    );
  }
}
