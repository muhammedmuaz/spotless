/// This [BottomTabBar] class is a common [BottomNavigation] bar for all pages

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

class BottomTabBar extends StatefulWidget {
  final int? currentIndex;

  const BottomTabBar({Key? key, @required this.currentIndex}) : super(key: key);

  @override
  _BottomTabBar createState() => _BottomTabBar();
}

class _BottomTabBar extends State<BottomTabBar> {
  CartStore _cartStore = locator.get<CartStore>();

  int? _currentTabIndex;

  @override
  void initState() {
    super.initState();
    _currentTabIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(color: MainTheme.greyTypeFiveColor, width: .2)),
      ),
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            // color: MainTheme.greyTypeColor,
          ),
          padding: EdgeInsets.only(top: 8.h, bottom: .5.h),
          height: 50.h,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _onTapped(0);
                    },
                    child: _currentTabIndex == 0
                        ? WebsafeSvg.asset(
                            'assets/images/home.svg',
                            height: 32.h,
                            width: 21.w,
                          )
                        : WebsafeSvg.asset(
                            'assets/images/deactive_home.svg',
                            height: 32.h,
                            width: 21.w,
                          )),
                InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _onTapped(1);
                    },
                    child: WebsafeSvg.asset('assets/images/clipboard-text.svg',
                        height: 32.h,
                        width: 21.w,
                        color: _currentTabIndex == 1
                            ? MainTheme.blueTypeOneColor
                            : MainTheme.greyTypeOneColor)),
                Observer(builder: (BuildContext context) {
                  return InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _onTapped(2);
                      },
                      child: _cartStore.cartItemList.length <= 0
                          ? WebsafeSvg.asset(
                              'assets/images/bag_inActive.svg',
                              height: 32.h,
                              width: 21.w,
                            )
                          : WebsafeSvg.asset(
                              'assets/images/bag.svg',
                              height: 32.h,
                              width: 21.w,
                            ));
                }),
                InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _onTapped(3);
                    },
                    child: WebsafeSvg.asset('assets/images/user.svg',
                        height: 32.h,
                        width: 21.w,
                        color: _currentTabIndex == 3
                            ? MainTheme.blueTypeOneColor
                            : MainTheme.greyTypeOneColor)),
              ])),
    );
  }

  /// This [_onTapped] is used for [switch]
  /// this switch cases are used for navigation of bottom navigation

  _onTapped(int pageIndex) {
    String page;
    if (widget.currentIndex == pageIndex) return;

    switch (pageIndex) {
      case 0:
        {
          page = "/home_page";
          break;
        }
      case 1:
        {
          page = "/all_service_page";
          break;
        }

      case 2:
        {
          page = "/cart_page";
          break;
        }
      case 3:
        {
          page = "/profile_page";
          break;
        }

      case 4:
        {
          page = "/timeout_page";
          break;
        }

      default:
        {
          page = "/home_page";
          break;
        }
    }
    setState(() {
      _currentTabIndex = pageIndex;
    });

    Navigator.pushReplacementNamed(
      context,
      page,
    );
  }
}
