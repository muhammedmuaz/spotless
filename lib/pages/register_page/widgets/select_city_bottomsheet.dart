import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/pages/address_page/widgets/address_category_card.dart';
import 'package:spotless/pages/register_page/widgets/city_fields.dart';
import 'package:spotless/shared/model/user/user.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/text_feild.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../enum.dart';
import '../../../locator.dart';
import '../../../shared/shimmers/select_city_shimmer.dart';
import '../../../store/auth_store/auth_store.dart';

class SelectCityBottomsheet extends StatefulWidget {
  const SelectCityBottomsheet({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectCityBottomsheet> createState() => _SelectCityBottomsheetState();
}

class _SelectCityBottomsheetState extends State<SelectCityBottomsheet> {
  final AuthStore _authStore = locator.get<AuthStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authStore.getCityList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainTheme.blueTypeOneColor,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 15.w,
        leading: Container(),
        elevation: 0,
        title: Text(
          "Select City",
          style: TextStyle(
              color: MainTheme.whiteTypeColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              child: CircleAvatar(
                radius: 12.sp,
                backgroundColor: MainTheme.whiteTypeColor,
                child: Icon(
                  Icons.close,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Observer(builder: (BuildContext context) {
        if (_authStore.cityListState == LoadingStatusEnum.loading &&
            _authStore.cityList.isEmpty) {
          return SelectCityShimmer();
        }

        if (_authStore.cityListState == LoadingStatusEnum.error) {
          return Container(
              height: MediaQuery.of(context).size.width,
              child: Center(
                  child: Text(
                'Something went wrong , Please Check Your Internet Connection',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )));
        }

        if (_authStore.cityList.isEmpty) {
          return Container(
              height: MediaQuery.of(context).size.width,
              child: Center(
                  child: Text(
                'No City Found',
                style: TextStyle(color: Colors.black),
              )));
        }

        return SingleChildScrollView(
          padding: EdgeInsets.only(left: 30.w, top: 30.h),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _authStore.cityList.length,
                itemBuilder: (BuildContext context, int index) {
                  CityModel item = _authStore.cityList[index];
                  return CityFields(
                    name: item.name,
                    isActive: item.isSelected,
                    onTap: () {
                      _authStore.toSelectCity(index, item);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
