import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

import '../../../app_localizations.dart';

class ConfirmPlanCard extends StatefulWidget {
  final String? name;
  final double? credits;
  final double? price;
  final double? duration;
  final String? description;
  final String? currencyCode;
  final String? durationType;

  const ConfirmPlanCard({
    Key? key,
    this.credits,
    this.description,
    this.duration,
    this.name,
    this.price,
    this.currencyCode,
    this.durationType,
  }) : super(key: key);

  @override
  State<ConfirmPlanCard> createState() => _ConfirmPlanCardState();
}

class _ConfirmPlanCardState extends State<ConfirmPlanCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.h,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.only(
        top: 11.h,
        left: 15.w,
        right: 15.w,
      ),
      decoration: BoxDecoration(
          color: MainTheme.greyTypeTwoColor,
          border: Border.all(color: Colors.transparent, width: 2.w),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.name == null ? "" : widget.name!,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: MainTheme.greyTypeColor),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 11.5.h, bottom: 9.h),
            child: Text(
              widget.price == null
                  ? ""
                  : "${widget.currencyCode} ${widget.price} /${widget.durationType}",
              style: TextStyle(
                  color: MainTheme.blackypeColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  shadows: const [
                    BoxShadow(color: MainTheme.blackypeColor, blurRadius: .5)
                  ]),
            ),
          ),
          Row(
            children: [
              Container(
                height: 28.h,
                margin: EdgeInsets.only(bottom: 10.5.h),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: MainTheme.blueTypethreeColor),
                child: Container(
                    padding: EdgeInsets.only(left: 5.h, top: 2.h, right: 5.w),
                    child: Text(
                      widget.credits == null
                          ? ""
                          : " ${widget.credits} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: MainTheme.blueTypeOneColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp),
                    )),
              ),
            ],
          ),

          //  AppTranslations.of(context)!
          //               .text('GENERAL', 'CONTACT ADMIN'),
          Text(
            widget.price == null
                ? ""
                : "${AppTranslations.of(context)!.text('EXTRA CREDITS', 'THEN')}, \$${widget.price} ${AppTranslations.of(context)!.text('EXTRA CREDITS', 'PER')} ${widget.durationType}. ${AppTranslations.of(context)!.text('EXTRA CREDITS', 'CANCEL ANY')}",
            style: TextStyle(
                color: MainTheme.greyTypeColor,
                fontSize: 12.sp,
                shadows: const [
                  BoxShadow(color: MainTheme.blackypeColor, blurRadius: .5)
                ]),
          )
        ],
      ),
    );
  }
}
