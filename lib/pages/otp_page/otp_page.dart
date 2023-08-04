import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/shared/helper/helper.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/check_box.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/text_feild.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../app_localizations.dart';
import '../../enum.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  TextEditingController textEditingController = TextEditingController();

  String currentText = "";
  late Timer _timer;
  int _start = 240;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /// this [startTimer] fun is used to start up the timer

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.blueTypeOneColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_background.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              WebsafeSvg.asset('assets/images/logo.svg'),
              SizedBox(
                height: 250.h,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
                  padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                      color: MainTheme.whiteTypeColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        child: Text(
                          AppTranslations.of(context)!
                              .text('OTP PAGE', 'VERIFY CODE'),
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: MainTheme.blackypeColor),
                        ),
                      ),
                      Container(
                        child: Text(
                          AppTranslations.of(context)!
                              .text('OTP PAGE', 'SENT CODE'),
                          style: TextStyle(
                              fontSize: 12.sp, color: MainTheme.greyTypeColor),
                        ),
                      ),
                      Container(
                        child: Text(
                          AppTranslations.of(context)!
                              .text('OTP PAGE', 'MOBILE NUMBER'),
                          style: TextStyle(
                              fontSize: 12.sp, color: MainTheme.greyTypeColor),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: MainTheme.blueTypeOneColor,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: false,
                            blinkWhenObscuring: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                                fieldOuterPadding: EdgeInsets.zero,
                                shape: PinCodeFieldShape.underline,
                                fieldHeight: 50,
                                borderWidth: 2.5,
                                fieldWidth: 50,
                                activeColor: MainTheme.blueTypeOneColor,
                                disabledColor: MainTheme.greyTypeFiveColor,
                                inactiveColor: MainTheme.greyTypeFiveColor),
                            cursorColor: Colors.black,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: false,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            onCompleted: (v) {
                              debugPrint("Completed");
                            },
                            onChanged: (value) {
                              debugPrint(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppTranslations.of(context)!
                                .text('OTP PAGE', 'OTP EXPIRED'),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: MainTheme.greyTypeColor),
                          ),
                          Text(
                            ": $_start",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: MainTheme.blueTypeOneColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _timer.cancel();
                              _start = 240;
                              startTimer();
                            });
                            var dto = {"phone": "${_authStore.phoneNo}"};
                            _authStore.getOtp(dto, isInResend: true);
                          },
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: Text(
                                AppTranslations.of(context)!
                                    .text('OTP PAGE', 'RESEND CODE'),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MainTheme.blueTypeOneColor),
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 32.h),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(55.sp)),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              color: _start == 0
                                  ? MainTheme.greyType1Color
                                  : MainTheme.blueTypeOneColor,
                              child: Observer(builder: (BuildContext context) {
                                if (_authStore.verifyOtpPageState ==
                                    LoadingStatusEnum.loading) {
                                  return SizedBox(
                                    height: 30.h,
                                    child: LoadingIndicator(
                                      colors: [Colors.white],
                                      indicatorType:
                                          Indicator.lineScalePulseOutRapid,
                                    ),
                                  );
                                }
                                return Text(
                                  AppTranslations.of(context)!
                                      .text('GENERAL', 'SUBMIT'),
                                  style: TextStyle(
                                      color: MainTheme.whiteTypeColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                );
                              }),
                              onPressed: () {
                                if (_start == 0) {
                                  () {};
                                } else {
                                  removeFocus(context);
                                  toSubmitOtp();
                                }
                              },
                            ),
                          )),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  /// This [toSubmitOtp] fun is used to post verification code to [verifyOtp] fun in side the [_authStore] class

  toSubmitOtp() {
    if (textEditingController.value.text.isNotEmpty &&
        textEditingController.value.text.length == 4) {
      var dto = {
        "phone": "${_authStore.phoneNo}",
        "verification_code": "${textEditingController.value.text}"
      };
      _authStore.verifyOtp(dto, context: context);
    } else {
      if (textEditingController.value.text.isEmpty) {
        BotToast.showText(
            text: AppTranslations.of(context)!.text('OTP PAGE', 'OTP REQUIRED'),
            duration: Duration(seconds: 1));
      } else {
        BotToast.showText(
            text:
                '${4 - textEditingController.value.text.length} ${AppTranslations.of(context)!.text('OTP PAGE', 'MISSING')}',
            duration: Duration(seconds: 1));
      }
    }
  }
}
