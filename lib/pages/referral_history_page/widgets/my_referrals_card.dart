import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_localizations.dart';
import '../../../shared/theme/theme.dart';

class MyReferralsCard extends StatefulWidget {
  final String? image;
  final String? email;
  final String? name;
  final String? points;
  const MyReferralsCard(
      {Key? key, this.email, this.image, this.points, this.name})
      : super(key: key);

  @override
  State<MyReferralsCard> createState() => _MyReferralsCardState();
}

class _MyReferralsCardState extends State<MyReferralsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    widget.image == null || widget.image == ""
                        ? CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                            radius: 25,
                            backgroundImage: AssetImage(
                              "assets/images/placeholdercommon.png",
                            ))
                        : CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(widget.image!),
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5.w),
                            child: Text(
                              widget.name == null ? "" : widget.name!,
                              style: TextStyle(
                                  color: MainTheme.blackypeColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 5.h, left: 5.w),
                            child: Text(
                              widget.email == null ? "" : widget.email!,
                              style: TextStyle(
                                color: MainTheme.blackypeColor,
                                fontSize: 10.sp,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 5.w),
                    child: Text(
                      widget.points == null
                          ? "0 ${AppTranslations.of(context)!.text('REFERRAL', 'POINT')}"
                          : "${widget.points} ${AppTranslations.of(context)!.text('REFERRAL', 'POINT')}",
                      style: TextStyle(
                          color: MainTheme.blueTypeOneColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.h, top: 5.h),
              child: Divider(),
            )
          ],
        ));
  }
}
