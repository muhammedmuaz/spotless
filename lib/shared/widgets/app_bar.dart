/// [CommonAppBar] this class is a [AppBar] that is common for all pages

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotless/shared/theme/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? name;
  final Function? onTapLeading;
  final EdgeInsetsGeometry? leadingMargin;
  final EdgeInsetsGeometry? leadingPadding;
  final Color? color;
  final Color? contentColor;
  final double? elevation;
  final bool showLeading;
  final bool showAction;
  final String? status;
  final Color? onLeadingColor;
  final double? leadingWidth;
  final bool showSearch;
  final Color? statusColor;
  final Function? onTapAction;
  final Widget? actionIcon;

  const CommonAppBar(
      {Key? key,
      this.name,
      this.onTapLeading,
      this.leadingMargin,
      this.leadingPadding,
      this.color,
      this.contentColor,
      this.elevation,
      this.showLeading = false,
      this.leadingWidth,
      this.showAction = false,
      this.showSearch = false,
      this.status,
      this.statusColor,
      this.onLeadingColor = MainTheme.blackTypeColor,
      this.onTapAction,
      this.actionIcon})
      : super(key: key);

  @override
  _CommonAppBarState createState() => _CommonAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: widget.elevation ?? 0.3,
        titleSpacing: 0,
        leadingWidth: widget.leadingWidth ?? 65.w,
        backgroundColor: widget.color ?? MainTheme.whiteTypeColor,
        centerTitle: true,
        title: Text(
          widget.name ?? '',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: widget.contentColor ?? MainTheme.blackTypeColor),
        ),
        leading: widget.showLeading
            ? IconButton(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  widget.onTapLeading!();
                },
                icon: Container(
                  height: 36.h,
                  width: 36.w,
                  margin: widget.leadingMargin ?? EdgeInsets.only(right: 25.w),
                  padding: widget.leadingPadding ?? EdgeInsets.zero,
                  child: WebsafeSvg.asset('assets/images/back_button.svg',
                      fit: BoxFit.contain, color: widget.onLeadingColor),
                ))
            : Container(),
        actions: widget.showAction == true
            ? [
                widget.showAction
                    ? InkWell(
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          widget.onTapAction!();
                        },
                        child: widget.actionIcon)
                    : Container(),
              ]
            : []);
  }
}
