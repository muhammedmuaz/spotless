import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../app_localizations.dart';

class PointDisplayCard extends StatefulWidget {
  final int? pointValue;
  final Function? onTapRedeem;
  final String? btnName;
  final String? description;
  const PointDisplayCard(
      {Key? key,
      this.pointValue,
      this.onTapRedeem,
      this.btnName,
      this.description})
      : super(key: key);

  @override
  State<PointDisplayCard> createState() => _PointDisplayCardState();
}

class _PointDisplayCardState extends State<PointDisplayCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168.h,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
      padding: EdgeInsets.only(left: 15.w, top: 15.h, right: 10.w),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: MainTheme.blackypeColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTranslations.of(context)!.text('REFERRAL', 'YOUR'),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: MainTheme.whiteTypeColor),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 9.h,
                  bottom: 9.5.h,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 5.w),
                        child: WebsafeSvg.asset(
                          'assets/images/verify_white.svg',
                        )),
                    Text(
                      widget.pointValue == null
                          ? '0 ${AppTranslations.of(context)!.text('REFERRAL', 'POINT')}'
                          : "${widget.pointValue} ${AppTranslations.of(context)!.text('REFERRAL', 'POINT')}",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.whiteTypeColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 180.w,
                // color: Colors.blue,
                child: Text(
                  AppTranslations.of(context)!.text('REFERRAL', 'WOW'),
                  style: TextStyle(
                      fontSize: 10.sp,
                      height: 1.6,
                      color: MainTheme.greyTypeColor),
                ),
              ),
              InkWell(
                  onTap: () {
                    widget.onTapRedeem!();
                  },
                  child: Container(
                    width: 80.w,
                    height: 22.h,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        color: MainTheme.blueTypeOneColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.sp))),
                    alignment: Alignment.center,
                    child: Text(
                      widget.btnName ??
                          AppTranslations.of(context)!
                              .text('REFERRAL', 'REDEEM NOW'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .6)
                          ],
                          fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
          Container(
              margin: EdgeInsets.only(bottom: 15.h),
              child: Image.asset(
                'assets/images/referal.png',
                height: 128.h,
                width: 128.w,
              ))
        ],
      ),
    );
  }
}
