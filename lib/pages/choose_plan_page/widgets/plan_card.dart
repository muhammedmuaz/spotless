import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

import '../../../app_localizations.dart';

class PlanCard extends StatefulWidget {
  final Function? onTap;
  final String? name;
  final double? credits;
  final double? price;
  final double? duration;
  final String? description;
  final String? currencyCode;
  final String? durationType;
  final bool isSelected;

  const PlanCard(
      {Key? key,
      this.onTap,
      this.credits,
      this.description,
      this.duration,
      this.name,
      this.price,
      this.currencyCode,
      this.durationType,
      this.isSelected = false})
      : super(key: key);

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150.h,
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.only(
          top: 11.h,
          left: 15.w,
          right: 15.w,
        ),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? MainTheme.whiteTypeColor
                : MainTheme.greyTypeTwoColor,
            border: Border.all(
                color: widget.isSelected
                    ? MainTheme.blueTypeOneColor
                    : Colors.transparent,
                width: 2.w),
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
                Container(
                  height: 23.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: widget.isSelected
                              ? MainTheme.blueTypeOneColor
                              : MainTheme.greyTypeColor,
                          width: widget.isSelected ? 6.w : 3.w),
                      color: MainTheme.whiteTypeColor),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 11.h, bottom: 9.h),
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
            Row(children: [
              Container(
                height: 28.h,
                margin: EdgeInsets.only(bottom: 10.5.h),
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: MainTheme.blueTypethreeColor),
                alignment: Alignment.center,
                child: Text(
                  widget.credits == null
                      ? ""
                      : "${widget.credits} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: MainTheme.blueTypeOneColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp),
                ),
              ),
            ]),
            Text(
              widget.price == null
                  ? ""
                  : "${AppTranslations.of(context)!.text('CHOOSE A PLAN', 'THEN')} \$${widget.price} ${AppTranslations.of(context)!.text('CHOOSE A PLAN', 'PER')} ${widget.durationType}. ${AppTranslations.of(context)!.text('CHOOSE A PLAN', 'CANCEL ANYTIME')}",
              style: TextStyle(
                  color: MainTheme.greyTypeColor,
                  fontSize: 12.sp,
                  shadows: const [
                    Shadow(color: MainTheme.greyTypeColor, blurRadius: 0.5)
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
