import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/address_page/widgets/choose_address_card.dart';
import 'package:spotless/shared/model/user/user.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/address_bottom_sheet.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/shimmers/address_shimmer.dart';

class AddressPage extends StatefulWidget {
  final String? locationType;

  const AddressPage({Key? key, this.locationType}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final AuthStore _authStore = locator.get<AuthStore>();

  int selectedIndex = 1;
  List<String> addressCategory = ['Home', 'Work', 'Other'];

  @override
  void initState() {
    super.initState();
    _authStore.getAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onBackButtonTap(context);
      },
      child: Scaffold(
        appBar: CommonAppBar(
          color: Colors.transparent,
          showLeading: true,
          elevation: 0,
          name: AppTranslations.of(context)!.text('ADDRESS PAGE', 'ADDRESS'),
          leadingWidth: 80.w,
          leadingPadding: const EdgeInsets.all(5),
          onTapLeading: () {
            _onBackButtonTap(context);
          },
        ),
        body: getAddress(false),
        floatingActionButton: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            addressBottomSheet(true);
          },
          child: CircleAvatar(
            radius: 24.sp,
            backgroundColor: MainTheme.blueTypeOneColor,
            child: WebsafeSvg.asset('assets/images/add_floating.svg'),
          ),
        ),
      ),
    );
  }

  addressBottomSheet([bool isAdd = true]) {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.sp),
                topRight: Radius.circular(12.sp))),
        backgroundColor: Colors.blue,
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        builder: (BuildContext context) {
          return SizedBox(
            height: 587.h,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.sp),
                    topRight: Radius.circular(12.sp)),
                child: AddressBottomsheet(
                  isAdd: isAdd,
                )),
          );
        });
  }

  Widget getAddress(bool isEmpty) {
    return Observer(builder: (BuildContext context) {
      if (_authStore.manageAddressPageState == LoadingStatusEnum.loading) {
        return AddressPageShimmer();
      }

      if (_authStore.manageAddressPageState == LoadingStatusEnum.error) {
        return Container(
            height: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              AppTranslations.of(context)!
                  .text('GENERAL', 'SOMETHING WENT WRONG'),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            )));
      }

      if (_authStore.addressList.isEmpty) {
        return Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppTranslations.of(context)!
                          .text('GENERAL', 'NO LOCATION SAVED'),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blackypeColor),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                    AppTranslations.of(context)!
                        .text('ADDRESS PAGE', 'ADD LOCATION'),
                    style: TextStyle(
                        fontSize: 12.sp, color: MainTheme.greyTypeColor),
                  ),
                )
              ],
            ));
      }

      return ListView.builder(
        itemCount: _authStore.addressList.length,
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        itemBuilder: (BuildContext context, int index) {
          AddressModel item = _authStore.addressList[index];
          return Container(
              margin: EdgeInsets.only(bottom: 15.w),
              child: ChooseAddressCard(
                isActive: item.isSelected!,
                typeName: item.typeName == null ? "" : item.typeName,
                address: item.buildingName == null ? "" : item.buildingName,
                streetName: item.streetName == null ? "" : item.streetName,
                phoneNo: item.phoneNumber == null ? "" : item.phoneNumber,
                onTap: () {
                  _authStore.toSelectAddress(index, item, widget.locationType!);
                  Navigator.pop(context);
                },
              ));
        },
      );
    });
  }

  /// This [_onBackButtonTap] fun is used to navigate to [checkout_page] 

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/checkout_page",
    );
    return Future.value(false);
  }
}
