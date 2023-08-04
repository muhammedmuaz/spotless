import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CityFields extends StatefulWidget {
  final bool isActive;
  final Function? onTap;
  final String? name;
  CityFields({Key? key, this.isActive = false, this.onTap, this.name})
      : super(key: key);

  @override
  State<CityFields> createState() => _CityFieldsState();
}

class _CityFieldsState extends State<CityFields> {
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
        child: Container(
          margin: EdgeInsets.only(bottom: 30.h),
          child: Row(
            children: [
              widget.isActive
                  ? WebsafeSvg.asset("assets/images/city_ring_filled.svg")
                  : WebsafeSvg.asset("assets/images/city_ring.svg"),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  widget.name ?? '',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
              )
            ],
          ),
        ));
  }
}
