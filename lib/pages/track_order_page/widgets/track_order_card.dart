import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class TrackOrderCard extends StatefulWidget {
  final String? name;
  final int? index;
  final int? step;
  final bool? isEnd;
  const TrackOrderCard({Key? key, this.name, this.index, this.step, this.isEnd})
      : super(key: key);

  @override
  State<TrackOrderCard> createState() => _TrackOrderCardState();
}

class _TrackOrderCardState extends State<TrackOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            widget.step! >= widget.index!
                ? CircleAvatar(
                    radius: 17.sp,
                    backgroundColor: MainTheme.blueTypeOneColor,
                    // child: Icon(
                    //   Icons.check,
                    //   size: 20.sp,
                    //   color: Colors.white,
                    // ),
                    child: WebsafeSvg.asset('assets/images/tick.svg',
                        width: 17.w, height: 13.h),
                  )
                : Container(
                    width: 34.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: MainTheme.blueTypeOneColor, width: 2.w)),
                  ),
            !widget.isEnd!
                ? widget.step! > widget.index!
                    ? RotatedBox(
                        quarterTurns: 0,
                        child: Container(
                          width: 3.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: MainTheme.blueTypeOneColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(2.sp),
                                  bottomRight: Radius.circular(2.sp))),
                        ),
                      )
                    : widget.step == widget.index!
                        ? RotatedBox(
                            quarterTurns: 0,
                            child: Column(
                              children: [
                                Container(
                                  width: 3.w,
                                  height: 13.h,
                                  decoration: BoxDecoration(
                                      color: MainTheme.blueTypeOneColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(2.sp),
                                          bottomRight: Radius.circular(2.sp))),
                                ),
                                Container(
                                  width: 3.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color:
                                          MainTheme.blueTypeOneTransparentColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(2.sp),
                                          bottomRight: Radius.circular(2.sp))),
                                ),
                              ],
                            ),
                          )
                        : RotatedBox(
                            quarterTurns: 0,
                            child: Container(
                              width: 3.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  color: MainTheme.blueTypeOneTransparentColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2.sp),
                                      bottomRight: Radius.circular(2.sp))),
                            ),
                          )
                : Container(),
            // !widget.isEnd!
            //     ? RotatedBox(
            //         quarterTurns: 0,
            //         child: Container(
            //           width: 3.w,
            //           height: 20.h,
            //           decoration: BoxDecoration(
            //               color: MainTheme.blueTypeOneTransparentColor),
            //         ),
            //       )
            //     : SizedBox.shrink(),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mar 21",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: widget.step! >= widget.index!
                        ? MainTheme.greyTypeColor
                        : MainTheme.blackTypeTransparentColor),
              ),
              Text(widget.name!,
                  style: widget.step! >= widget.index!
                      ? TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          shadows: const [
                            Shadow(
                                color: MainTheme.blackypeColor, blurRadius: .8)
                          ],
                          color: MainTheme.blackypeColor)
                      : TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: MainTheme.blackTypeTransparentColor))
            ],
          ),
        )
      ],
    );
  }
}
