import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class OrderItemCard extends StatefulWidget {
  final int? oderStatus;
  final int? index;
  final bool isEnd;
  final Function? onTap;
  final Function? onDoubleTap;

  const OrderItemCard(
      {Key? key,
      this.isEnd = false,
      this.onTap,
      this.onDoubleTap,
      this.oderStatus,
      this.index})
      : super(key: key);

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.oderStatus! >= widget.index!
            ? CircleAvatar(
                radius: 12.sp,
                backgroundColor: MainTheme.blueTypeOneColor,
                child: WebsafeSvg.asset('assets/images/tick.svg',
                    width: 12.w, height: 8.h),
              )
            : Container(
                width: 23.w,
                height: 23.h,
                decoration: BoxDecoration(
                    color: MainTheme.whiteTypeColor,
                    border: Border.all(color: MainTheme.blueTypeOneColor),
                    shape: BoxShape.circle),
              ),
        !widget.isEnd
            ? widget.oderStatus! > widget.index!
                ? SizedBox(
                    width: 22.w,
                    child: const Divider(
                      color: MainTheme.blueTypeOneColor,
                      thickness: 2,
                    ))
                : widget.oderStatus == widget.index
                    ? Row(
                        children: [
                          Container(
                            width: 10.w,
                            height: 2.h,
                            decoration: const BoxDecoration(
                                color: MainTheme.blueTypeOneColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(2),
                                    bottomRight: Radius.circular(2))),
                          ),
                          SizedBox(
                              width: 10.w,
                              child: const Divider(
                                color: MainTheme.blueTypeOneTransparentColor,
                                thickness: 2,
                              ))
                        ],
                      )
                    : Row(
                        children: [
                          SizedBox(
                              width: 10.w,
                              child: const Divider(
                                color: MainTheme.blueTypeOneTransparentColor,
                                thickness: 2,
                              )),
                          SizedBox(
                              width: 7.w,
                              child: const Divider(
                                color: MainTheme.blueTypeOneTransparentColor,
                                thickness: 2,
                              ))
                        ],
                      )
            : Container()
      ],
    );
  }
}
