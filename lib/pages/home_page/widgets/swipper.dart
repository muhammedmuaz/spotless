import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/model/product/product.model.dart';
import 'package:spotless/shared/theme/theme.dart';

class CardSwipper extends StatefulWidget {
  final List<BannersModel>? banerList;

  const CardSwipper({Key? key, this.banerList}) : super(key: key);

  @override
  State<CardSwipper> createState() => _CardSwipperState();
}

class _CardSwipperState extends State<CardSwipper> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Swiper(
        loop: false,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(right: 30.w),
                  height: 202.h,
                  decoration: const BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Image.network(
                      'https://prod-cdn.laundryheap.com/assets/logo-full-vertical-6fe0f36e934fadf4f7bbad16c53ae903c46083b7d5ce445cdb2f07cb71f85b09.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            ],
          );
        },
        onIndexChanged: (int index) {
          setState(() {
            // currentIndex = index + 1;
          });
        },
        itemCount: 5,
        viewportFraction: .94,
        scale: .9,
        pagination: SwiperPagination(
            builder: SwiperCustomPagination(builder: (context, config) {
          return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 11.h),
                height: 10,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.banerList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    currentIndex = index + 1;
                    return config.activeIndex == index
                        ? Container(
                            margin: EdgeInsets.only(right: 7.w),
                            child: CircleAvatar(
                              radius: 3.5.sp,
                              backgroundColor: MainTheme.blueTypeOneColor,
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(right: 7.w),
                            child: CircleAvatar(
                                radius: 3.5.sp,
                                backgroundColor: MainTheme.greyTypeOneColor),
                          );
                  },
                ),
              ));
        })));
  }
}
