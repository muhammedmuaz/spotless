import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/register_page/widgets/city_fields.dart';

class ExtraCreditsPageShimmer extends StatelessWidget {
  const ExtraCreditsPageShimmer({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  radius: 80.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                width: 200.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                width: 300.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.h),
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25.sp,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: 60.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ],
                      )),
                      Container(
                        height: 70,
                        width: 2,
                        color: Colors.white,
                      ),
                      Container(
                          child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25.sp,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: 60.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ],
                      ))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
