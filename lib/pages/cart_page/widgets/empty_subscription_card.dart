import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/common_button.dart';

import '../../../app_localizations.dart';

class EmptySubScriptionCard extends StatefulWidget {
  final bool isAdd;
  final Function? onTap;
  const EmptySubScriptionCard({Key? key, this.isAdd = false, this.onTap})
      : super(key: key);

  @override
  State<EmptySubScriptionCard> createState() => _EmptySubScriptionCardState();
}

class _EmptySubScriptionCardState extends State<EmptySubScriptionCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 136.h,
      // color: Colors.green,
      child: Stack(
        // alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 10.h,
            child: Container(
              width: MediaQuery.of(context).size.width - 30.w,
              padding: EdgeInsets.only(top: 15.h, left: 15.w),
              height: 108.h,
              decoration: BoxDecoration(
                  color: MainTheme.greyTypeTwoColor,
                  borderRadius: BorderRadius.all(Radius.circular(12.sp))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTranslations.of(context)!
                        .text('MY CART', 'DONT HAVE ANY'),
                    style: TextStyle(
                        color: MainTheme.blackypeColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    AppTranslations.of(context)!.text('MY CART', 'PLAN'),
                    style: TextStyle(
                        color: MainTheme.blackypeColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: widget.isAdd ? 100.w : 115.w,

                    margin: EdgeInsets.only(top: 11.h),
                    // height: 40.h,
                    child: CommonButton(
                      name: widget.isAdd
                          ? '${AppTranslations.of(context)!.text('MY CART', 'ADD PLAN')}'
                          : '${AppTranslations.of(context)!.text('MY CART', 'CHOOSE PlAN')}',
                      colorBtn: MainTheme.blueTypeOneColor,
                      colorText: MainTheme.whiteTypeColor,
                      textStyle: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                      height: 26.h,
                      radius: BorderRadius.all(Radius.circular(30.sp)),
                      onTap: () {
                        widget.onTap!();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset('assets/images/active_plan.png', height: 143.h),
          ),
        ],
      ),
    );
  }
}
