import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:spotless/shared/theme/theme.dart';

class OrderCard extends StatefulWidget {
  final int? index;
  final Function? onTap;
  final String? orderNumber;
  final DateTime? orderDate;
  final int? totalQty;
  final String? status;
  final Color? color;

  const OrderCard({
    Key? key,
    this.index,
    this.onTap,
    this.orderDate,
    this.orderNumber,
    this.totalQty,
    this.status,
    this.color,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String? formattedDate(DateTime item) {
    DateFormat _dateFormat = DateFormat('MMM d , hh:mm aaa');
    return _dateFormat.format(item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 15.h),
        height: 94.h,
        padding: EdgeInsets.only(left: 10.w, top: 10.h),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: MainTheme.greyTypeTwoColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.orderNumber ?? "",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      shadows: const [
                        BoxShadow(
                            color: MainTheme.blackypeColor, blurRadius: .3)
                      ],
                      color: MainTheme.blackypeColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.h, bottom: 11.h),
                  child: Text(
                    formattedDate(widget.orderDate!) ?? "",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: MainTheme.greyTypeColor,
                      shadows: const [
                        BoxShadow(
                            color: MainTheme.greyTypeColor, blurRadius: .3)
                      ],
                    ),
                  ),
                ),
                Text(
                  widget.totalQty == null
                      ? "Total QTY : 12"
                      : "Total QTY : ${widget.totalQty}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: MainTheme.greyTypeColor,
                    shadows: const [
                      BoxShadow(color: MainTheme.greyTypeColor, blurRadius: .5)
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: 89.w,
              height: 19.h,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      bottomLeft: Radius.circular(10.sp))),
              padding: EdgeInsets.only(left: 10.w, top: 2.h, bottom: 2.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 70.w,
                    // color: Colors.red,
                    child: Text(
                      widget.status!,
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
