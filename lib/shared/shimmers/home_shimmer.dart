import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/register_page/widgets/city_fields.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 16.sp,
                    ),
                    CircleAvatar(
                      radius: 16.sp,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 13.h, bottom: 5.h, left: 16.w, right: 16.w),
                width: 100.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
                width: 150.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
                width: MediaQuery.of(context).size.width,
                height: 202.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: 20.h, bottom: 20.h, left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      Container(
                        width: 50.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(left: 16.w, right: 16.w),
                  width: MediaQuery.of(context).size.width,
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 75.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                      );
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(
                      top: 30.h, bottom: 20.h, left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      Container(
                        width: 50.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ],
                  )),
              Container(
                  margin:
                      EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 169.w,
                        height: 204.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      Container(
                        width: 169.w,
                        height: 204.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
