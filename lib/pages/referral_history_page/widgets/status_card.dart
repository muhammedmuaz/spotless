import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:spotless/shared/theme/theme.dart';

import '../../../app_localizations.dart';

class StatusCard extends StatefulWidget {
  final int? type;
  final int? mediumType;
  final int? itemStatus;
  // final bool isCredited;
  final String? status;
  final DateTime? date;
  final String? description;
  final int? point;
  final String? value;
  final String? credit;

  const StatusCard(
      {Key? key,
      this.mediumType,
      this.value,
      this.itemStatus,
      this.type,
      this.date,
      this.description,
      this.point,
      this.status,
      this.credit})
      : super(key: key);

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  String? formattedDate(DateTime item) {
    DateFormat _dateFormat = DateFormat('dd-mm-yyyy');
    return _dateFormat.format(item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${AppTranslations.of(context)!.text('REFERRAL', 'STATUS')}: ",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: MainTheme.blackypeColor),
                  ),
                  Text(widget.status!,
                      // AppTranslations.of(context)!
                      //         //     .text('REFERRAL', 'CREDITED'),
                      //  AppTranslations.of(context)!
                      //             .text('REFERRAL', 'REDEEMED'),
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: widget.type == 1
                              ? MainTheme.greenTypeColor
                              : MainTheme.redTypeColor)),
                  widget.type == 1
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(left: 8.w), child: getIcon())
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h, bottom: 4.5.h),
                child: Text(
                  widget.date == null ? "" : "${formattedDate(widget.date!)}",
                  style: TextStyle(
                      fontSize: 10.sp, color: MainTheme.greyTypeColor),
                ),
              ),
              Text(
                widget.description ?? "",
                style:
                    TextStyle(fontSize: 10.sp, color: MainTheme.blackypeColor),
              )
            ],
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  widget.point == null
                      ? widget.credit == null
                          ? "0 ${AppTranslations.of(context)!.text('REFERRAL', 'POINT')}"
                          : "${widget.credit} ${AppTranslations.of(context)!.text('REFERRAL', 'POINT')}"
                      : "${widget.point} ${AppTranslations.of(context)!.text('REFERRAL', 'POINT')}",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: widget.type == 1
                          ? MainTheme.greenTypeColor
                          : MainTheme.redTypeColor)),
              Container(
                margin: EdgeInsets.only(top: 2.h, bottom: 4.5.h),
                child: Text(
                  widget.type == 3
                      ? "XAR ${widget.value}"
                      : widget.type == 2
                          ? "${widget.value} CREDITS"
                          : "",
                  style: TextStyle(
                      fontSize: 10.sp, color: MainTheme.greyTypeColor),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget? getIcon() {
    if (widget.type == 3 && widget.itemStatus == 0) {
      return Image.asset("assets/images/clock_redeem.png");
    } else if (widget.type == 3 && widget.itemStatus == 1) {
      return Image.asset("assets/images/tick_redeem.png");
    } else if (widget.type == 2 && widget.itemStatus == 1) {
      return Image.asset("assets/images/tick_redeem.png");
    }
  }
}
