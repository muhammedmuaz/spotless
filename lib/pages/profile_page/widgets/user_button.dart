import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class UserButton extends StatefulWidget {
  final String? name;
  final Function? onTap;
  const UserButton({Key? key, this.name, this.onTap}) : super(key: key);

  @override
  State<UserButton> createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
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
        // width: 65.w,
        height: 28.h,
        decoration: BoxDecoration(
            color: MainTheme.blueTypeOneColor,
            borderRadius: BorderRadius.all(Radius.circular(30.sp))),
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: Text(
          widget.name!,
          style: TextStyle(
              color: MainTheme.whiteTypeColor,
              fontSize: 12.sp,
              shadows: const [
                Shadow(color: MainTheme.whiteTypeColor, blurRadius: .6)
              ],
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
