import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class HeaderCard extends StatefulWidget {
  final String? name;
  final String? actionName;
  final Function? actionOnTap;
  final bool isMargin;

  const HeaderCard(
      {Key? key,
      this.name,
      this.actionName,
      this.isMargin = true,
      this.actionOnTap})
      : super(key: key);

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.isMargin
          ? EdgeInsets.only(left: 16.w, right: 16.w, bottom: 14.h)
          : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name!,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                shadows: const [
                  Shadow(color: MainTheme.blackypeColor, blurRadius: .5)
                ],
                color: MainTheme.blackypeColor),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              widget.actionOnTap!();
            },
            child: Text(
              widget.actionName!,
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  shadows: const [
                    Shadow(color: MainTheme.blueTypeOneColor, blurRadius: .5)
                  ],
                  color: MainTheme.blueTypeOneColor),
            ),
          )
        ],
      ),
    );
  }
}
