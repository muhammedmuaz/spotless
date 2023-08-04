import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../app_localizations.dart';

class CreditsCard extends StatefulWidget {
  final String? name;
  final String? value;
  final String? point;
  final Function? onTapCredits;
  const CreditsCard({Key? key, this.name, this.value = "", this.onTapCredits,this.point})
      : super(key: key);

  @override
  State<CreditsCard> createState() => _CreditsCardState();
}

class _CreditsCardState extends State<CreditsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onTapCredits!();
        },
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: MainTheme.greyTypeTwoColor,
            ),
            padding: EdgeInsets.only(
                left: 10.w, top: 10.h, right: 10.w, bottom: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Text(
                    widget.value ?? "10",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                        color: MainTheme.blackypeColor),
                  ),
                ),
                Container(
                  child: Text(
                    widget.name ?? "",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MainTheme.blackypeColor),
                  ),
                ),
                Row(children: [
                  Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: MainTheme.blackypeColor,
                      ),
                      padding: EdgeInsets.only(
                          left: 10.w, right: 5.w, bottom: 5.h, top: 5.h),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 5.w),
                              child: Text(
                                "${AppTranslations.of(context)!.text('REFERRAL', 'GET USING')} ${widget.point}",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MainTheme.whiteTypeColor),
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              child: WebsafeSvg.asset(
                                "assets/images/Vector.svg",
                                width: 15,
                                height: 15,
                              ))
                        ],
                      ))
                ])
              ],
            )));
  }
}
