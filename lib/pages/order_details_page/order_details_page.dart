import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:spotless/pages/manage_address_page/widgets/manage_address_card.dart';
import 'package:spotless/pages/order_details_page/widgets/cancel_item.dart';
import 'package:spotless/pages/order_details_page/widgets/item_card.dart';
import 'package:spotless/pages/order_details_page/widgets/order_item_card.dart';
import 'package:spotless/shared/model/order/order.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/address_bottom_sheet.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../app_localizations.dart';
import '../../enum.dart';
import '../../locator.dart';
import '../../shared/shimmers/order_details_shimmer.dart';
import '../../store/auth_store/auth_store.dart';

class OrderDetailsPage extends StatefulWidget {
  final OrderModel? item;
  const OrderDetailsPage({Key? key, this.item}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final CartStore _cartStore = locator.get<CartStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartStore.viewOrderDetails(
        token: _authStore.accessToken, orderId: widget.item!.id);
  }

  String? formattedDate(DateTime item) {
    DateFormat _dateFormat = DateFormat('MMM d');
    return _dateFormat.format(item);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (BuildContext context) {
      if (_cartStore.orderViewPageState == LoadingStatusEnum.loading) {
        return Scaffold(
            body: SingleChildScrollView(
                padding: EdgeInsets.only(top: kToolbarHeight + 20),
                child: OrderDetailsShimmer()));
      }

      return Scaffold(
          appBar: CommonAppBar(
            color: Colors.white,
            showLeading: true,
            elevation: 0,
            leadingWidth: 80.w,
            leadingPadding: const EdgeInsets.all(5),
            name: widget.item!.orderId,
            showAction: true,
            actionIcon: Container(
                margin: EdgeInsets.only(right: 16.w, top: 23.h),
                child: Text(
                  formattedDate(widget.item!.createdAt!)!,
                  style: TextStyle(
                      fontSize: 12.sp, color: MainTheme.greyTypeColor),
                )),
            onTapAction: () {},
            onTapLeading: () {
              _onBackButtonTap(context);
            },
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12.h, top: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppTranslations.of(context)!
                            .text('ORDER DETAILS', 'ORDER STATUS'),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            shadows: const [
                              Shadow(
                                  color: MainTheme.blackypeColor,
                                  blurRadius: .5)
                            ],
                            color: MainTheme.blackypeColor),
                      ),
                      // InkWell(
                      //   hoverColor: Colors.transparent,
                      //   splashColor: Colors.transparent,
                      //   highlightColor: Colors.transparent,
                      //   onTap: () {
                      //     // widget.actionOnTap!();
                      //     goToTrackOrderPage();
                      //   },
                      //   child: Text(
                      //     AppTranslations.of(context)!
                      //         .text('ORDER DETAILS', 'TRACK ORDER'),
                      //     style: TextStyle(
                      //         fontSize: 10.sp,
                      //         fontWeight: FontWeight.w500,
                      //         shadows: const [
                      //           Shadow(
                      //               color: MainTheme.blueTypeOneColor,
                      //               blurRadius: .5)
                      //         ],
                      //         color: MainTheme.blueTypeOneColor),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.h,
                  child: ListView.builder(
                    itemCount: 9,
                    padding: EdgeInsets.only(left: 3.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (widget.item!.status == 3) {
                        return CancelItem(
                          oderStatus: widget.item?.status == null ? 0 : 1,
                          index: index,
                          isEnd: index == 8 ? true : false,
                        );
                      }
                      return OrderItemCard(
                        oderStatus: widget.item?.status == null
                            ? 0
                            : widget.item!.status,
                        index: index,
                        isEnd: index == 8 ? true : false,
                      );
                    },
                  ),
                ),
                orderStatusImage(widget.item!.status!),
                Container(
                  margin: EdgeInsets.only(top: 21.h, bottom: 13.w),
                  child: Row(
                    children: [
                      Text(
                        AppTranslations.of(context)!
                            .text('ORDER DETAILS', 'YOUR ORDERS'),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Observer(builder: (BuildContext context) {
                  return ListView.builder(
                    itemCount:
                        _cartStore.orderItemDetails?.value.orderDetails?.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      OrderDetailsModel? item = _cartStore
                          .orderItemDetails!.value.orderDetails![index];
                      return ItemCard(
                        name: item.name == null ? "" : item.name,
                        serviceName: item.service?.category?.name == null
                            ? ""
                            : item.service!.category!.name,
                        qty: item.quantity == null ? 0 : item.quantity,
                        isEnd: index ==
                                _cartStore.orderItemDetails!.value.orderDetails!
                                        .length -
                                    1
                            ? true
                            : false,
                      );
                    },
                  );
                }),
                Container(
                  margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                  child: const DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: MainTheme.greyTypeOneColor,
                    dashRadius: 0.0,
                    dashGapLength: 8.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${AppTranslations.of(context)!.text('ORDER DETAILS', 'T QTY')} :",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blackypeColor),
                    ),
                    Text(
                      _cartStore.orderItemDetails?.value.totalCredits == null
                          ? ""
                          : "${_cartStore.orderItemDetails!.value.totalCredits} ${AppTranslations.of(context)!.text('REFERRAL', 'CREDIT')}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blackypeColor),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Row(
                    children: [
                      Text(
                        AppTranslations.of(context)!
                            .text('CHECK OUT', 'PICK UP'),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: MainTheme.blackypeColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: ManageAddressCard(
                    isEditActive: false,
                    typeName: _cartStore.orderItemDetails?.value.pickupAddress
                                ?.typeName ==
                            null
                        ? ""
                        : _cartStore
                            .orderItemDetails!.value.pickupAddress!.typeName,
                    address: _cartStore.orderItemDetails?.value.pickupAddress!
                                .buildingName ==
                            null
                        ? ""
                        : _cartStore.orderItemDetails!.value.pickupAddress!
                            .buildingName,
                    streetName: _cartStore.orderItemDetails?.value.pickupAddress
                                ?.streetName ==
                            null
                        ? ""
                        : _cartStore
                            .orderItemDetails!.value.pickupAddress?.streetName,
                    phoneNo: _cartStore.orderItemDetails?.value.pickupAddress!
                                .phoneNumber ==
                            null
                        ? ""
                        : _cartStore
                            .orderItemDetails!.value.pickupAddress!.phoneNumber,
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.h),
                  child: Row(
                    children: [
                      Text(
                        AppTranslations.of(context)!
                            .text('ORDER DETAILS', 'DELIVERY LOCATION'),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: MainTheme.blackypeColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: ManageAddressCard(
                    isEditActive: false,
                    typeName: _cartStore.orderItemDetails?.value.deliveryAddress
                                ?.typeName ==
                            null
                        ? ""
                        : _cartStore
                            .orderItemDetails!.value.deliveryAddress!.typeName,
                    address: _cartStore.orderItemDetails?.value.deliveryAddress!
                                .buildingName ==
                            null
                        ? ""
                        : _cartStore.orderItemDetails!.value.deliveryAddress!
                            .buildingName,
                    streetName: _cartStore.orderItemDetails?.value
                                .deliveryAddress!.streetName ==
                            null
                        ? ""
                        : _cartStore.orderItemDetails!.value.deliveryAddress!
                            .streetName,
                    phoneNo: _cartStore.orderItemDetails?.value.deliveryAddress!
                                .phoneNumber ==
                            null
                        ? ""
                        : _cartStore.orderItemDetails!.value.deliveryAddress!
                            .phoneNumber,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 30.h,
                )
              ])));
    }));
  }

  /// this [addressBottomSheet] fun is used to show thebottom sheet

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

  // goToTrackOrderPage() {
  //   Navigator.pushNamed(context, '/track_order_page', arguments: step);
  // }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(context, "/my_order_page");
    return Future.value(false);
  }

  /// this [orderStatusImage] fun is used to shoe the image of the corresponding status

  Widget orderStatusImage(int step) {
    Widget stepCard = Container();
    switch (step) {
      case 0:
        stepCard = Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
              child: WebsafeSvg.asset('assets/images/pending.svg',
                  width: 200.w, height: 200.h),
            ),
            Text(
              AppTranslations.of(context)!.text('ORDER DETAILS', 'PENDING'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
        break;
      case 1:
        stepCard = Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
              child: Image.asset('assets/images/Accepted.png',
                  width: 200.w, height: 200.h),
            ),
            Text(
              AppTranslations.of(context)!.text('ORDER DETAILS', 'ACCEPTED'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
        break;
      case 2:
        stepCard = Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
              child: WebsafeSvg.asset('assets/images/out.svg',
                  width: 200.w, height: 200.h),
            ),
            Text(
              AppTranslations.of(context)!
                  .text('ORDER DETAILS', 'OUT FOR PICK UP'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
        break;
      case 3:
        stepCard = Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
              child: Image.asset('assets/images/rejected.png',
                  width: 200.w, height: 200.h),
            ),
            Text(
              AppTranslations.of(context)!.text('ORDER DETAILS', 'REJECTED'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
        break;
      case 4:
        stepCard = Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
              child: WebsafeSvg.asset('assets/images/processing.svg',
                  width: 200.w, height: 200.h),
            ),
            Text(
              AppTranslations.of(context)!.text('ORDER DETAILS', 'PROCESSING'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
        break;
      case 5:
        stepCard = Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
              child: WebsafeSvg.asset('assets/images/ready-to-delivery.svg',
                  width: 200.w, height: 200.h),
            ),
            Text(
              AppTranslations.of(context)!
                  .text('ORDER DETAILS', 'READY FOR DELIVERY'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
        break;
      case 6:
        stepCard = Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
                child: WebsafeSvg.asset('assets/images/pick-up.svg',
                    width: 200.w, height: 200.h)),
            Text(
              AppTranslations.of(context)!
                  .text('ORDER DETAILS', 'OUT FOR DELIVERY'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            )
          ],
        );
        break;
      case 7:
        stepCard = Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
                child: WebsafeSvg.asset('assets/images/delivered.svg',
                    width: 200.w, height: 200.h)),
            Text(
              AppTranslations.of(context)!.text('ORDER DETAILS', 'DELIVERD'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            )
          ],
        );
        break;
      case 8:
        stepCard = Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20.5.h, bottom: 6.h),
                child: WebsafeSvg.asset('assets/images/order-placed.svg',
                    width: 200.w, height: 200.h)),
            Text(
              AppTranslations.of(context)!.text('ORDER DETAILS', 'RECIVED'),
              style: TextStyle(
                  fontSize: 18.sp,
                  color: MainTheme.greyTypeFiveColor,
                  fontWeight: FontWeight.w600),
            )
          ],
        );
        break;
    }
    return stepCard;
  }
}
