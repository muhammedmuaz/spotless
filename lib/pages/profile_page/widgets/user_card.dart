import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/pages/profile_page/widgets/user_button.dart';
import 'package:spotless/shared/theme/theme.dart';
import '../../../app_localizations.dart';

class UserCard extends StatefulWidget {
  final String? image;
  final String? name;
  final String? emailId;
  final String? subscriptionName;
  final String? validityDate;
  final String? subscriptionCode;
  final String? totalQtyCount;
  final String? usedQtyCount;
  final String? remainningQtyCount;

  const UserCard(
      {Key? key,
      this.emailId,
      this.image,
      this.name,
      this.remainningQtyCount,
      this.subscriptionCode,
      this.subscriptionName,
      this.totalQtyCount,
      this.usedQtyCount,
      this.validityDate})
      : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 12.h),
      // height: 270.h,
      padding: EdgeInsets.only(top: 13.5.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: MainTheme.blackypeColor),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 15.w,
              right: 13.5.w,
            ),
            child: Row(
              children: [
                Container(
                    width: 62.w,
                    height: 62.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360.sp)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(360.sp),
                        child: widget.image == null || widget.image == ''
                            ? Image.asset(
                                "assets/images/placeholdercommon.png",
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.image!,
                                fit: BoxFit.fill,
                                errorWidget:
                                    (BuildContext context, message, n) =>
                                        Image.asset(
                                  "assets/images/placeholdercommon.png",
                                  fit: BoxFit.fill,
                                ),
                                placeholder: (context, url) => Image.asset(
                                  "assets/images/placeholder.png",
                                  fit: BoxFit.contain,
                                ),
                              ))),
                Container(
                  margin: EdgeInsets.only(left: 19.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          widget.name ?? "",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: MainTheme.whiteTypeColor),
                        ),
                      ),
                      Text(
                        widget.emailId ?? "",
                        style: TextStyle(
                            fontSize: 12.sp, color: MainTheme.greyTypeColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h, bottom: 18.h),
            child: const DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 2.0,
              dashLength: 18.0,
              dashColor: MainTheme.greyTypeColor,
              dashRadius: 0.0,
              dashGapLength: 13.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15.w,
              right: 13.5.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subscriptionName ?? "",
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          widget.validityDate ?? "",
                          style: TextStyle(
                              color: MainTheme.greyTypeThreeColor,
                              fontSize: 10.sp),
                        ))
                  ],
                ),
                Container(
                  width: 65.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                      color: MainTheme.blueTypeOneColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.sp))),
                  alignment: Alignment.center,
                  child: Text(
                    widget.subscriptionCode ?? "",
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
          Container(
            margin: EdgeInsets.only(top: 16.h, left: 19.w, right: 19.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      AppTranslations.of(context)!.text('MY CART', 'TOTAL QTY'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .3)
                          ]),
                    ),
                    Text(
                      widget.totalQtyCount ?? "",
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 42.h,
                  child: VerticalDivider(
                    color: MainTheme.greyTypeThreeColor,
                    thickness: 2,
                    width: 2.w,
                    indent: 5,
                    endIndent: 10,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      AppTranslations.of(context)!.text('MY CART', 'USED QTY'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .3)
                          ]),
                    ),
                    Text(
                      widget.usedQtyCount ?? "",
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 42.h,
                  child: VerticalDivider(
                    color: MainTheme.greyTypeThreeColor,
                    thickness: 2,
                    width: 2.w,
                    indent: 5,
                    endIndent: 10,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      AppTranslations.of(context)!
                          .text('MY CART', 'REMAINNING QTY'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 10.sp,
                          shadows: const [
                            Shadow(
                                color: MainTheme.whiteTypeColor, blurRadius: .3)
                          ]),
                    ),
                    Text(
                      widget.remainningQtyCount ?? "",
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 11.h, left: 15.w, right: 13.5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserButton(
                  name: AppTranslations.of(context)!
                      .text('PROFILE PAGE', 'BUY EXTRA CREDITS'),
                  onTap: () {
                    goToExtraCreditPage();
                  },
                ),
                UserButton(
                  name: AppTranslations.of(context)!
                      .text('PROFILE PAGE', 'UPGRADE PLAN'),
                  onTap: () {
                    goToPlanPage();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  goToExtraCreditPage() {
    Navigator.pushNamed(context, '/extra_credits_page');
  }

  goToPlanPage() {
    Navigator.pushNamed(context, '/choose_plan_page');
  }
}
