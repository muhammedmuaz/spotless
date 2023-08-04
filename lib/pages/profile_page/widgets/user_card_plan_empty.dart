import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/pages/profile_page/widgets/user_button.dart';
import 'package:spotless/shared/theme/theme.dart';
import '../../../app_localizations.dart';
import '../../../shared/widgets/common_button.dart';

class UserCardPlanEmpty extends StatefulWidget {
  final String? image;
  final String? name;
  final String? emailId;
  final String? subscriptionName;
  final String? validityDate;
  final String? subscriptionCode;
  final String? totalQtyCount;
  final String? usedQtyCount;
  final String? remainningQtyCount;

  const UserCardPlanEmpty(
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
  State<UserCardPlanEmpty> createState() => _UserCardPlanEmptyState();
}

class _UserCardPlanEmptyState extends State<UserCardPlanEmpty> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTranslations.of(context)!
                              .text('MY CART', 'DONT HAVE ANY'),
                          style: TextStyle(
                              color: MainTheme.greyTypeColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          AppTranslations.of(context)!.text('MY CART', 'PLAN'),
                          style: TextStyle(
                              color: MainTheme.greyTypeColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ])),
              Container(
                margin: EdgeInsets.only(right: 15.w),
                width: 115.w,
                height: 30.h,
                child: CommonButton(
                  name:
                      '${AppTranslations.of(context)!.text('MY CART', 'CHOOSE PlAN')}',
                  colorBtn: MainTheme.blueTypeOneColor,
                  colorText: MainTheme.whiteTypeColor,
                  textStyle: TextStyle(
                      color: MainTheme.whiteTypeColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                  height: 26.h,
                  radius: BorderRadius.all(Radius.circular(30.sp)),
                  onTap: () {
                    goToPlanPage();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  goToPlanPage() {
    Navigator.pushNamed(context, '/choose_plan_page');
  }
}
