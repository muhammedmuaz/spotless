/// This [ImageUploadAlert] class is Used for showing the [AlertDialog] box to choose from camera or gallery

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/shared/helper/image_picker.helper.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../theme/theme.dart';

class ImageUploadAlert extends StatefulWidget {
  const ImageUploadAlert({
    Key? key,
    required this.onImagePicked,
  }) : super(key: key);
  final Function(ImagePickerStatus) onImagePicked;

  @override
  _ImageUploadAlertState createState() => _ImageUploadAlertState();
}

class _ImageUploadAlertState extends State<ImageUploadAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      content: Container(
          height: 193.h,
          child: Scaffold(
              appBar: AppBar(
                leading: Container(),
                elevation: 0,
                titleSpacing: 0,
                leadingWidth: 0,
                title: Container(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    height: 61.h,
                    color: MainTheme.blueTypeOneColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text(
                          AppTranslations.of(context)!
                              .text('ADD PHOTO', 'ADD PHOTO'),
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: MainTheme.whiteTypeColor,
                              fontWeight: FontWeight.w900),
                        )),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: 32.h,
                                width: 32.w,
                                child: WebsafeSvg.asset(
                                  "assets/images/circular_close.svg",
                                  height: 32.h,
                                  width: 32.w,
                                )))
                      ],
                    )),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _displayImagePicker('CAMERA');
                      },
                      child: Row(children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                              AppTranslations.of(context)!
                                  .text('ADD PHOTO', 'TAKE A'),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: MainTheme.blackTypeColor,
                              )),
                        )
                      ])),
                  Container(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Divider()),
                  InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _displayImagePicker('GALLERY');
                      },
                      child: Row(children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                              AppTranslations.of(context)!
                                  .text('ADD PHOTO', 'CHOOSE FROM'),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: MainTheme.blackTypeColor,
                              )),
                        )
                      ])),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ))),
    );
  }

  /// This [_displayImagePicker] fun is used to get  image from [ImagePicker] class

  void _displayImagePicker(String source) async {
    Navigator.of(context).pop();
    ImagePickerStatus _selectedFile = await imagePickerHelper(
      context,
      source: source,
    );
    widget.onImagePicked(_selectedFile);
  }
}
