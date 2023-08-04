import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ManageAddressCard extends StatefulWidget {
  final String? typeName;
  final String? phoneNo;
  final String? address;
  final String? streetName;
  final Function? onTap;
  final bool isEditActive;
  const ManageAddressCard(
      {Key? key,
      this.typeName,
      this.onTap,
      this.phoneNo,
      this.address,
      this.streetName,
      this.isEditActive = true})
      : super(key: key);

  @override
  State<ManageAddressCard> createState() => _ManageAddressCardState();
}

class _ManageAddressCardState extends State<ManageAddressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 101.h,
        padding: EdgeInsets.only(left: 10.w, top: 10.h),
        decoration: BoxDecoration(
          color: MainTheme.greyTypeTwoColor,
          // border: Border.all(
          //     color: widget.selectedIndex == widget.index
          //         ? MainTheme.blueTypeOneColor
          //         : Colors.transparent,
          //     width: 2.w),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WebsafeSvg.asset('assets/images/location.svg'),
            Container(
              margin: EdgeInsets.only(left: 10.w, bottom: 5.h, right: 10.w),
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

            widget.isEditActive
                ? InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      widget.onTap!();
                    },
                    child: Text(
                      "EDIT",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blueTypeOneColor),
                    ),
                  )
                : Container()

            // Container(
            //   height: 23.h,
            //   width: 23.w,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       border: Border.all(
            //           color: widget.index == widget.selectedIndex
            //               ? MainTheme.blueTypeOneColor
            //               : MainTheme.greyTypeColor,
            //           width: widget.index == widget.selectedIndex ? 4.w : 2.w),
            //       color: MainTheme.whiteTypeColor),
            // )
          ],
        ));
  }
}
