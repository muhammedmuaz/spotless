import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class IndicatorCard extends StatefulWidget {
  final int? index;
  final int? pageIndex;

  // const IndicatorCard({super.key, this.index, this.pageIndex});

  const IndicatorCard({Key? key, this.index, this.pageIndex}) : super(key: key);

  @override
  State<IndicatorCard> createState() => _IndicatorCardState();
}

class _IndicatorCardState extends State<IndicatorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7.w,
      height: 7.h,
      margin: EdgeInsets.only(left: 7.w),
      decoration: BoxDecoration(
          color: widget.pageIndex == widget.index
              ? MainTheme.blueTypeOneColor
              : MainTheme.greyTypeOneColor,
          shape: BoxShape.circle),
    );
  }
}
