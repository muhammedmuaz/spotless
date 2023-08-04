import 'package:bot_toast/bot_toast.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/cart_page/widgets/subscription_card.dart';
import 'package:spotless/pages/checkout_page/widgets/address_card.dart';
import 'package:spotless/pages/home_page/widgets/header_card.dart';
import 'package:spotless/shared/model/user/user.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../app_localizations.dart';
import '../../enum.dart';
import '../../provider/order.provider.dart';
import '../../shared/helper/helper.dart';
import '../../shared/model/product/product.model.dart';
import '../../shared/shimmers/active_plan_shimmer.dart';
import '../../shared/widgets/date_picker_input.dart';
import '../cart_page/widgets/active_plan.dart';
import '../cart_page/widgets/empty_subscription_card.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final CartStore _cartStore = locator.get<CartStore>();
  TextEditingController _dobInputCtrl = TextEditingController();
  DateTime? selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _authStore.getAddressList();
    _cartStore.getOneActivePlan(token: _authStore.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return WillPopScope(
      onWillPop: () {
        return _onBackButtonTap(context);
      },
      child: Scaffold(
        appBar: CommonAppBar(
          color: Colors.white,
          showLeading: true,
          elevation: 0,
          leadingWidth: 80.w,
          leadingPadding: const EdgeInsets.all(5),
          name: AppTranslations.of(context)!.text('CHECK OUT', 'CHECK OUT'),
          onTapLeading: () {
            _onBackButtonTap(context);
          },
        ),
        body: Observer(builder: (BuildContext context) {
          return SingleChildScrollView(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
              child: Column(
                children: [
                  Observer(builder: (context) {
                    if (_cartStore.activePlanState ==
                        LoadingStatusEnum.loading) {
                      return ActivePlanShimmer();
                    }

                    if (_cartStore.activePlanState == LoadingStatusEnum.error) {
                      return Center(
                          child: Text(
                        AppTranslations.of(context)!
                            .text('GENERAL', 'SOMETHING WENT WRONG'),
                        style: TextStyle(color: Colors.black),
                      ));
                    }

                    if (_cartStore.activePlan!.value.planeStatus == 0) {
                      return EmptySubScriptionCard(
                        isAdd: false,
                        onTap: () {
                          // goToPlanPage();
                        },
                      );
                    }

                    return ActivePlan(
                        dateOfValidity: _cartStore
                                    .activePlan?.value.validTill ==
                                null
                            ? ""
                            : _cartStore.activePlan!.value.validTill,
                        reminningQty:
                            _cartStore.activePlan?.value.balanceQty ==
                                    null
                                ? ""
                                : "${_cartStore.activePlan!.value.balanceQty}",
                        subscriptionCode: _authStore
                                        .currencyCode ==
                                    null &&
                                _cartStore
                                        .activePlan?.value.subscriptionPrice ==
                                    null &&
                                _cartStore
                                        .activePlan?.value.durationTypeName ==
                                    null
                            ? ""
                            : "${_authStore.currencyCode}${_cartStore.activePlan!.value.subscriptionPrice}/${_cartStore.activePlan!.value.durationTypeName}",
                        subscriptionName:
                            _cartStore.activePlan?.value.subscriptionName ==
                                    null
                                ? ""
                                : _cartStore.activePlan!.value.subscriptionName,
                        totalQty: _cartStore.activePlan?.value.totalQty == null
                            ? ""
                            : "${_cartStore.activePlan!.value.totalQty}",
                        usedQty: _cartStore.activePlan?.value.usedQty == null
                            ? ""
                            : "${_cartStore.activePlan!.value.usedQty}");
                  }),

                  // const SubscriptionCard(
                  //   subscriptionName: "Subscription Name",
                  //   subscriptionCode: "XAF25/M",
                  //   dateOfValidity: "29-11-2022",
                  //   totalQty: "18",
                  //   usedQty: "22",
                  //   reminningQty: '33',
                  // ),

                  Container(
                    margin: EdgeInsets.only(
                      top: 18.h,
                      bottom: 10.5.h,
                    ),
                    child: HeaderCard(
                      isMargin: false,
                      name: AppTranslations.of(context)!
                          .text('CHECK OUT', 'PICK UP'),
                      actionName: AppTranslations.of(context)!
                          .text('CHECK OUT', 'CHANGE'),
                      actionOnTap: () {
                        goToAddressPage("PICKUP");
                      },
                    ),
                  ),
                  _authStore.selectedPickUplocations == null
                      ? Observer(builder: (BuildContext context) {
                          if (_authStore.manageAddressPageState ==
                              LoadingStatusEnum.loading) {
                            return ActivePlanShimmer(
                              height: 101,
                            );
                          }

                          if (_authStore.addressList.isEmpty) {
                            return Container(
                                height: 101.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppTranslations.of(context)!.text(
                                              'CHECK OUT', 'NO SAVED LOCATION'),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: MainTheme.blackypeColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      child: Text(
                                        AppTranslations.of(context)!
                                            .text('CHECK OUT', 'ADD LOCATIONS'),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: MainTheme.greyTypeColor),
                                      ),
                                    )
                                  ],
                                ));
                          }

                          if (_authStore.manageAddressPageState ==
                              LoadingStatusEnum.error) {
                            return Container(
                                height: 101.h,
                                child: Center(
                                    child: Text(
                                  AppTranslations.of(context)!
                                      .text('GENERAL', 'SOMETHING WENT WRONG'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )));
                          }
                          return AddressCard(
                            typeName:
                                _authStore.addressList.last.typeName == null
                                    ? ""
                                    : _authStore.addressList.last.typeName,
                            address:
                                _authStore.addressList.last.buildingName == null
                                    ? ""
                                    : _authStore.addressList.last.buildingName,
                            streetName:
                                _authStore.addressList.last.streetName == null
                                    ? ""
                                    : _authStore.addressList.last.streetName,
                            phoneNo:
                                _authStore.addressList.last.phoneNumber == null
                                    ? ""
                                    : _authStore.addressList.last.phoneNumber,
                          );
                        })
                      : Observer(builder: (BuildContext context) {
                          return AddressCard(
                            typeName: _authStore
                                        .selectedPickUplocations?.typeName ==
                                    null
                                ? ""
                                : _authStore.selectedPickUplocations!.typeName,
                            address: _authStore.selectedPickUplocations
                                        ?.buildingName ==
                                    null
                                ? ""
                                : _authStore
                                    .selectedPickUplocations!.buildingName,
                            streetName: _authStore
                                        .selectedPickUplocations?.streetName ==
                                    null
                                ? ""
                                : _authStore
                                    .selectedPickUplocations!.streetName,
                            phoneNo: _authStore
                                        .selectedPickUplocations?.phoneNumber ==
                                    null
                                ? ""
                                : _authStore
                                    .selectedPickUplocations!.phoneNumber,
                          );
                        }),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20.h,
                        margin: EdgeInsets.only(bottom: 9.h, top: 18.h),
                        child: Text(
                          AppTranslations.of(context)!
                              .text('CHECK OUT', 'PICK UP TIME'),
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: MainTheme.blackypeColor,
                              shadows: const [
                                Shadow(
                                    color: MainTheme.blackTypeColor,
                                    blurRadius: .7)
                              ]),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    // margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
                    padding: EdgeInsets.only(left: 14.w, right: 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              showCalendarPicker();
                            },
                            child: Row(
                              children: [
                                Container(
                                  // width: 119.w,
                                  height: 30.h,
                                  padding: EdgeInsets.only(
                                      left: 6.w,
                                      top: 5.h,
                                      bottom: 5.h,
                                      right: 9.w),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.sp)),
                                    color: MainTheme.whiteTypeColor,
                                    border: Border.all(
                                      color: MainTheme.greyTypeColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      WebsafeSvg.asset(
                                          'assets/images/calendar.svg'),
                                      Text(
                                        selectedDate == null
                                            ? " Select Date "
                                            : "${DateFormat('EEEE').format(selectedDate!)}",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: MainTheme.blackypeColor,
                                        ),
                                      ),
                                      WebsafeSvg.asset(
                                          'assets/images/arrow-down.svg')
                                    ],
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 42.h,
                          child: const VerticalDivider(
                            color: MainTheme.greyTypeOneColor,
                            thickness: 1,
                            // width: 2.w,
                            indent: 5,
                            endIndent: 10,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 119.w,
                                height: 30.h,
                                padding: EdgeInsets.only(
                                    left: 6.w,
                                    top: 5.h,
                                    bottom: 5.h,
                                    right: 9.w),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.sp)),
                                  color: MainTheme.whiteTypeColor,
                                  border: Border.all(
                                    color: MainTheme.greyTypeColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WebsafeSvg.asset('assets/images/clock.svg'),
                                    Text(
                                      "${localizations.formatTimeOfDay(selectedTime)}",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: MainTheme.blackypeColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 13.h, top: 13.h),
                    child: HeaderCard(
                      isMargin: false,
                      name: AppTranslations.of(context)!
                          .text('CHECK OUT', 'DELIVERY LOCATION'),
                      actionName: AppTranslations.of(context)!
                          .text('CHECK OUT', 'CHANGE'),
                      actionOnTap: () {
                        goToAddressPage("DELIVERY");
                      },
                    ),
                  ),
                  _authStore.selectedDeliverylocations == null
                      ? Observer(builder: (BuildContext context) {
                          if (_authStore.manageAddressPageState ==
                              LoadingStatusEnum.loading) {
                            return ActivePlanShimmer(
                              height: 101,
                            );
                          }

                          if (_authStore.addressList.isEmpty) {
                            return Container(
                                height: 101.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppTranslations.of(context)!.text(
                                              'CHECK OUT', 'NO SAVED LOCATION'),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: MainTheme.blackypeColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      child: Text(
                                        AppTranslations.of(context)!
                                            .text('CHECK OUT', 'ADD LOCATIONS'),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: MainTheme.greyTypeColor),
                                      ),
                                    )
                                  ],
                                ));
                          }

                          if (_authStore.manageAddressPageState ==
                              LoadingStatusEnum.error) {
                            return Container(
                                height: 101.h,
                                child: Center(
                                    child: Text(
                                  AppTranslations.of(context)!
                                      .text('GENERAL', 'SOMETHING WENT WRONG'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )));
                          }
                          return AddressCard(
                            typeName:
                                _authStore.addressList.last.typeName == null
                                    ? ""
                                    : _authStore.addressList.last.typeName,
                            address:
                                _authStore.addressList.last.buildingName == null
                                    ? ""
                                    : _authStore.addressList.last.buildingName,
                            streetName:
                                _authStore.addressList.last.streetName == null
                                    ? ""
                                    : _authStore.addressList.last.streetName,
                            phoneNo:
                                _authStore.addressList.last.phoneNumber == null
                                    ? ""
                                    : _authStore.addressList.last.phoneNumber,
                          );
                        })
                      : Observer(builder: (BuildContext context) {
                          return AddressCard(
                            typeName: _authStore
                                        .selectedDeliverylocations?.typeName ==
                                    null
                                ? ""
                                : _authStore
                                    .selectedDeliverylocations!.typeName,
                            address: _authStore.selectedDeliverylocations
                                        ?.buildingName ==
                                    null
                                ? ""
                                : _authStore
                                    .selectedDeliverylocations!.buildingName,
                            streetName: _authStore.selectedDeliverylocations
                                        ?.streetName ==
                                    null
                                ? ""
                                : _authStore
                                    .selectedDeliverylocations!.streetName,
                            phoneNo: _authStore.selectedDeliverylocations
                                        ?.phoneNumber ==
                                    null
                                ? ""
                                : _authStore
                                    .selectedDeliverylocations!.phoneNumber,
                          );
                        })
                ],
              ));
        }),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 33.w, right: 33.w, bottom: 10.h),
          child: Container(
              margin: EdgeInsets.only(top: 32.h),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.h,
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
                      borderRadius: BorderRadius.all(Radius.circular(30.sp)),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  color: MainTheme.blueTypeOneColor,
                  child: Observer(builder: (BuildContext context) {
                    if (_cartStore.createdOrderState ==
                        LoadingStatusEnum.loading) {
                      return SizedBox(
                        height: 30.h,
                        child: LoadingIndicator(
                          colors: [Colors.white],
                          indicatorType: Indicator.lineScalePulseOutRapid,
                        ),
                      );
                    }
                    return Text(
                      AppTranslations.of(context)!
                          .text('CHECK OUT', 'PLACE ORDER'),
                      style: TextStyle(
                          color: MainTheme.whiteTypeColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    );
                  }),
                  onPressed: () {
                    if (_cartStore.activePlan?.value.planeStatus == 0) {
                      BotToast.showText(
                          text: "You have No Plane",
                          duration: Duration(seconds: 5));
                    } else {
                      goToCheckoutSucessPage();
                    }
                  },
                ),
              )),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.dial,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    TimeOfDay? timeNow = TimeOfDay.now();
    DateTime? datecheck = DateTime.now();

    print(
        "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ${datecheck}");
    print(
        "#################################################################### ${selectedDate}");

    print(
        "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${datecheck.compareTo(selectedDate!)}");

    // print(
    //     "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${DateTime.now().isAfter(selected)}");

    if (datecheck.compareTo(selectedDate!) == -1) {
      if (picked_s != null) {
        setState(() {
          selectedTime = picked_s;
        });
      } else {
        setState(() {
          selectedTime = timeNow;
        });
      }
    } else {
      if (picked_s != null &&
          timeNow.hour <= picked_s.hour &&
          timeNow.minute <= picked_s.minute) {
        setState(() {
          selectedTime = picked_s;
        });
      } else {
        setState(() {
          selectedTime = timeNow;
        });
        BotToast.showText(
            text: "Please Choose Different Time",
            duration: Duration(seconds: 5));
      }
    }
  }

  Future<void> showCalendarPicker() async {
    final DateTime? picked = await showDatePicker(
      helpText: selectedDate == null
          ? "${DateTime.now().year}"
          : '${selectedDate!.year}',
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 100)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(0, 160, 218, 1),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color.fromRGBO(0, 160, 218, 1), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  /// This [_onBackButtonTap] is used to navigate to [cart_page]

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/cart_page",
    );
    return Future.value(false);
  }

  /// This [goToAddressPage] is used to navigate to [address_page]

  goToAddressPage(String locationType) {
    Navigator.pushNamed(context, '/address_page', arguments: locationType);
  }

  /// This [goToCheckoutSucessPage] fun is used to place order
  /// It will pass the [_input] para to [createItemOrder] function inside the [_cartStore]
  /// in this fun their is some coding chack are preformed

  goToCheckoutSucessPage() {
    if (_authStore.addressList.isNotEmpty) {
      DateTime? presentDate = DateTime.now();
      if (presentDate.compareTo(selectedDate!) == -1) {
        if (selectedTime != null) {
          CreateOrderDto _input = CreateOrderDto(
            totalCredits: _cartStore.cartTotalCredit.toInt(),
            deliveryAddress: _authStore.selectedDeliverylocations?.id == null
                ? _authStore.addressList[0].id
                : _authStore.selectedDeliverylocations!.id,
            pickupAddress: _authStore.selectedPickUplocations?.id == null
                ? _authStore.addressList[0].id
                : _authStore.selectedPickUplocations!.id,
            deliveryDate: formattedDate(presentDate),
            pickupDate: formattedDate(selectedDate!),
            pickupTime: "${selectedTime.hour}:${selectedTime.minute}:0",
            orderDate: formattedDate(presentDate),
            orderDetails:
                List<ServiceDtoModel>.from(_cartStore.cartItemList.map((e) {
              return ServiceDtoModel(
                id: e.id,
                name: e.name,
                credits: e.itemCredit,
                quantity: e.quantity,
              );
            })),
          );
          _cartStore.createItemOrder(_input, context, _authStore.accessToken!);
        } else {
          BotToast.showText(
              text: "Please Choose Pick-Up Time",
              duration: Duration(seconds: 5));
        }
      } else {
        if (selectedTime != null &&
            presentDate.hour <= selectedTime.hour &&
            presentDate.minute <= selectedTime.minute) {
          CreateOrderDto _input = CreateOrderDto(
            totalCredits: _cartStore.cartTotalCredit.toInt(),
            deliveryAddress: _authStore.selectedDeliverylocations?.id == null
                ? _authStore.addressList[0].id
                : _authStore.selectedDeliverylocations!.id,
            pickupAddress: _authStore.selectedPickUplocations?.id == null
                ? _authStore.addressList[0].id
                : _authStore.selectedPickUplocations!.id,
            deliveryDate: formattedDate(presentDate),
            pickupDate: formattedDate(selectedDate!),
            pickupTime: "${selectedTime.hour}:${selectedTime.minute}:0",
            orderDate: formattedDate(presentDate),
            orderDetails:
                List<ServiceDtoModel>.from(_cartStore.cartItemList.map((e) {
              return ServiceDtoModel(
                id: e.id,
                name: e.name,
                credits: e.itemCredit,
                quantity: e.quantity,
              );
            })),
          );
          _cartStore.createItemOrder(_input, context, _authStore.accessToken!);
        } else {
          BotToast.showText(
              text: "Please Choose Different Pick-Up Time",
              duration: Duration(seconds: 5));
        }
      }
    } else {
      BotToast.showText(
          text: "Please Select Address Or Add Address",
          duration: Duration(seconds: 5));
    }
  }

  /// This [formattedDate] is used to get formated date from [DateFormat]
  /// it will reture a string value 

  String? formattedDate(DateTime item) {
    DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
    return _dateFormat.format(item);
  }
}
