import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ActivePlanShimmer extends StatefulWidget {
  final double? height;
  const ActivePlanShimmer({Key? key, this.height}) : super(key: key);

  @override
  State<ActivePlanShimmer> createState() => _ActivePlanShimmerState();
}

class _ActivePlanShimmerState extends State<ActivePlanShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 12.h),
          height: widget.height ?? 145.h,
          padding: EdgeInsets.only(top: 13.5.h),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.white),
        ));
  }
}
