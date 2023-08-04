import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';

import 'package:spotless/pages/manage_address_page/widgets/manage_address_card.dart';
import 'package:spotless/shared/shimmers/address_shimmer.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/address_bottom_sheet.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/model/user/user.model.dart';
import '../../shared/widgets/no_connection_error_page.dart';

class ManageAddressPage extends StatefulWidget {
  const ManageAddressPage({Key? key}) : super(key: key);

  @override
  State<ManageAddressPage> createState() => _manageAddressPageState();
}

class _manageAddressPageState extends State<ManageAddressPage> {
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
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (BuildContext context) {
      if (_authStore.manageAddressPageState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(
          onTap: () {
            _authStore.getAddressList();
          },
        );
      }
      return Scaffold(
        appBar: CommonAppBar(
          color: Colors.white,
          showLeading: true,
          leadingWidth: 80.w,
          leadingPadding: const EdgeInsets.all(5),
          elevation: 0,
          name: AppTranslations.of(context)!.text('ADDRESS PAGE', 'ADDRESS'),
          onTapLeading: () {
            _onBackButtonTap(context);
          },
        ),
        body: getAddress(false),
        floatingActionButton: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            addressBottomSheet(isAdd: true);
          },
          child: CircleAvatar(
            radius: 24.sp,
            backgroundColor: MainTheme.blueTypeOneColor,
            child: WebsafeSvg.asset('assets/images/add_floating.svg',
                width: 24.w, height: 24.h),
          ),
        ),
      );
    }));
  }

  /// This [addressBottomSheet] fun is used for returen a bottom sheet

  addressBottomSheet({bool isAdd = true, AddressModel? item}) {
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
            height: 590.h,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.sp),
                    topRight: Radius.circular(12.sp)),
                child: AddressBottomsheet(
                  isAdd: isAdd,
                  item: item,
                )),
          );
        });
  }

  /// This [getAddress] fun is used for returen a widget

  Widget getAddress(bool isEmpty) {
    return Observer(builder: (BuildContext context) {
      if (_authStore.manageAddressPageState == LoadingStatusEnum.loading) {
        return AddressPageShimmer();
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
                          .text('ADDRESS PAGE', 'NO LOCATION SAVED'),
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
              child: ManageAddressCard(
                  typeName: item.typeName == null ? "" : item.typeName,
                  address: item.buildingName == null ? "" : item.buildingName,
                  streetName: item.streetName == null ? "" : item.streetName,
                  phoneNo: item.phoneNumber == null ? "" : item.phoneNumber,
                  onTap: () {
                    addressBottomSheet(isAdd: false, item: item);
                  }));
        },
      );
    });
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/profile_page",
    );
    return Future.value(false);
  }
}
