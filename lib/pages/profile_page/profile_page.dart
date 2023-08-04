import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/profile_page/widgets/expered_card.dart';
import 'package:spotless/pages/profile_page/widgets/menu_card.dart';
import 'package:spotless/pages/profile_page/widgets/user_card.dart';
import 'package:spotless/pages/profile_page/widgets/user_card_plan_empty.dart';
import 'package:spotless/shared/widgets/bottom_tab_bar.dart';
import 'package:spotless/shared/widgets/log_out_alert.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/shimmers/customer_card_shimmer.dart';
import '../../shared/shimmers/expires_card_shimmer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final CartStore _cartStore = locator.get<CartStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authStore.getProfileData();
    _cartStore.getOneActivePlan(token: _authStore.accessToken);
    _cartStore.checkPlanIsExpired(token: _authStore.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (BuildContext context) {
      return Scaffold(
          body: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16.w,
                top: 50.h,
                right: 16.w,
              ),
              child: Column(
                children: [
                  Observer(builder: (BuildContext context) {
                    if (_authStore.profilePageState ==
                            LoadingStatusEnum.loading ||
                        _cartStore.activePlanState ==
                            LoadingStatusEnum.loading) {
                      return CustomerCardShimmer();
                    }

                    if (_authStore.profilePageState ==
                            LoadingStatusEnum.error ||
                        _cartStore.activePlanState == LoadingStatusEnum.error) {
                      return Container(
                          height: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            'Something went wrong , Please Check Your Internet Connection',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          )));
                    }

                    if (_cartStore.activePlan?.value.planeStatus == 0) {
                      return UserCardPlanEmpty(
                        image: _authStore.appUser?.value.imageUrl == null
                            ? null
                            : _authStore.appUser!.value.imageUrl,
                        name: _authStore.appUser?.value.name == null
                            ? ""
                            : _authStore.appUser!.value.name,
                        emailId: _authStore.appUser?.value.email == null
                            ? ""
                            : _authStore.appUser!.value.email,
                      );
                    }

                    return Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        child: UserCard(
                          image: _authStore.appUser?.value.imageUrl == null
                              ? null
                              : _authStore.appUser!.value.imageUrl,
                          name: _authStore.appUser?.value.name == null
                              ? ""
                              : _authStore.appUser!.value.name,
                          emailId: _authStore.appUser?.value.email == null
                              ? ""
                              : _authStore.appUser!.value.email,
                          subscriptionName: _cartStore
                                      .activePlan?.value.subscriptionName ==
                                  null
                              ? ""
                              : _cartStore.activePlan!.value.subscriptionName,
                          subscriptionCode: _authStore.currencyCode == null &&
                                  _cartStore.activePlan?.value
                                          .subscriptionPrice ==
                                      null &&
                                  _cartStore
                                          .activePlan?.value.durationTypeName ==
                                      null
                              ? ""
                              : "${_authStore.currencyCode}${_cartStore.activePlan?.value.subscriptionPrice}/${_cartStore.activePlan?.value.durationTypeName}",
                          validityDate: _cartStore
                                      .activePlan?.value.validTill ==
                                  null
                              ? ""
                              : "${AppTranslations.of(context)!.text('MY CART', 'VALID TIll')} : ${_cartStore.activePlan!.value.validTill}",
                          totalQtyCount: _cartStore
                                      .activePlan?.value.totalQty ==
                                  null
                              ? ''
                              : "${_cartStore.activePlan!.value.totalQty} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                          usedQtyCount: _cartStore.activePlan?.value.usedQty ==
                                  null
                              ? ""
                              : "${_cartStore.activePlan!.value.usedQty} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                          remainningQtyCount: _cartStore
                                      .activePlan?.value.balanceQty ==
                                  null
                              ? ""
                              : "${_cartStore.activePlan!.value.balanceQty} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                        ));
                  }),
                  if (_cartStore.activePlan?.value.planeStatus == 1)
                    Observer(builder: (BuildContext context) {
                      if (_cartStore.expiredPlanState ==
                          LoadingStatusEnum.loading) {
                        return ExpiresCardShimmer();
                      }
                      if (_cartStore.expiredPlanState ==
                          LoadingStatusEnum.error) {
                        return Container(
                            height: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Text(
                              'Something went wrong , Please Check Your Internet Connection',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )));
                      }
                      if (_cartStore.expiredValue == 1) {
                        return ExparedCard();
                      }
                      return Container();
                    }),
                  Container(
                    margin: EdgeInsets.only(top: 23.5.h),
                    child: MenuCard(
                      name: AppTranslations.of(context)!
                          .text('PROFILE PAGE', 'MY ORDERS'),
                      isEnd: false,
                      onTap: () {
                        Navigator.pushNamed(context, '/my_order_page');
                      },
                    ),
                  ),
                  MenuCard(
                    name: AppTranslations.of(context)!
                        .text('PROFILE PAGE', 'MANAGE ADDRESS'),
                    isEnd: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/manage_address_page');
                    },
                  ),
                  MenuCard(
                    name: AppTranslations.of(context)!
                        .text('PROFILE PAGE', 'REFERRAL'),
                    isEnd: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/referral_history_page');
                    },
                  ),
                  MenuCard(
                    name: AppTranslations.of(context)!
                        .text('PROFILE PAGE', 'EDIT PROFILE'),
                    isEnd: false,
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_profile_page');
                    },
                  ),
                  MenuCard(
                    name: AppTranslations.of(context)!.text('LOGOUT', 'LOGOUT'),
                    isEnd: true,
                    onTap: () {
                      showLogOutAlert();
                    },
                  ),
                ],
              )),
          bottomNavigationBar: const BottomTabBar(
            currentIndex: 3,
          ));
    }));
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
    return Future.value(false);
  }

  /// This [showLogOutAlert] is used to show the [Dialog] box of Log out infom

  void showLogOutAlert() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return const LogOutAlert();
        });
  }
}
