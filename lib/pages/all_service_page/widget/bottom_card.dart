import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/common_button.dart';

import '../../../app_localizations.dart';

class BottomCard extends StatefulWidget {
  final String? itemCount;
  const BottomCard({Key? key, this.itemCount}) : super(key: key);
  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      color: MainTheme.whiteTypeColor,
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTranslations.of(context)!.text('ALL SERVICES', 'TOTAL'),
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: MainTheme.greyTypeFourColor),
              ),
              Text(
                widget.itemCount == null
                    ? "0"
                    : "${widget.itemCount} ${AppTranslations.of(context)!.text('ALL SERVICES', 'ITEMS')}",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: MainTheme.blueTypeOneColor),
              )
            ],
          ),
          SizedBox(
            width: 148.w,
            // height: 40.h,
            child: CommonButton(
              name: AppTranslations.of(context)!
                  .text('ALL SERVICES', 'VIEW CART'),
              colorBtn: MainTheme.blueTypeOneColor,
              colorText: MainTheme.whiteTypeColor,
              textStyle: TextStyle(
                  color: MainTheme.whiteTypeColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
              height: 50.h,
              radius: BorderRadius.all(Radius.circular(30.sp)),
              onTap: () {
                goToCartPage();
              },
            ),
          )
        ],
      ),
    );
  }

  goToCartPage() {
    Navigator.pushNamed(context, '/cart_page');
  }
}
