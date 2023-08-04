import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class AddressCategoryCard extends StatefulWidget {
  final int? index;
  final int? selectedIndex;
  final String? name;
  final Function? onTap;
  const AddressCategoryCard(
      {Key? key, this.index, this.selectedIndex, this.name, this.onTap})
      : super(key: key);

  @override
  State<AddressCategoryCard> createState() => _AddressCategoryCardState();
}

class _AddressCategoryCardState extends State<AddressCategoryCard> {
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
        width: 81.w,
        margin: EdgeInsets.only(right: 15.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.index == widget.selectedIndex
                ? MainTheme.blueTypeOneColor
                : MainTheme.greyTypeColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(
          widget.name!,
          style: const TextStyle(color: MainTheme.whiteTypeColor),
        ),
      ),
    );
  }
}
