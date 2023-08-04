import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ExpiresCardShimmer extends StatefulWidget {
  const ExpiresCardShimmer({Key? key}) : super(key: key);

  @override
  State<ExpiresCardShimmer> createState() => _ExpiresCardShimmerState();
}

class _ExpiresCardShimmerState extends State<ExpiresCardShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 12.h),
          height: 138.h,
          padding: EdgeInsets.only(top: 13.5.h),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.white),
        ));
  }
}
