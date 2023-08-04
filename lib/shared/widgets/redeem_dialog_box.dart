/// this [AlertDialog] box is used to showing [Dialog] box for [redeem_page]

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/helper/image_picker.helper.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../app_localizations.dart';
import '../theme/theme.dart';

class RedeemDialogBox extends StatefulWidget {
  final Function? onTapOptions;
  const RedeemDialogBox({Key? key, this.onTapOptions}) : super(key: key);

  @override
  _RedeemDialogBoxState createState() => _RedeemDialogBoxState();
}

class _RedeemDialogBoxState extends State<RedeemDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      content: Container(
          height: 254.h,
          child: Scaffold(
              appBar: AppBar(
                leading: Container(),
                elevation: 0,
                titleSpacing: 0,
                leadingWidth: 0,
                title: Container(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    height: 61.h,
                    color: MainTheme.blueTypeOneColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text(
                          AppTranslations.of(context)!
                              .text('GENERAL', 'REDEEM'),
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: MainTheme.whiteTypeColor,
                              fontWeight: FontWeight.w900),
                        )),
                      ],
                    )),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Text(
                        AppTranslations.of(context)!.text('LOGOUT', 'ARE YOU'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: MainTheme.blackTypeColor,
                        ),
                      )),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                              AppTranslations.of(context)!
                                  .text('GENERAL', 'DO YOU'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: MainTheme.greyTypeColor,
                              )),
                        ),
                      ]),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        height: 40.h,
                        minWidth: 110.w,
                        color: MainTheme.greyTypeColor,
                        child: Text(
                          AppTranslations.of(context)!
                              .text('GENERAL', 'CANCEL C'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                            color: MainTheme.whiteTypeColor,
                          ),
                        ),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          widget.onTapOptions!();
                        },
                        height: 40.h,
                        minWidth: 110.w,
                        color: MainTheme.blueTypeOneColor,
                        child: Text(
                          AppTranslations.of(context)!
                              .text('LOGOUT', 'CONFIRM'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                            color: MainTheme.whiteTypeColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
