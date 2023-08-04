import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class CheckBoxWidget extends StatefulWidget {
  final bool isChecked;
  final String? label;
  final Function? onTap;
  const CheckBoxWidget(
      {Key? key, this.isChecked = false, this.label, this.onTap})
      : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
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
      child: Row(
        children: [
          Container(
              width: 18.w,
              height: 18.h,
              margin: EdgeInsets.only(right: 8.w),
              decoration: widget.isChecked
                  ? BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                      color: MainTheme.blueTypeOneColor)
                  : BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                      border: Border.all(color: MainTheme.blueTypeColor)),
              child: widget.isChecked
                  ? Icon(
                      Icons.check,
                      size: 10.sp,
                      color: MainTheme.whiteTypeColor,
                    )
                  : const SizedBox.shrink()),
          Text(
            widget.label!,
            style: TextStyle(
                color: MainTheme.blackypeColor,
                fontSize: 12.sp,
                shadows: const [
                  Shadow(
                    color: MainTheme.blackypeColor,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
