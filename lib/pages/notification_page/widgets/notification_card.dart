import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class NotificationCard extends StatefulWidget {
  final String? title;
  final String? date;
  final String? description;
  const NotificationCard({Key? key, this.date, this.description, this.title})
      : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 89.h,
      margin: EdgeInsets.only(bottom: 17.h),
      padding: EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w),
      decoration: const BoxDecoration(
          color: MainTheme.greyTypeTwoColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title ?? "",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    shadows: const [
                      BoxShadow(
                          color: MainTheme.blackTypeColor, spreadRadius: 1.5)
                    ],
                    color: MainTheme.blackypeColor),
              ),
              Text(
                widget.date ?? "",
                style:
                    TextStyle(color: MainTheme.greyTypeColor, fontSize: 10.sp),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 250.w,
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  widget.description ?? "",
                  style: TextStyle(
                      color: MainTheme.greyTypeThreeColor,
                      fontSize: 10.sp,
                      height: 1.6),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
