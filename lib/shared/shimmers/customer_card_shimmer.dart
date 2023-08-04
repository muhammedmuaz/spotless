import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomerCardShimmer extends StatefulWidget {
  const CustomerCardShimmer({Key? key}) : super(key: key);

  @override
  State<CustomerCardShimmer> createState() => _CustomerCardShimmerState();
}

class _CustomerCardShimmerState extends State<CustomerCardShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 12.h),
          height: 270.h,
          padding: EdgeInsets.only(top: 13.5.h),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.white),
        ));
  }
}
