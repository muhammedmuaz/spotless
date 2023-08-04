import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/provider/auth.provider.dart';
import 'package:spotless/shared/helper/helper.dart';
import 'package:spotless/shared/helper/image_picker.helper.dart';
import 'package:spotless/shared/helper/image_upload_alert.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/text_feild.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _phoneNoCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    _authStore.selectedAppUserImage = null;

    if (_authStore.appUser != null) {
      _nameCtrl.value = TextEditingValue(
          text: _authStore.appUser?.value.name != null
              ? _authStore.appUser!.value.name!
              : '');
      _phoneNoCtrl.value = TextEditingValue(
          text: _authStore.appUser?.value.phone != null
              ? _authStore.appUser!.value.phone!
              : '');
      _emailCtrl.value = TextEditingValue(
          text: _authStore.appUser?.value.email != null
              ? _authStore.appUser!.value.email!
              : '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onBackButtonTap(context);
      },
      child: Scaffold(
        appBar: CommonAppBar(
          color: Colors.white,
          showLeading: true,
          leadingWidth: 80.w,
          leadingPadding: const EdgeInsets.all(5),
          elevation: 0,
          name: AppTranslations.of(context)!.text('GENERAL', 'EDIT PROFILE'),
          onTapLeading: () {
            _onBackButtonTap(context);
          },
        ),
        body: Observer(builder: (context) {
          return SingleChildScrollView(
              padding: EdgeInsets.only(top: 15.h, left: 16.w, right: 16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              removeFocus(context);
                              selectUserImage();
                            },
                            child: Container(
                              height: 120.h,
                              width: 120.w,
                              margin: EdgeInsets.only(bottom: 20.h),
                              foregroundDecoration: const BoxDecoration(
                                color: MainTheme.greyTypeOneTransparentColor,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: _authStore.selectedAppUserImage == null
                                    ? _authStore.appUser!.value.imageUrl == ''
                                        ? DecorationImage(
                                            image: AssetImage(
                                              "assets/images/placeholder.png",
                                            ),
                                            fit: BoxFit.cover)
                                        : DecorationImage(
                                            image: NetworkImage(
                                              _authStore
                                                  .appUser!.value.imageUrl,
                                            ),
                                            fit: BoxFit.cover)
                                    : DecorationImage(
                                        image: FileImage(
                                          _authStore.selectedAppUserImage!,
                                        ),
                                        fit: BoxFit.cover),
                              ),
                              child: WebsafeSvg.asset(
                                'assets/images/camera.svg',
                              ),
                            ))
                      ],
                    ),
                    TextFeildWidget(
                      controller: _nameCtrl,
                      labelText:
                          AppTranslations.of(context)!.text('REGISTER', 'NAME'),
                      validators: (String? value) {
                        if (value!.isEmpty)
                          return AppTranslations.of(context)!
                              .text('GENERAL', 'REQUIRED FIELD');
                      },
                    ),
                    IgnorePointer(
                        child: Container(
                      margin: EdgeInsets.only(top: 35.h, bottom: 35.h),
                      child: TextFeildWidget(
                        readOnlyFeild: true,
                        controller: _phoneNoCtrl,
                        labelText: AppTranslations.of(context)!
                            .text('REGISTER', 'PHONE NO'),
                        validators: (String? value) {
                          if (value!.isEmpty)
                            return AppTranslations.of(context)!
                                .text('GENERAL', 'REQUIRED FIELD');
                        },
                      ),
                    )),
                    TextFeildWidget(
                      controller: _emailCtrl,
                      labelText: AppTranslations.of(context)!
                          .text('REGISTER', 'EMAIL ID'),
                      validators: (String? value) {
                        if (value!.isEmpty)
                          return AppTranslations.of(context)!
                              .text('GENERAL', 'REQUIRED FIELD');
                        if (value.isNotEmpty) {
                          bool _isValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!_isValid) {
                            return AppTranslations.of(context)!
                                .text('GENERAL', 'ENTER VALID EMAIL');
                          }
                        }
                      },
                    ),
                  ],
                ),
              ));
        }),
        bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: 35.w, right: 35.w, bottom: 10.h),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 52.h,
              child: MaterialButton(
                onLongPress: null,
                highlightElevation: 2.5,
                padding: EdgeInsets.zero,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                elevation: 0,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(55.sp)),
                    borderSide: const BorderSide(color: Colors.transparent)),
                color: MainTheme.blueTypeOneColor,
                child: Observer(builder: (BuildContext context) {
                  if (_authStore.editPageState == LoadingStatusEnum.loading) {
                    return SizedBox(
                      height: 30.h,
                      child: LoadingIndicator(
                        colors: [Colors.white],
                        indicatorType: Indicator.lineScalePulseOutRapid,
                      ),
                    );
                  }
                  return Text(
                    AppTranslations.of(context)!.text('GENERAL', 'UPDATE'),
                    style: TextStyle(
                        color: MainTheme.whiteTypeColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  );
                }),
                onPressed: () {
                  removeFocus(context);
                  onSubmit();
                },
              ),
            )),
      ),
    );
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/profile_page",
    );
    return Future.value(false);
  }

  /// this [selectUserImage] fun is used to show the [Dialog] box

  void selectUserImage() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return ImageUploadAlert(
            onImagePicked: (ImagePickerStatus imageData) {
              if (imageData.status == 'success') {
                _authStore.onAvatarSelected(imageData.image!);
                print(imageData.image);
              }
            },
          );
        });
  }

  /// This [onSubmit] fun is used to update the app user data ,
  /// it will pass the [_inputs],[context] as para to [editAppUser] fun ,that is inside the [_authStore] class

  onSubmit() {
    if (_formKey.currentState!.validate()) {
      AppUserDto _inputs = AppUserDto(
        referral: "",
        cityId: "",
        email: _emailCtrl.value.text,
        name: _nameCtrl.value.text,
        selectedAppUserImage: _authStore.selectedAppUserImage == null
            ? null
            : _authStore.selectedAppUserImage!,
      );
      _authStore.editAppUser(
        data: _inputs,
        context: context,
      );
    }
  }
}
