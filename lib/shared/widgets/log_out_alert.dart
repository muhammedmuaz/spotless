/// This [LogOutAlert] class is used to showing [AlertDialog] box for logout

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/shared/helper/image_picker.helper.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import 'package:spotless/store/notification_store/notification_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../store/auth_store/auth_store.dart';
import '../theme/theme.dart';

class LogOutAlert extends StatefulWidget {
  const LogOutAlert({
    Key? key,
  }) : super(key: key);

  @override
  _LogOutAlertState createState() => _LogOutAlertState();
}

class _LogOutAlertState extends State<LogOutAlert> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final CartStore _cartStore = locator.get<CartStore>();
  final NotificationStore _notificationStore = locator.get<NotificationStore>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.zero,
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
                          AppTranslations.of(context)!.text('LOGOUT', 'LOGOUT'),
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: MainTheme.whiteTypeColor,
                              fontWeight: FontWeight.w900),
                        )),
                      ],
                    )),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                  .text('LOGOUT', 'DO YOU'),
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
                          AppTranslations.of(context)!.text('LOGOUT', 'CANCEL'),
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
                          _authStore.logout();
                          _cartStore.clearCartAfterOrderPlaced();
                          _notificationStore.clearNotificationlistList();
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/login_page", (route) => false);
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
