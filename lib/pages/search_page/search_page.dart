import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:spotless/enum.dart';
import 'package:spotless/pages/home_page/widgets/service_card.dart';
import 'package:spotless/shared/model/product/product.model.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../app_localizations.dart';
import '../../locator.dart';
import '../../shared/shimmers/service_shimmer.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar.dart';
import '../../shared/widgets/no_connection_error_page.dart';
import '../../store/cart_store/cart_store.dart';
import '../../store/vendor_store/vendor_store.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final VendorStore _vendorStore = locator.get<VendorStore>();
  final AuthStore _authStore = locator.get<AuthStore>();
  final CartStore _cartStore = locator.get<CartStore>();
  late ReactionDisposer _refreshDisposer;
  Completer<dynamic> refreshCompleter = new Completer();
  Timer? _debounce;
  TextEditingController fieldTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _vendorStore.getSearchedServicesList(
        query: null, isFromRefresh: true, token: _authStore.accessToken);
    _refreshDisposer = reaction((_) => _vendorStore.searchPageState, (_) {
      if (_ != LoadingStatusEnum.loading) {
        refreshCompleter.complete();
        refreshCompleter = Completer();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshDisposer();
  }

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      if (_vendorStore.searchPageState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(
          onTap: () {
            _vendorStore.getSearchedServicesList(
                query: null,
                isFromRefresh: true,
                token: _authStore.accessToken);
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
            name: '',
            onTapLeading: () {
              Navigator.pop(context);
            },
          ),
          body: Observer(builder: (BuildContext context) {
            return LazyLoadRefreshIndicator(
                onEndOfPage: onEndOfPage,
                onRefresh: onRefresh,
                scrollOffset: 300,
                isLoading:
                    _vendorStore.searchPageState == LoadingStatusEnum.loading,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                        padding: EdgeInsetsDirectional.only(
                          top: 10.h,
                          end: 16.w,
                          start: 16.w,
                        ),
                        child: TextField(
                          onChanged: onSearchInput,
                          controller: fieldTextEditingController,
                          decoration: InputDecoration(
                            fillColor: MainTheme.whiteTypeColor,
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: MainTheme.blueTypeOneColor, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: MainTheme.blueTypeOneColor, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: MainTheme.blueTypeOneColor, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: MainTheme.blueTypeOneColor, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            labelText: AppTranslations.of(context)!
                                .text('SEARCH', 'SEARCH FOR'),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintStyle: TextStyle(
                              color: MainTheme.greyTypeColor,
                              fontSize: 12.sp,
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minHeight: 25.h,
                              minWidth: 25.w,
                            ),
                            prefixIcon: Container(
                                height: 25.h,
                                width: 25.w,
                                margin: EdgeInsets.only(
                                    left: 12.w, right: 13.w, bottom: 3.h),
                                child: WebsafeSvg.asset(
                                    "assets/images/search_Icon.svg",
                                    fit: BoxFit.contain,
                                    height: 25.h,
                                    width: 25.w)),
                            labelStyle: TextStyle(
                              color: MainTheme.greyTypeColor,
                              fontSize: 12.sp,
                              fontFamily: "Poppins",
                            ),
                          ),
                          expands: false,
                          style: TextStyle(
                            color: MainTheme.greyTypeColor,
                            fontSize: 12.sp,
                            fontFamily: "Poppins",
                          ),
                        )),
                    _vendorStore.savedSearchList!.length <= 1
                        ? Container()
                        : Container(
                            padding: EdgeInsetsDirectional.only(
                              top: 30.h,
                              end: 19.w,
                              start: 19.w,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      AppTranslations.of(context)!
                                          .text('SEARCH', 'RECENT'),
                                      style: TextStyle(
                                        color: MainTheme.blackypeColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        isActive = !isActive;
                                      });
                                    },
                                    child: Container(
                                        child: Text(
                                      isActive
                                          ? AppTranslations.of(context)!
                                              .text('GENERAL', 'SEE LESS')
                                          : AppTranslations.of(context)!
                                              .text('SEARCH', 'SEE All'),
                                      style: TextStyle(
                                        color: MainTheme.blueTypeOneColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        fontFamily: "Poppins",
                                      ),
                                    )),
                                  )
                                ]),
                          ),
                    Visibility(
                        visible: isActive,
                        child: AnimatedContainer(
                            width: isActive
                                ? null
                                : MediaQuery.of(context).size.width,
                            height: isActive ? null : 60,
                            duration: Duration(seconds: 5),
                            curve: Curves.fastOutSlowIn,
                            padding: EdgeInsetsDirectional.only(
                              top: 15.h,
                              end: 20.w,
                              start: 20.w,
                            ),
                            child: ListView.builder(
                              reverse: true,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _vendorStore.savedSearchList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                String item =
                                    _vendorStore.savedSearchList![index];
                                return InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        fieldTextEditingController.value =
                                            TextEditingValue(text: item);
                                      });
                                      onSearchInput(item);
                                    },
                                    child: Container(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: MainTheme.greyTypeColor,
                                          fontSize: 12.sp,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ));
                              },
                            ))),
                    SizedBox(
                      height: 20.h,
                    ),
                    Observer(builder: (BuildContext context) {
                      if (_vendorStore.searchPageState ==
                              LoadingStatusEnum.loading &&
                          _vendorStore.searchedServiceList.isEmpty) {
                        return ServiceShimmer();
                      }

                      if (_vendorStore.searchedServiceList.isEmpty) {
                        return Container(
                            height: MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width - 100,
                            child: Center(
                                child: Text(
                              AppTranslations.of(context)!
                                  .text('SEARCH', 'NO SERVICES'),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )));
                      }
                      return GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              left: 16.w, right: 16.w, top: 7.5.h),
                          physics: const ClampingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 18,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 18,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.aspectRatio *
                                          2.4 /
                                          1.48),
                          itemCount: _vendorStore.searchedServiceList.length,
                          itemBuilder: (BuildContext context, int index) {
                            ServiceModel item =
                                _vendorStore.searchedServiceList[index];
                            return ServiceCard(
                              quantity:
                                  item.quantity == null ? 0 : item.quantity,
                              currencyCode: _authStore.currencyCode == null
                                  ? ""
                                  : _authStore.currencyCode,
                              name: item.name == null ? '' : item.name,
                              image:
                                  item.imageUrl == null ? null : item.imageUrl,
                              price: item.price == null
                                  ? ""
                                  : item.price.toString(),
                              credit:
                                  item.itemCredit == null ? 0 : item.itemCredit,
                              itemId: item.id,
                              onTapAdd: () {
                                _cartStore.updateCartItem(
                                  item,
                                  isIncrement: true,
                                  context: context,
                                );
                              },
                              onTapBtns: (bool value) {
                                _cartStore.updateCartItem(
                                  item,
                                  isIncrement: value,
                                  context: context,
                                );
                              },
                            );
                          });
                    }),
                  ],
                )));
          }),
          bottomSheet: Observer(builder: (context) {
            if (_vendorStore.searchPageState == LoadingStatusEnum.loading) {
              return Container(
                  color: Colors.transparent,
                  height: 40,
                  child: Center(
                    child: LoadingIndicator(
                      colors: [
                        MainTheme.blueTypeOneColor,
                      ],
                      indicatorType: Indicator.ballClipRotateMultiple,
                    ),
                  ));
            }
            return Container(
              height: 1,
            );
          }));
    });
  }

  /// This [onSearchInput] fun retrieve search query and pass the query to [getSearchedServicesList] fun

  onSearchInput(String query) async {
    if (query.length < 2) return null;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _vendorStore.getSearchedServicesList(
          query: fieldTextEditingController.value.text,
          isFromRefresh: true,
          token: _authStore.accessToken);
    });
  }

  // Future<bool> _onBackButtonTap() async {
  //   Navigator.pushReplacementNamed(
  //     context,
  //     "/home_page",
  //   );
  //   return Future.value(false);
  // }

  /// This [onRefresh] is used to refresh the page

  Future<void> onRefresh() async {
    fieldTextEditingController.value.text.length < 2
        ? _vendorStore.getSearchedServicesList(
            query: null, isFromRefresh: true, token: _authStore.accessToken)
        : _vendorStore.getSearchedServicesList(
            query: fieldTextEditingController.value.text,
            isFromRefresh: true,
            token: _authStore.accessToken);
    return refreshCompleter.future;
  }

  /// This [onEndOfPage] is used to find the End of the page and updated the page

  void onEndOfPage() async {
    fieldTextEditingController.value.text.length < 2
        ? _vendorStore.getSearchedServicesList(
            query: null, token: _authStore.accessToken)
        : _vendorStore.getSearchedServicesList(
            query: fieldTextEditingController.value.text,
            token: _authStore.accessToken);
  }
}
