import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/routes.dart';
import 'package:spotless/shared/helper/helper.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/vendor_store/vendor_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/common_button.dart';
import '../../shared/widgets/redeem_dialog_box.dart';
import '../../shared/widgets/text_feild.dart';

class RedeemCashPage extends StatefulWidget {
  final RedeemSuccessPageParam? item;
  RedeemCashPage({Key? key, this.item}) : super(key: key);

  @override
  State<RedeemCashPage> createState() => _RedeemCashPageState();
}

class _RedeemCashPageState extends State<RedeemCashPage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final VendorStore _vendorStore = locator.get<VendorStore>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        color: Colors.white,
        showLeading: true,
        elevation: 0,
        leadingWidth: 80.w,
        leadingPadding: const EdgeInsets.all(5),
        name: AppTranslations.of(context)!.text('REFERRAL', 'REFERRAL'),

        // showAction: true,
        onTapAction: () {},
        // actionIcon: Container(
        //   margin: EdgeInsets.only(right: 11.5.w),
        //   child: Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(right: 3.w),
        //         child: Text(
        //           widget.item?.value == null ? "" : widget.item!.value!,
        //           style: TextStyle(
        //               fontSize: 18.sp,
        //               fontWeight: FontWeight.w600,
        //               color: MainTheme.blackypeColor),
        //         ),
        //       ),
        //       WebsafeSvg.asset('assets/images/verify.svg')
        //     ],
        //   ),
        // ),
        onTapLeading: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                  margin: EdgeInsets.all(16.sp),
                  width: MediaQuery.of(context).size.width,
                  height: 165,
                  child: WebsafeSvg.asset("assets/images/redeem_card.svg")),
              Positioned(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              widget.item?.value == null
                                  ? ""
                                  : "XAF ${widget.item!.value!}",
                              style: TextStyle(
                                  color: MainTheme.blueTypeOneColor,
                                  fontSize: 60.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.item?.type == null
                                  ? ""
                                  : widget.item!.type!,
                              style: TextStyle(
                                  height: 0.2,
                                  color: MainTheme.whiteTypeColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ))),
              Positioned(
                  right: 0,
                  bottom: 30,
                  child: Container(
                      margin: EdgeInsets.only(right: 30.w),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5.w),
                            child: Text(
                              "${AppTranslations.of(context)!.text('REFERRAL', 'REDEEMED USING')}  ${widget.item!.point}",
                              style: TextStyle(
                                  color: MainTheme.whiteTypeColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                              child:
                                  WebsafeSvg.asset("assets/images/check.svg"))
                        ],
                      )))
            ],
          ),
          Container(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 90.h, bottom: 35.h, left: 16.w, right: 16.w),
                      child: TextFeildWidget(
                        controller: _phoneNoCtrl,
                        numberkeyboard: true,
                        labelText: 'Mobile Number',
                        validators: (String? value) {
                          if (value!.isEmpty) return 'Required field';
                        },
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.only(left: 35.w, right: 35.w),
        child: CommonButton(
          onTap: () {
            removeFocus(context);
            showRedeemDialogBox();
          },
          name: AppTranslations.of(context)!.text('REFERRAL', 'REDEEM NOW'),
          textStyle: TextStyle(
              color: MainTheme.whiteTypeColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
          colorBtn: MainTheme.blueTypeOneColor,
          colorText: MainTheme.whiteTypeColor,
          height: 50.h,
          radius: BorderRadius.all(Radius.circular(25.sp)),
        ),
      ),
    );
  }

  /// This [showRedeemDialogBox] is used to show the [Dialog] box of redeem infom

  void showRedeemDialogBox() {
    if (_formKey.currentState!.validate()) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return RedeemDialogBox(
              onTapOptions: () {
                goToRedeemSuccessPage();
              },
            );
          });
    }
  }

  /// this [goToRedeemSuccessPage] fun is used to post a redeem , using the [redeemCash] fun , that is inside the [_vendorStore]
  /// it pass the [dto] as param

  goToRedeemSuccessPage() {
    var dto = {
      "referral_settings_id": widget.item!.selectedItem!.id,
      "referral_type": 2,
      "mobile_money_number": "${_phoneNoCtrl.value.text}"
    };
    _vendorStore.redeemCash(dto, context, _authStore.accessToken!,
        item: widget.item!.selectedItem);
  }
}
