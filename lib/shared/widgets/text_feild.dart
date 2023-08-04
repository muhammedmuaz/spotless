/// This [TextFeildWidget] class is used for [TextFormField] for all page ,
/// this is common widget

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotless/shared/theme/theme.dart';

import '../../app_localizations.dart';

class TextFeildWidget extends StatefulWidget {
  final String? labelText;
  final bool obscureText;
  final bool isLogin;
  final EdgeInsetsGeometry? padding;
  final Function(String)? validators;
  final TextEditingController? controller;
  final bool suffixIconActive;
  final Function? onTapSuffix;
  final bool numberkeyboard;

  final bool readOnlyFeild;
  const TextFeildWidget({
    Key? key,
    this.labelText,
    this.controller,
    this.validators,
    this.obscureText = false,
    this.isLogin = false,
    this.padding,
    this.onTapSuffix,
    this.numberkeyboard = false,
    this.readOnlyFeild = false,
    this.suffixIconActive = false,
  }) : super(key: key);

  @override
  State<TextFeildWidget> createState() => _TextFeildWidgetState();
}

class _TextFeildWidgetState extends State<TextFeildWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnlyFeild,
      keyboardType: widget.numberkeyboard ? TextInputType.phone : null,
      controller: widget.controller,
      validator: widget.validators as String? Function(String?)?,
      obscureText: widget.obscureText,
      style: const TextStyle(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          maxHeight: 30.h,
          maxWidth: 75.w,
        ),
        suffixIcon: widget.suffixIconActive
            ? InkWell(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  widget.onTapSuffix!();
                },
                child: Container(
                    margin: EdgeInsets.only(top: 3.h, left: 5.w),
                    width: 75.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: MainTheme.blueTypeOneColor, width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTranslations.of(context)!
                              .text('REGISTER', 'CHOOSE'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: MainTheme.blueTypeOneColor),
                        ),
                      ],
                    )))
            : Container(
                width: 1,
                height: 1,
              ),
        errorStyle: TextStyle(color: Colors.red, fontSize: 10.sp),
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle:
            TextStyle(color: MainTheme.greyTypeColor, fontSize: 16.sp),
        labelStyle: TextStyle(color: MainTheme.greyTypeColor, fontSize: 12.sp),
        hintText: '',
        contentPadding: widget.padding ?? EdgeInsets.only(bottom: 10.h),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.isLogin
                ? MainTheme.blueTypeTwoColor
                : MainTheme.greyTypeTwoColor,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.isLogin
                ? MainTheme.blueTypeTwoColor
                : MainTheme.greyTypeTwoColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MainTheme.blueTypeColor, width: 2.w),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: MainTheme.blueTypeColor),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: MainTheme.blueTypeColor),
        ),
      ),
    );
  }
}
