import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/store/cart_store/cart_store.dart';

import '../../../app_localizations.dart';
import '../../../locator.dart';
import '../../../store/vendor_store/vendor_store.dart';

class ServiceCard extends StatefulWidget {
  final String? name;
  final String? image;
  final String? price;
  final int? credit;
  final String? currencyCode;
  final Function? onTapAdd;
  final int? quantity;
  final int? itemId;
  final Function(bool isIncrement)? onTapBtns;

  const ServiceCard(
      {Key? key,
      this.name,
      this.price,
      this.credit,
      this.image,
      this.currencyCode,
      this.onTapAdd,
      this.quantity,
      this.itemId,
      this.onTapBtns})
      : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  final CartStore _cartStore = locator.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: MainTheme.greyTypeTwoColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Stack(
                  children: [
                    widget.image == null || widget.image == ''
                        ? Image.asset(
                            "assets/images/placeholder.png",
                            width: 160.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: widget.image!,
                            width: 160.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                            errorWidget: (BuildContext context, message, n) =>
                                Image.asset(
                              "assets/images/placeholdercommon.png",
                              width: 160.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                            placeholder: (context, url) => Image.asset(
                              "assets/images/placeholder.png",
                              width: 160.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                    Positioned(
                      top: 6.h,
                      left: 6.w,
                      child: Container(
                        width: 62.w,
                        height: 16.h,
                        padding: EdgeInsets.only(left: 5.w, top: .5.h),
                        decoration: const BoxDecoration(
                            color: MainTheme.blueTypeOneColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Text(
                            widget.credit == null
                                ? ""
                                : "${AppTranslations.of(context)!.text('HOME', 'CREDIT')}: ${widget.credit}",
                            style: TextStyle(
                                color: MainTheme.whiteTypeColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 12.h, right: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 85.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 85.w,
                                child: Text(
                                  widget.name!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      shadows: const [
                                        Shadow(
                                            color: MainTheme.blackTypeColor,
                                            blurRadius: .5)
                                      ],
                                      color: MainTheme.blackypeColor),
                                )),
                            Container(
                                width: 85.w,
                                child: Text(
                                  "${widget.currencyCode} ${widget.price!}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      shadows: const [
                                        Shadow(
                                            color: MainTheme.blackTypeColor,
                                            blurRadius: .5)
                                      ],
                                      color: MainTheme.blackypeColor),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  !_cartStore.cartItems.containsKey(widget.itemId)
                      ? InkWell(
                          onTap: () {
                            widget.onTapAdd!();
                          },
                          child: Container(
                            width: 41.w,
                            height: 18.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: MainTheme.blueTypeOneColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.sp))),
                            child: Text(
                              AppTranslations.of(context)!.text('HOME', 'ADD'),
                              style: TextStyle(
                                  color: MainTheme.whiteTypeColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  shadows: const [
                                    BoxShadow(
                                        color: MainTheme.whiteTypeColor,
                                        spreadRadius: .5)
                                  ]),
                            ),
                          ))
                      : Container(
                          // margin: EdgeInsets.only(bottom: 4.h),
                          child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  widget.onTapBtns!(false);
                                },
                                child: Container(
                                  height: 18.h,
                                  width: 18.w,
                                  margin: EdgeInsets.only(
                                    left: 4.w,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      // color: Colors.black,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: MainTheme.greyTypeColor)),
                                  child: Icon(
                                    Icons.remove,
                                    size: 12.sp,
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 5.w, right: 5.w),
                                child: Text(
                                    "${_cartStore.cartItems[widget.itemId]!.quantity!}",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: MainTheme.blackTypeColor,
                                        shadows: const [
                                          Shadow(
                                              color: MainTheme.blackTypeColor,
                                              blurRadius: .5)
                                        ]))),
                            InkWell(
                                onTap: () {
                                  widget.onTapBtns!(true);
                                },
                                child: Container(
                                  height: 18.h,
                                  width: 18.w,
                                  decoration: const BoxDecoration(
                                    color: MainTheme.blueTypeOneColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 12.sp,
                                    color: MainTheme.whiteTypeColor,
                                  ),
                                )),
                          ],
                        )),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
