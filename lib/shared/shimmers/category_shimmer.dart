import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/register_page/widgets/city_fields.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

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
              GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 18,
                      crossAxisCount: 3,
                      mainAxisSpacing: 18,
                      childAspectRatio:
                          MediaQuery.of(context).size.aspectRatio * 2.9 / 1.38),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 50.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.sp))),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
