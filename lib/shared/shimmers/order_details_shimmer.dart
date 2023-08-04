import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../pages/order_details_page/widgets/order_item_card.dart';

class OrderDetailsShimmer extends StatefulWidget {
  const OrderDetailsShimmer({Key? key}) : super(key: key);

  @override
  State<OrderDetailsShimmer> createState() => _OrderDetailsShimmerState();
}

class _OrderDetailsShimmerState extends State<OrderDetailsShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    width: 100.w,
                    height: 20.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 26.h,
                  child: ListView.builder(
                    itemCount: 9,
                    padding: EdgeInsets.only(left: 3.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return OrderItemCard(
                        oderStatus: 3,
                        index: index,
                        isEnd: index == 9 ? true : false,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 20.5.h,
                      ),
                      child: WebsafeSvg.asset('assets/images/pending.svg',
                          width: 200.w, height: 200.h),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 100.w,
                    height: 15.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                  )
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Container(
                    width: 150.w,
                    height: 20.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                  )
                ]),
                SizedBox(
                  height: 20.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 10.h,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  width: 50.w,
                                  height: 10.h,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 2.h,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 20.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 20.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ]),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: MediaQuery.of(context).size.width,
                  height: 150.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            )));
  }
}
