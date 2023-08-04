import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MenuCard extends StatefulWidget {
  final String? name;
  final bool isEnd;
  final Function? onTap;

  const MenuCard({Key? key, this.name, this.isEnd = false, this.onTap})
      : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 10.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 13.h),
                  child: Text(
                    widget.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    // color: Colors.green,
                    height: 25.h,
                    width: 25.w,
                    alignment: Alignment.center,
                    child: WebsafeSvg.asset('assets/images/menu_back.svg'))
              ],
            ),
            widget.isEnd
                ? const SizedBox.shrink()
                : const Divider(
                    color: MainTheme.greyTypeTwoColor,
                    thickness: 2,
                  )
          ],
        ),
      ),
    );
  }
}
