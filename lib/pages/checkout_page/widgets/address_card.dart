import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class AddressCard extends StatefulWidget {
  final String? typeName;
  final String? phoneNo;
  final String? address;
  final String? streetName;
  const AddressCard(
      {Key? key, this.typeName, this.phoneNo, this.address, this.streetName})
      : super(key: key);

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 101.h,
      padding: EdgeInsets.only(left: 10.w, top: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MainTheme.greyTypeTwoColor),
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
          )
        ],
      ),
    );
  }
}
