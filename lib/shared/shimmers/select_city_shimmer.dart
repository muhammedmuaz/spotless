import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/register_page/widgets/city_fields.dart';

class SelectCityShimmer extends StatelessWidget {
  const SelectCityShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                width: 300.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                width: 200.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                width: 300.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                width: 200.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                width: 300.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
