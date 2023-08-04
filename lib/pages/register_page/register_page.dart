import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/register_page/widgets/select_city_bottomsheet.dart';
import 'package:spotless/shared/helper/helper.dart';
import 'package:spotless/shared/helper/image_picker.helper.dart';
import 'package:spotless/shared/helper/image_upload_alert.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/check_box.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/text_feild.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../app_localizations.dart';
import '../../enum.dart';
import '../../provider/auth.provider.dart';
import '../../shared/widgets/address_bottom_sheet.dart';
import '../../store/auth_store/auth_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthStore _authStore = locator.get<AuthStore>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _cityCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _referralCtrl = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authStore.selectedAppUserImage = null;
    _authStore.selectedCity = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        color: Colors.white,
        showLeading: true,
        leadingWidth: 68,
        leadingPadding: const EdgeInsets.all(3),
        elevation: 0,
        name: AppTranslations.of(context)!.text('REGISTER', 'REGISTER'),
        onTapLeading: () {
          Navigator.pop(context);
        },
      ),
      body: Observer(builder: (BuildContext context) {
        return SingleChildScrollView(
            padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    removeFocus(context);
                                    selectUserImage();
                                  },
                                  child: _authStore.selectedAppUserImage == null
                                      ? CircleAvatar(
                                          radius: 60.sp,
                                          backgroundColor:
                                              MainTheme.greyTypeOneColor,
                                          child: WebsafeSvg.asset(
                                              'assets/images/camera.svg'))
                                      : CircleAvatar(
                                          radius: 60.sp,
                                          backgroundColor:
                                              MainTheme.greyTypeOneColor,
                                          backgroundImage: FileImage(
                                            _authStore.selectedAppUserImage!,
                                          ))),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 32.h, bottom: 51.h),
                              child: TextFeildWidget(
                                controller: _nameCtrl,
                                labelText: AppTranslations.of(context)!
                                    .text('REGISTER', 'NAME'),
                                validators: (String? value) {
                                  if (value!.isEmpty) return 'Required field';
                                },
                              )),
                          Container(
                              margin: EdgeInsets.only(bottom: 51.h),
                              child: TextFeildWidget(
                                  readOnlyFeild: true,
                                  suffixIconActive: true,
                                  controller: _cityCtrl,
                                  labelText:
                                      _authStore.selectedCity?.name == null
                                          ? AppTranslations.of(context)!
                                              .text('REGISTER', 'YOUR CITY')
                                          : _authStore.selectedCity!.name!,
                                  onTapSuffix: () {
                                    removeFocus(context);
                                    addressBottomSheet();
                                    // setState(() {
                                    //   _cityCtrl.value = TextEditingValue(
                                    //       text: _authStore.selectedCity?.name ==
                                    //               null
                                    //           ? ""
                                    //           : _authStore.selectedCity!.name!);
                                    // });
                                  })),
                          TextFeildWidget(
                            labelText: AppTranslations.of(context)!
                                .text('REGISTER', 'EMAIL ID'),
                            controller: _emailCtrl,
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
                                      .text('GENERAL', 'ENTER VALID');
                                }
                              }
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 51.h),
                            child: TextFeildWidget(
                                controller: _referralCtrl,
                                labelText: AppTranslations.of(context)!
                                    .text('REGISTER', 'REFERRAL CODE')),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40.h, bottom: 15.h),
                            child: CheckBoxWidget(
                                isChecked: isChecked,
                                onTap: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                label: AppTranslations.of(context)!
                                    .text('REGISTER', 'AGREE')),
                          ),
                        ]))));
      }),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.only(left: 35.w, right: 35.w),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 51.h,
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
                  borderRadius: BorderRadius.all(Radius.circular(22.sp)),
                  borderSide: const BorderSide(color: Colors.transparent)),
              color:
                  isChecked ? MainTheme.blueTypeOneColor : Colors.grey.shade400,
              child: Observer(builder: (BuildContext context) {
                if (_authStore.createPageState == LoadingStatusEnum.loading) {
                  return SizedBox(
                    height: 30.h,
                    child: LoadingIndicator(
                      colors: [Colors.white],
                      indicatorType: Indicator.lineScalePulseOutRapid,
                    ),
                  );
                }
                return Text(
                  AppTranslations.of(context)!.text('REGISTER', 'REGISTER'),
                  style: TextStyle(
                      color: MainTheme.whiteTypeColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                );
              }),
              onPressed: () {
                removeFocus(context);
                isChecked ? onSubmit() : () {};
              },
            ),
          )),
    );
  }

  /// This [onSubmit] fun is used to create app user
  /// this fun is pass the [_inputs] as param and pass this to [createAppUser] fun inside the [_authStore]

  onSubmit() {
    if (_authStore.selectedCity != null) {
      if (_formKey.currentState!.validate()) {
        AppUserDto _inputs = AppUserDto(
          email: _emailCtrl.value.text,
          name: _nameCtrl.value.text,
          phone: _authStore.phoneNo,
          cityId: "${_authStore.selectedCity!.id}",
          referral: _referralCtrl.value.text,
          selectedAppUserImage: _authStore.selectedAppUserImage == null
              ? null
              : _authStore.selectedAppUserImage!,
        );
        _authStore.createAppUser(
          data: _inputs,
          context: context,
        );
      }
    } else {
      BotToast.showText(
        text: AppTranslations.of(context)!.text('REGISTER', 'CHOOSE CITY'),
      );
    }
  }

  /// This [selectUserImage] fun is used to show [Dialog] box for choose avathar infom

  void selectUserImage() {
    showDialog(
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

  /// This [addressBottomSheet] fun is used to show [showModalBottomSheet] for select city

  addressBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.sp),
                topRight: Radius.circular(12.sp))),
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        builder: (BuildContext context) {
          return SizedBox(
            height: 448.h,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.sp),
                    topRight: Radius.circular(12.sp)),
                child: SelectCityBottomsheet()),
          );
        });
  }
}
