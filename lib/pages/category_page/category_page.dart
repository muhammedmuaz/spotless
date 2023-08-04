import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/home_page/widgets/category_card.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:mobx/mobx.dart';
import '../../app_localizations.dart';
import '../../enum.dart';
import '../../shared/model/product/product.model.dart';
import '../../shared/shimmers/category_shimmer.dart';
import '../../shared/shimmers/home_shimmer.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/no_connection_error_page.dart';
import '../../store/vendor_store/vendor_store.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final VendorStore _vendorStore = locator.get<VendorStore>();
  late ReactionDisposer _refreshDisposer;
  Completer<dynamic> refreshCompleter = Completer();

  @override
  void initState() {
    super.initState();
    _vendorStore.getManyServiceCategoryList(isFromRefresh: true);
    _refreshDisposer =
        reaction((_) => _vendorStore.serviceCategoryPageState, (_) {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return _onBackButtonTap(context);
    }, child: Observer(builder: (BuildContext context) {
      if (_vendorStore.serviceCategoryPageState == LoadingStatusEnum.error) {
        return NoConnectionErrorPage(
          onTap: () {
            _vendorStore.getManyServiceCategoryList(isFromRefresh: true);
          },
        );
      }
      return Scaffold(
        appBar: CommonAppBar(
          color: Colors.white,
          showLeading: true,
          leadingMargin: EdgeInsets.only(left: 1.w, right: 5.w),
          leadingPadding: const EdgeInsets.all(5),
          elevation: 0,
          name: AppTranslations.of(context)!.text('HOME', 'CATEGORY'),
          onTapLeading: () {
            Navigator.pop(context);
          },
        ),
        body: Observer(builder: (BuildContext context) {
          if (_vendorStore.serviceCategoryPageState ==
                  LoadingStatusEnum.loading &&
              _vendorStore.serviceCategoryList.isEmpty) {
            return CategoryShimmer();
          }

          if (_vendorStore.serviceCategoryList.isEmpty) {
            return Container(
                height: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  'No Data Found',
                  style: TextStyle(color: Colors.black),
                )));
          }

          return LazyLoadRefreshIndicator(
              onEndOfPage: onEndOfPage,
              onRefresh: onRefresh,
              scrollOffset: 150,
              isLoading: _vendorStore.serviceCategoryPageState ==
                  LoadingStatusEnum.loading,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 15.h),
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      physics: ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 18,
                          crossAxisCount: 3,
                          mainAxisSpacing: 18,
                          childAspectRatio:
                              MediaQuery.of(context).size.aspectRatio *
                                  2.9 /
                                  1.38),
                      itemCount: _vendorStore.serviceCategoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        ServiceCategoryModel item =
                            _vendorStore.serviceCategoryList[index];
                        return CategoryCard(
                          name: item.name == null ? "" : item.name,
                          assetImage:
                              item.imageUrl == null ? null : item.imageUrl,
                          isMainCategory: true,
                          onTap: () {
                            _vendorStore.toSelectCategory(index, item);
                            goToAllServicePage();
                          },
                        );
                      })));
        }),
        bottomSheet: Observer(builder: (context) {
          if (_vendorStore.serviceCategoryPageState ==
              LoadingStatusEnum.loading) {
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
        }),
      );
    }));
  }

  /// go to all service page

  goToAllServicePage() {
    Navigator.pushNamed(context, '/all_service_page', arguments: false);
  }

  /// go to home page

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
    return Future.value(false);
  }

  /// this will refresh the page

  Future<void> onRefresh() async {
    _vendorStore.getManyServiceCategoryList(isFromRefresh: true);

    return refreshCompleter.future;
  }

  /// this will get the end of the page

  void onEndOfPage() async {
    _vendorStore.getManyServiceCategoryList();
  }
}
