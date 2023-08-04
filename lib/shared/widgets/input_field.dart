/// This [InputField] class is used for [TextFormField] for all page ,
/// this is common widget

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/theme/theme.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      this.controller,
      this.validators,
      this.hintText,
      this.prefix,
      this.onTap,
      this.maxLines = 1,
      this.readOnly = false,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.padding,
      this.suffixIcon,
      this.margin,
      this.autofocus = false,
      this.focusNode,
      this.prefixText,
      this.inputFormatters,
      this.contentPadding,
      this.inputStateKey,
      this.lableColor,
      this.textColor,
      this.fillColor,
      this.disabledBorder,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.focusedErrorBorder,
      this.focusColor,
      this.hintFontSize,
      this.labelFontSize,
      this.hintColor,
      this.prefixIcon})
      : super(key: key);
  final GlobalKey<FormFieldState>? inputStateKey;
  final TextEditingController? controller;
  final Function(String)? validators;
  final String? hintText;
  final Widget? prefix;
  final String? prefixText;
  final TextInputType? inputType;
  final bool obscureText;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final Function? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? margin;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? textColor;
  final Color? lableColor;
  final Color? hintColor;
  final Color? fillColor;
  final Color? focusColor;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final double? hintFontSize;
  final double? labelFontSize;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding ?? const EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        ClipRRect(
                          // borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: TextFormField(
                            obscuringCharacter: "*",
                            key: widget.inputStateKey,
                            autofocus: widget.autofocus,
                            focusNode: widget.focusNode,
                            onTap: () {
                              widget.onTap!();
                              onchange();
                            },
                            validator:
                                widget.validators as String? Function(String?)?,
                            controller: widget.controller,
                            keyboardType: widget.inputType,
                            obscureText: widget.obscureText,
                            maxLines: widget.maxLines,
                            readOnly: widget.readOnly,
                            style: TextStyle(
                                color: widget.lableColor,
                                fontSize: widget.labelFontSize ?? 14,
                                fontWeight: FontWeight.w600),
                            inputFormatters: widget.inputFormatters ?? [],
                            decoration: InputDecoration(
                              label: Text(
                                'Password',
                                style: TextStyle(
                                    color: MainTheme.greyTypeColor,
                                    fontSize: 12.sp),
                              ),
                              hoverColor: Colors.transparent,

                              alignLabelWithHint: true,
                              border: const UnderlineInputBorder(),
                              focusedErrorBorder:
                                  widget.focusedErrorBorder ?? InputBorder.none,
                              focusedBorder:
                                  widget.focusedBorder ?? InputBorder.none,
                              enabledBorder:
                                  widget.enabledBorder ?? InputBorder.none,
                              errorBorder:
                                  widget.errorBorder ?? InputBorder.none,
                              disabledBorder:
                                  widget.disabledBorder ?? InputBorder.none,
                              filled: true,
                              fillColor: widget.focusColor ?? Colors.white,
                              // focusColor:widget.focusColor ?? Colors.white, ,

                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              suffixIcon: widget.suffixIcon,
                              prefixIcon: widget.prefixIcon,
                              contentPadding: widget.contentPadding ??
                                  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              prefixText: widget.prefixText,
                              // labelText: widget.hintText,
                              labelStyle: TextStyle(
                                  color: widget.hintColor,
                                  fontSize: widget.hintFontSize ?? 14,
                                  fontWeight: FontWeight.w600),
                              prefixStyle: TextStyle(
                                  color: widget.lableColor ?? Colors.grey[500]),
                              prefixIconConstraints:
                                  BoxConstraints(maxHeight: 40.sp),
                              hintStyle: TextStyle(
                                  color: widget.hintColor,
                                  fontSize: widget.hintFontSize ?? 14,
                                  fontWeight: FontWeight.w600),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      ])),
                )
              ])),
        ]));
  }

  onchange() {
    setState(() {
      if (active == false) {
        active = true;
      }
    });
  }
}
