import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class ServiceCategoryCard extends StatefulWidget {
  final String? name;
  final int? index;
  // final int? selectedIndex;
  final bool isActive;

  final Function? onTap;
  const ServiceCategoryCard(
      {Key? key,
      this.name,
      this.index,
      // this.selectedIndex,
      this.onTap,
      this.isActive = false})
      : super(key: key);

  @override
  State<ServiceCategoryCard> createState() => _ServiceCategoryCardState();
}

class _ServiceCategoryCardState extends State<ServiceCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        margin: EdgeInsets.only(right: 5.w),
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 8.h, bottom: 8.h),
        decoration: BoxDecoration(
            color: widget.isActive
                ? MainTheme.blueTypeOneColor
                : MainTheme.greyTypeTwoColor,
            borderRadius: const BorderRadius.all(Radius.circular(23))),
        child: Text(
          widget.name!,
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: widget.isActive
                  ? MainTheme.whiteTypeColor
                  : MainTheme.blackTypeColor),
        ),
      ),
    );
  }
}
