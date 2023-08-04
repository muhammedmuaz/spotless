import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotless/shared/theme/theme.dart';

class CreditCardShimmer extends StatefulWidget {
  const CreditCardShimmer({Key? key}) : super(key: key);

  @override
  State<CreditCardShimmer> createState() => _CreditCardShimmerState();
}

class _CreditCardShimmerState extends State<CreditCardShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: MainTheme.greyTypeTwoColor,
                ),
                padding: EdgeInsets.only(
                    left: 10.w, top: 10.h, right: 10.w, bottom: 10.h),
              );
            }));
  }
}
