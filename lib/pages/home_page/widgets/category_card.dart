import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class CategoryCard extends StatefulWidget {
  final String? name;
  final String? assetImage;
  final bool isMainCategory;
  final Function? onTap;
  const CategoryCard(
      {Key? key,
      this.name,
      this.assetImage,
      this.isMainCategory = false,
      this.onTap})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        width: 50.w,
        height: 80.h,
        margin: widget.isMainCategory
            ? EdgeInsets.zero
            : EdgeInsets.only(left: 15.w),
        padding:
            EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w, bottom: 5.h),
        decoration: BoxDecoration(
            color: MainTheme.greyTypeTwoColor,
            borderRadius: BorderRadius.all(Radius.circular(12.sp))),
        child: Column(
          children: [
            Container(
                margin:
                    EdgeInsets.only(bottom: widget.isMainCategory ? 8.h : 5.h),
                child: widget.isMainCategory
                    ? widget.assetImage == null || widget.assetImage == ''
                        ? Image.asset("assets/images/placeholder.png",
                            fit: BoxFit.contain, height: 64.h, width: 64.w)
                        : CachedNetworkImage(
                            height: 64.h,
                            width: 64.w,
                            imageUrl: widget.assetImage!,
                            fit: BoxFit.fill,
                            errorWidget: (BuildContext context, message, n) =>
                                Image.asset(
                              "assets/images/placeholdercommon.png",
                              fit: BoxFit.contain,
                            ),
                            placeholder: (context, url) => Image.asset(
                              "assets/images/placeholder.png",
                              fit: BoxFit.contain,
                            ),
                          )
                    : widget.assetImage == null || widget.assetImage == ''
                        ? Image.asset(
                            "assets/images/placeholder.png",
                            fit: BoxFit.contain,
                            height: 45.h,
                            width: 45.w,
                          )
                        : CachedNetworkImage(
                            height: 45.h,
                            width: 45.w,
                            imageUrl: widget.assetImage!,
                            fit: BoxFit.fill,
                            errorWidget: (BuildContext context, message, n) =>
                                Image.asset(
                              "assets/images/placeholdercommon.png",
                              fit: BoxFit.contain,
                            ),
                            placeholder: (context, url) => Image.asset(
                              "assets/images/placeholder.png",
                              fit: BoxFit.contain,
                            ),
                          )),
            Text(
              widget.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.isMainCategory
                  ? TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: MainTheme.greyTypeColor)
                  : TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
