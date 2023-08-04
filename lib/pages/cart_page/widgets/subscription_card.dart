import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

import '../../../app_localizations.dart';

class SubscriptionCard extends StatefulWidget {
  final String? subscriptionName;
  final String? subscriptionCode;
  final String? dateOfValidity;
  final String? totalQty;
  final String? usedQty;
  final String? reminningQty;
  const SubscriptionCard(
      {Key? key,
      this.dateOfValidity,
      this.reminningQty,
      this.subscriptionCode,
      this.subscriptionName,
      this.totalQty,
      this.usedQty})
      : super(key: key);

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.only(left: 15.w, right: 13.5.w, top: 13.5.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: MainTheme.blackypeColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subscriptionName ?? "",
                    style: TextStyle(
                        color: MainTheme.whiteTypeColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Text(
                        widget.dateOfValidity == null
                            ? ""
                            : "${AppTranslations.of(context)!.text('MY CART', 'VALID TIll')} : ${widget.dateOfValidity}",
                        style: TextStyle(
                            color: MainTheme.greyTypeThreeColor,
                            fontSize: 10.sp),
                      )) //
                ],
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    height: 21.h,
                    decoration: BoxDecoration(
                        color: MainTheme.blueTypeOneColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.sp))),
                    alignment: Alignment.center,
                    child: Text(
                      widget.subscriptionCode ?? "",
                      maxLines: 1,
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .6)
                          ],
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 36.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      AppTranslations.of(context)!.text('MY CART', 'TOTAL QTY'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .3)
                          ]),
                    ),
                    Container(
                        width: 90.w,
                        child: Text(
                          widget.totalQty != null
                              ? "${widget.totalQty} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}"
                              : "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MainTheme.whiteTypeColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                SizedBox(
                  height: 42.h,
                  child: VerticalDivider(
                    color: MainTheme.greyTypeThreeColor,
                    thickness: 2,
                    width: 2.w,
                    indent: 5,
                    endIndent: 10,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      AppTranslations.of(context)!.text('MY CART', 'USED QTY'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .3)
                          ]),
                    ),
                    Container(
                        width: 90.w,
                        child: Text(
                          widget.usedQty == null
                              ? ""
                              : "${widget.usedQty} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MainTheme.whiteTypeColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                SizedBox(
                  height: 42.h,
                  child: VerticalDivider(
                    color: MainTheme.greyTypeThreeColor,
                    thickness: 2,
                    width: 2.w,
                    indent: 5,
                    endIndent: 10,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      AppTranslations.of(context)!
                          .text('MY CART', 'REMAINNING QTY'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .3)
                          ]),
                    ),
                    Container(
                        width: 90.w,
                        child: Text(
                          widget.reminningQty == null
                              ? ""
                              : "${widget.reminningQty} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MainTheme.whiteTypeColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
