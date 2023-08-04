import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OrderShimmer extends StatefulWidget {
  const OrderShimmer({Key? key}) : super(key: key);

  @override
  State<OrderShimmer> createState() => _OrderShimmerState();
}

class _OrderShimmerState extends State<OrderShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 12.h),
            height: 94.h,
            padding: EdgeInsets.only(top: 13.5.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
