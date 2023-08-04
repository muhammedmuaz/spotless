import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class CartItemCard extends StatefulWidget {
  final String? name;
  final String? serviceName;
  final String? price;
  final int? quantity;
  final String? currencyCode;

  final Function(bool isIncrement)? onTapBtns;

  const CartItemCard(
      {Key? key,
      this.name,
      this.price,
      this.serviceName,
      this.quantity,
      this.currencyCode,
      this.onTapBtns})
      : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 81.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20.h),
      padding:
          EdgeInsets.only(left: 11.w, top: 9.5.h, right: 11.w, bottom: 10.h),
      decoration: const BoxDecoration(
          color: MainTheme.greyTypeTwoColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 250.w,
                  child: Text(
                    widget.name ?? "",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: MainTheme.blackypeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  )),
              Container(
                width: 250.w,
                margin: EdgeInsets.only(top: 3.h, bottom: 4.h),
                child: Text(
                  widget.serviceName == null ? "" : "[ ${widget.serviceName} ]",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: MainTheme.greyTypeColor,
                      fontSize: 10.sp,
                      shadows: const [
                        Shadow(color: MainTheme.greyTypeColor, blurRadius: 0.6)
                      ]),
                ),
              ),
              Row(
                children: [
                  Text(widget.price != null ? "${widget.currencyCode} : " : "",
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 102, 107),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      )),
                  Container(
                      width: 170.w,
                      child: Text(widget.price != null ? "${widget.price}" : "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: MainTheme.blackypeColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 15.sp,
                          )))
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      widget.onTapBtns!(false);
                    },
                    child: Container(
                      height: 22.h,
                      width: 22.w,
                      margin: EdgeInsets.only(left: 4.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: MainTheme.greyTypeColor)),
                      child: Icon(
                        Icons.remove,
                        size: 12.sp,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Text(
                        widget.quantity == null ? "02" : "${widget.quantity}",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
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
                      height: 22.h,
                      width: 22.w,
                      decoration: const BoxDecoration(
                        color: MainTheme.blueTypeOneColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 12.sp,
                        color: MainTheme.whiteTypeColor,
                      ),
                      // radius: 10.sp,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
