import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class ItemCard extends StatefulWidget {
  final bool isEnd;
  final String? name;
  final String? serviceName;
  final int? qty;
  const ItemCard(
      {Key? key, this.isEnd = false, this.name, this.qty, this.serviceName})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4.h),
                    child: Text(
                      widget.name ?? "",
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(widget.serviceName ?? "",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.greyTypeColor))
                ],
              ),
              Text(
                widget.qty != null ? "${widget.qty}" : "0",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              )
            ],
          ),
          !widget.isEnd
              ? Container(
                  margin: EdgeInsets.only(top: 5.h),
                  width: MediaQuery.of(context).size.width,
                  child: const Divider(
                    height: 1,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
