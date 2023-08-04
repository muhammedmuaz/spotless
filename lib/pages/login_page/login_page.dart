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

import '../../app_localizations.dart';
import '../../enum.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  bool isChecked = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                  padding: EdgeInsets.only(top: 46.h, left: 19.w, right: 19.w),
                  decoration: BoxDecoration(
                      color: MainTheme.whiteTypeColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFeildWidget(
                          numberkeyboard: true,
                          controller: _phoneCtrl,
                          labelText: AppTranslations.of(context)!
                              .text('LOGIN PAGE', 'PHONE NO'),
                          isLogin: true,
                          validators: (String? value) {
                            if (value!.isEmpty)
                              return AppTranslations.of(context)!
                                  .text('GENERAL', 'REQUIRED FIELD');
                          },
                        ),
                        SizedBox(
                          height: 111.h,
                        ),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(55.sp)),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                color: MainTheme.blueTypeOneColor,
                                child:
                                    Observer(builder: (BuildContext context) {
                                  if (_authStore.getOtpPageState ==
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
                                        .text('LOGIN PAGE', 'GET OTP'),
                                    style: TextStyle(
                                        color: MainTheme.whiteTypeColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600),
                                  );
                                }),
                                onPressed: () {
                                  removeFocus(context);
                                  goToHomePage();
                                },
                              ),
                            )),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  /// This [goToHomePage] fun is used to get otp from api
  /// this Fun pass [dto] as param to [getOtp] fun inside the [_authStore] class

  goToHomePage() {
    if (_formKey.currentState!.validate()) {
      var dto = {"phone": "${_phoneCtrl.value.text}"};
      _authStore.getOtp(dto, context: context);
    }
  }

  /// This [goToRegisterPage] is used navigate to [register_page]

  goToRegisterPage() {
    Navigator.pushNamed(context, '/register_page');
  }
}
