import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ChooseAddressCard extends StatefulWidget {
  final bool isActive;
  final String? phoneNo;
  final String? address;
  final String? streetName;
  final String? typeName;
  final Function? onTap;
  const ChooseAddressCard(
      {Key? key,
      this.isActive = false,
      this.typeName,
      this.onTap,
      this.phoneNo,
      this.address,
      this.streetName})
      : super(key: key);

  @override
  State<ChooseAddressCard> createState() => _ChooseAddressCardState();
}

class _ChooseAddressCardState extends State<ChooseAddressCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 103.h,
        padding: EdgeInsets.only(left: 10.w, top: 10.h),
        decoration: BoxDecoration(
          color: widget.isActive
              ? MainTheme.whiteTypeColor
              : MainTheme.greyTypeTwoColor,
          border: Border.all(
              color: widget.isActive
                  ? MainTheme.blueTypeOneColor
                  : Colors.transparent,
              width: 2.w),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebsafeSvg.asset('assets/images/location.svg'),
            Container(
              margin: EdgeInsets.only(left: 10.w, bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.typeName!,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h, bottom: 4.h),
                    width: 275.w,
                    // color: Colors.green,
                    child: Text(
                      widget.address != null && widget.streetName != null
                          ? "${widget.address!},${widget.streetName}"
                          : widget.address == null
                              ? widget.streetName == null
                                  ? ""
                                  : widget.streetName!
                              : widget.address!,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: MainTheme.greyTypeColor,
                          height: 1.5),
                    ),
                  ),
                  Text(widget.phoneNo!,
                      style: TextStyle(
                          fontSize: 12.sp, color: MainTheme.greyTypeColor))
                ],
              ),
            ),
            Container(
              height: 23.h,
              width: 23.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: widget.isActive
                          ? MainTheme.blueTypeOneColor
                          : MainTheme.greyTypeColor,
                      width: widget.isActive ? 4.w : 2.w),
                  color: MainTheme.whiteTypeColor),
            )
          ],
        ),
      ),
    );
  }
}
