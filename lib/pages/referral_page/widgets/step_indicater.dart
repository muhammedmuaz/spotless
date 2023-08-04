import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class StepIndicatorCard extends StatefulWidget {
  final int? index;
  final String? text;
  final Color? color;
  final bool isEnd;

  const StepIndicatorCard(
      {Key? key, this.index, this.text, this.isEnd = false, this.color})
      : super(key: key);

  @override
  State<StepIndicatorCard> createState() => _StepIndicatorCardState();
}

class _StepIndicatorCardState extends State<StepIndicatorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: MediaQuery.of(context).size.width,
      // color: Colors.green,
      margin: EdgeInsets.only(
        left: 16.w,
      ),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            top: 0,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18.sp,
                  backgroundColor: widget.color,
                  child: Text(
                    widget.index!.toString(),
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: MainTheme.whiteTypeColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text!,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: MainTheme.blackypeColor,
                            shadows: const [
                              Shadow(
                                  color: MainTheme.blackypeColor,
                                  blurRadius: .4)
                            ]),
                      ),
                      Text(
                        "Just Share Your Link Or Code",
                        style: TextStyle(
                            fontSize: 12.sp, color: MainTheme.greyTypeColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          widget.isEnd
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: -11.h,
                  left: -3.w,
                  child: Container(
                    height: 58.h,
                    margin: EdgeInsets.only(
                      left: 20.w,
                    ),
                    child: VerticalDivider(
                      color: MainTheme.greyTypeFiveColor,
                      thickness: 2,
                      width: 2.w,
                      indent: 5,
                      endIndent: 10,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
