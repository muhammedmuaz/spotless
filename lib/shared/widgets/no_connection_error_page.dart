/// This [NoConnectionErrorPage] class is used to showing error page when  connection are unavailable
/// This functionality is common for all page
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

import 'common_button.dart';

class NoConnectionErrorPage extends StatefulWidget {
  final Function? onTap;
  NoConnectionErrorPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<NoConnectionErrorPage> createState() => _NoConnectionErrorPageState();
}

class _NoConnectionErrorPageState extends State<NoConnectionErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/no-connection.png'),
              Text(
                "Oops!",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: MainTheme.blackypeColor,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(top: 11.5.h),
                width: 200.w,
                child: Text(
                  'No internet connection found.Check your connection.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: MainTheme.greyTypeColor,
                      height: 1.5),
                ),
              )
            ],
          )),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 33.w, right: 33.w, bottom: 10.h),
        child: CommonButton(
          name: 'TRY AGAIN',
          colorBtn: MainTheme.blueTypeOneColor,
          colorText: MainTheme.whiteTypeColor,
          textStyle: TextStyle(
              color: MainTheme.whiteTypeColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
          height: 50.h,
          radius: BorderRadius.all(Radius.circular(30.sp)),
          onTap: () {
            widget.onTap!();
          },
        ),
      ),
    );
  }
}
