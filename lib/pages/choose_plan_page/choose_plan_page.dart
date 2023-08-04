import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/enum.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/choose_plan_page/widgets/plan_card.dart';
import 'package:spotless/shared/model/product/product.model.dart';
import 'package:spotless/shared/shimmers/choose_plan-shimmer.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/no_connection_error_page.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/vendor_store/vendor_store.dart';

import '../../app_localizations.dart';

class ChoosePlanePage extends StatefulWidget {
  const ChoosePlanePage({Key? key}) : super(key: key);

  @override
  State<ChoosePlanePage> createState() => _ChoosePlanePageState();
}

class _ChoosePlanePageState extends State<ChoosePlanePage> {
  final VendorStore _vendorStore = locator.get<VendorStore>();
  final AuthStore _authStore = locator.get<AuthStore>();

  @override
  void initState() {
    super.initState();
    _vendorStore.getPlanPageList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (_vendorStore.choosePlanState == LoadingStatusEnum.loading
          // &&
          // _vendorStore.categoryList.isEmpty
          ) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: MainTheme.whiteTypeColor,
              elevation: 0,
              leading: Container(),
              leadingWidth: 0,
              automaticallyImplyLeading: false,
            ),
            body: ChoosePlanPageShimmer());
      }

      if (_vendorStore.choosePlanState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(
          onTap: () {
            _vendorStore.getPlanPageList();
          },
        );
      }

      if (_vendorStore.planList.isEmpty) {
        return Scaffold(
            appBar: CommonAppBar(
              color: Colors.white,
              showLeading: true,
              elevation: 0,
              name: AppTranslations.of(context)!
                  .text('CHOOSE A PLAN', 'CHOOSE A PLAN'),
              onTapLeading: () {
                _onBackButtonTap(context);
              },
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Text(
                  AppTranslations.of(context)!.text('GENERAL', 'NO DATA FOUND'),
                  style: TextStyle(color: Colors.black),
                ))));
      }

      return Scaffold(
          appBar: CommonAppBar(
            color: Colors.white,
            showLeading: true,
            elevation: 0,
            name: AppTranslations.of(context)!
                .text('CHOOSE A PLAN', 'CHOOSE A PLAN'),
            onTapLeading: () {
              _onBackButtonTap(context);
            },
          ),
          body: ListView.builder(
            itemCount: _vendorStore.planList.length,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            itemBuilder: (BuildContext context, int index) {
              PlanModel item = _vendorStore.planList[index];
              return PlanCard(
                name: item.name == null ? '' : item.name,
                price: item.price == null ? null : item.price,
                currencyCode: _authStore.currencyCode,
                credits: item.credits == null ? null : item.credits,
                durationType:
                    item.durationType == null ? '' : item.durationTypeName,
                isSelected: item.isSelected!,
                onTap: () {
                  _vendorStore.toSelectPlan(index, item);
                },
              );
            },
          ),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 33.w, right: 33.w, bottom: 3.h),
            // height: 40.h,
            child: CommonButton(
              name: AppTranslations.of(context)!.text('CHOOSE A PLAN', 'PLAN'),
              colorBtn: MainTheme.blueTypeOneColor,
              colorText: MainTheme.whiteTypeColor,
              textStyle: TextStyle(
                  color: MainTheme.whiteTypeColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
              height: 50.h,
              radius: BorderRadius.all(Radius.circular(30.sp)),
              onTap: () {
                goToconfiromPage();
              },
            ),
          ));
    });
  }

  /// This [goToconfiromPage] is used navigate to [confirom_plan_page]

  goToconfiromPage() {
    Navigator.pushNamed(context, '/confirom_plan_page');
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/cart_page",
    );
    return Future.value(false);
  }
}
