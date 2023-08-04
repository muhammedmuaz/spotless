import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class ExparedCard extends StatefulWidget {
  const ExparedCard({Key? key}) : super(key: key);

  @override
  State<ExparedCard> createState() => _ExparedCardState();
}

class _ExparedCardState extends State<ExparedCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 5.h,
            child: Container(
              width: MediaQuery.of(context).size.width - 34.w,
              height: 103.h,
              padding: EdgeInsets.only(left: 15.w, top: 15.h),
              decoration: const BoxDecoration(
                  color: MainTheme.blackypeColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140.w,
                    child: Text(
                      "Your Subscription Expires Soon",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.whiteTypeColor),
                    ),
                  ),
                  Container(
                    width: 65.w,
                    height: 22.h,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        color: MainTheme.blueTypeOneColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.sp))),
                    alignment: Alignment.center,
                    child: Text(
                      "RENEW",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .6)
                          ],
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 15.w,
              child: Image.asset(
                'assets/images/expired.png',
                width: 152.w,
                height: 152.h,
              )),
        ],
      ),
    );
  }
}
