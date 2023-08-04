import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:spotless/enum.dart';
import 'package:spotless/provider/vendor.provider.dart';
import 'package:spotless/shared/model/home/home.model.dart';
import 'package:spotless/shared/model/product/product.model.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import '../../app_localizations.dart';
import '../../locator.dart';
import '../../routes.dart';
import '../../shared/model/referral/referral.model.dart';
import '../../storage_manager.dart';

part 'vendor_store.g.dart';

class VendorStore = _VendorStore with _$VendorStore;

abstract class _VendorStore with Store {
  _VendorStore() {
    getStoredSavedListValues();
  }
  final AuthStore _authStore = locator.get<AuthStore>();
  final VendorProvider _vendorProvider = locator.get<VendorProvider>();

  @observable
  LoadingStatusEnum homePageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum serviceCategoryPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum serviceListPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum categoryState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum choosePlanState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum searchPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum referralPointsState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum myReferralState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum creditPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum referralHistoryState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum redeemCreditState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum redeemCashState = LoadingStatusEnum.init;

  @observable
  ObservableList<HomeModel> homeList = ObservableList<HomeModel>();

  @observable
  ObservableList<PlanModel> planList = ObservableList<PlanModel>();

  @observable
  ObservableList<ServiceModel> serviceList = ObservableList<ServiceModel>();

  @observable
  ObservableList<ServiceCategoryModel> serviceCategoryList =
      ObservableList<ServiceCategoryModel>();

  @observable
  ObservableList<ServiceCategoryModel> categoryList =
      ObservableList<ServiceCategoryModel>();

  @observable
  ObservableList<ServiceModel> searchedServiceList =
      ObservableList<ServiceModel>();

  @observable
  ObservableList<MyReferralsModel> myReferralList =
      ObservableList<MyReferralsModel>();

  @observable
  ObservableList<SlabModel> slabList = ObservableList<SlabModel>();

  @observable
  ObservableList<SlabModel> slabListForCash = ObservableList<SlabModel>();

  @observable
  ObservableList<SlabModel> slabListForCredit = ObservableList<SlabModel>();

  @observable
  ObservableList<ReferralHistoryModel> referralHistoryList =
      ObservableList<ReferralHistoryModel>();

  int pageIndex = 1;

  @observable
  bool isPaginationEnded = false;

  @observable
  ServiceCategoryModel? selectedCategory = null;

  @observable
  PlanModel? selectedPlan = null;

  @observable
  Observable<PointModel>? userReferralPoints;

  @observable
  List<String>? savedSearchList = [];

  /// [getHomePageData] this fun is used for retrieve  response from [getHomeData] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [HomeModel] List object
  /// Save the list in temporary variable, that is [homeList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getHomePageData() async {
    homePageState = LoadingStatusEnum.loading;

    dynamic _resp = await _vendorProvider.getHomeData(
      token: _authStore.accessToken,
    );

    if (_resp['success'] == true) {
      List<HomeModel> _homeList = List<HomeModel>.from(
          _resp['data'].map((res) => HomeModel.fromJson(res)));
      homeList = ObservableList<HomeModel>.of(_homeList);
      homePageState = LoadingStatusEnum.success;
    } else {
      homePageState = LoadingStatusEnum.error;
    }
  }

  /// [getManyServiceCategoryList] this fun is used for retrieve  response from [getManyServiceCategoryPageData] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [ServiceCategoryModel] List object
  /// Save the list in temporary variable, that is [serviceCategoryList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getManyServiceCategoryList({
    bool isFromRefresh = false,
  }) async {
    if (isFromRefresh) {
      serviceCategoryList = ObservableList<ServiceCategoryModel>.of({});
      pageIndex = 1;
      isPaginationEnded = false;
    }
    serviceCategoryPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getManyServiceCategoryPageData(
      pageIndex: pageIndex,
    );
    if (_resp['success'] == true) {
      List<ServiceCategoryModel> _serviceCategoryList =
          List<ServiceCategoryModel>.from(_resp['data']['data']
              .map((res) => ServiceCategoryModel.fromJson(res)));

      if (pageIndex == 1) {
        serviceCategoryList =
            ObservableList<ServiceCategoryModel>.of(_serviceCategoryList);
      } else if (!isPaginationEnded) {
        serviceCategoryList.addAll(_serviceCategoryList);
      }
      isPaginationEnded =
          _serviceCategoryList.isEmpty || _serviceCategoryList.length < 19;
      if (!isPaginationEnded) {
        pageIndex++;
      }
      serviceCategoryPageState = LoadingStatusEnum.success;
    } else {
      serviceCategoryPageState = LoadingStatusEnum.error;
    }
  }

  /// [getManyServiceList] this fun is used for retrieve  response from [getManyServices] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [ServiceModel] List object
  /// Save the list in temporary variable, that is [serviceList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getManyServiceList({
    bool isFromRefresh = false,
  }) async {
    if (isFromRefresh) {
      serviceList = ObservableList<ServiceModel>.of({});
      pageIndex = 1;
      isPaginationEnded = false;
    }
    serviceListPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getManyServices(
      categoryId: selectedCategory == null ? null : selectedCategory!.id,
      pageIndex: pageIndex,
      token: _authStore.accessToken,
    );
    if (_resp['success'] == true) {
      List<ServiceModel> _serviceList = List<ServiceModel>.from(
          _resp['data']['data'].map((res) => ServiceModel.fromJson(res)));

      if (pageIndex == 1) {
        serviceList = ObservableList<ServiceModel>.of(_serviceList);
      } else if (!isPaginationEnded) {
        serviceList.addAll(_serviceList);
      }
      isPaginationEnded = _serviceList.isEmpty || _serviceList.length < 10;
      if (!isPaginationEnded) {
        pageIndex++;
      }
      serviceListPageState = LoadingStatusEnum.success;
    } else {
      serviceListPageState = LoadingStatusEnum.error;
    }
  }

  /// [getCatergoryList] this fun is used for retrieve  response from [getManyCategory] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [ServiceCategoryModel] List object
  /// Save the list in temporary variable, that is [categoryList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getCatergoryList({
    bool isFromRefresh = false,
  }) async {
    if (isFromRefresh) {
      selectedCategory = null;
    }
    categoryState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getManyCategory();
    if (_resp['success'] == true) {
      List<ServiceCategoryModel> _category = List<ServiceCategoryModel>.from(
          _resp['data'].map((res) => ServiceCategoryModel.fromJson(res)));
      if (selectedCategory != null) {
        _category = _category.map((e) {
          if (e == selectedCategory) {
            e = e.copyWith(isSelected: true);
          } else {
            e = e.copyWith(isSelected: false);
          }
          return e;
        }).toList();
        categoryList = ObservableList<ServiceCategoryModel>.of(_category);
      } else {
        categoryList = ObservableList<ServiceCategoryModel>.of(_category);
      }
      categoryState = LoadingStatusEnum.success;
    } else {
      categoryState = LoadingStatusEnum.error;
    }
  }

  /// [toSelectCategory] this fun used for single select Color ,
  /// Save the selected Color in temporary variable, that is [selectedCategory]

  @action
  toSelectCategory(int index, ServiceCategoryModel item) {
    selectedCategory = item;
    List<ServiceCategoryModel> _categoryList = categoryList;
    int _index = 0;
    _categoryList = _categoryList.map((e) {
      if (_index == index) {
        e = e.copyWith(isSelected: true);
      } else {
        e = e.copyWith(isSelected: false);
      }
      _index++;
      return e;
    }).toList();
    categoryList = ObservableList.of(_categoryList);
    getManyServiceList(isFromRefresh: true);
  }

  /// [getPlanPageList] this fun is used for retrieve  response from [getManyPlanData] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [PlanModel] List object
  /// Save the list in temporary variable, that is [planList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getPlanPageList() async {
    choosePlanState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getManyPlanData();
    if (_resp['success'] == true) {
      List<PlanModel> _planList = List<PlanModel>.from(
          _resp['data'].map((res) => PlanModel.fromJson(res)));
      if (selectedPlan != null) {
        _planList = _planList.map((e) {
          if (e == selectedPlan) {
            e = e.copyWith(isSelected: true);
          } else {
            e = e.copyWith(isSelected: false);
          }
          return e;
        }).toList();

        planList = ObservableList<PlanModel>.of(_planList);
      } else {
        planList = ObservableList<PlanModel>.of(_planList);
      }
      choosePlanState = LoadingStatusEnum.success;
    } else {
      choosePlanState = LoadingStatusEnum.error;
    }
  }

  /// [toSelectPlan] this fun used for single select Color ,
  /// Save the selected Color in temporary variable, that is [planList] 

  @action
  toSelectPlan(int index, PlanModel item) {
    selectedPlan = item;
    List<PlanModel> _planList = planList;
    int _index = 0;
    _planList = _planList.map((e) {
      if (_index == index) {
        e = e.copyWith(isSelected: true);
      } else {
        e = e.copyWith(isSelected: false);
      }
      _index++;
      return e;
    }).toList();
    planList = ObservableList.of(_planList);
  }

  /// [getSearchedServicesList] this fun is used for retrieve  response from [getManySearchServiceList] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [ServiceModel] List object
  /// Save the list in temporary variable, that is [searchedServiceList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getSearchedServicesList(
      {bool isFromRefresh = false, String? query, String? token}) async {
    if (isFromRefresh) {
      searchedServiceList = ObservableList<ServiceModel>.of({});
      pageIndex = 1;
      isPaginationEnded = false;
    }
    searchPageState = LoadingStatusEnum.loading;
    if (query != null && query.length >= 1) {
      if (!savedSearchList!.contains(query)) {
        savedSearchList!.add(query);
        StorageManager.instance!
            .saveList(StorageManager.searchedQuery, savedSearchList!);
      }
    }
    await Future.delayed(const Duration(milliseconds: 500));
    dynamic _resp = await _vendorProvider.getManySearchServiceList(
        query: query, pageIndex: pageIndex, token: token);
    if (_resp['success'] == true) {
      List<ServiceModel> _searchedServiceList = List<ServiceModel>.from(
          _resp['data']['data'].map((res) => ServiceModel.fromJson(res)));
      if (pageIndex == 1) {
        searchedServiceList =
            ObservableList<ServiceModel>.of(_searchedServiceList);
      } else if (!isPaginationEnded) {
        searchedServiceList.addAll(_searchedServiceList);
      }
      isPaginationEnded =
          _searchedServiceList.isEmpty || _searchedServiceList.length < 15;
      if (!isPaginationEnded) {
        pageIndex++;
      }
      searchPageState = LoadingStatusEnum.success;
    } else {
      searchPageState = LoadingStatusEnum.error;
    }
  }

  /// this [getStoredSavedListValues] fun is used for Store value for app,
  /// it will store [savedSearchList] inside the [StorageManager]

  @action
  void getStoredSavedListValues() {
    List<String>? _savedSearchList =
        StorageManager.instance?.getList(StorageManager.searchedQuery);
    if (_savedSearchList != null && _savedSearchList.isNotEmpty) {
      try {
        savedSearchList = _savedSearchList;
      } catch (e) {
        print(e);
        // TODO(jinto): Add Crashlytics
      }
    }
  }

  /// [getReferralPoints] this fun is used for retrieve  response from [getOneReferralPoints] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [getOneReferralPoints] object
  /// Save the model in temporary variable, that is [userReferralPoints]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getReferralPoints() async {
    referralPointsState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getOneReferralPoints(
      token: _authStore.accessToken,
    );
    if (_resp['success'] == true) {
      PointModel _userReferralPoints = PointModel.fromJson(_resp);
      userReferralPoints = Observable(_userReferralPoints);
      referralPointsState = LoadingStatusEnum.success;
    } else {
      referralPointsState = LoadingStatusEnum.error;
    }
  }

  /// [getMyReferralList] this fun is used for retrieve  response from [getManyMyReferralList] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [MyReferralsModel] List object
  /// Save the list in temporary variable, that is [myReferralList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getMyReferralList({
    bool isFromRefresh = false,
  }) async {
    if (isFromRefresh) {
      myReferralList = ObservableList<MyReferralsModel>.of({});
      pageIndex = 1;
      isPaginationEnded = false;
    }

    myReferralState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getManyMyReferralList(
        token: _authStore.accessToken, pageIndex: pageIndex);
    if (_resp['success'] == true) {
      List<MyReferralsModel> _myReferralList = List<MyReferralsModel>.from(
          _resp['data']['data'].map((res) => MyReferralsModel.fromJson(res)));
      if (pageIndex == 1) {
        myReferralList = ObservableList<MyReferralsModel>.of(_myReferralList);
      } else if (!isPaginationEnded) {
        myReferralList.addAll(_myReferralList);
      }
      isPaginationEnded =
          _myReferralList.isEmpty || _myReferralList.length < 15;
      if (!isPaginationEnded) {
        pageIndex++;
      }

      myReferralState = LoadingStatusEnum.success;
    } else {
      myReferralState = LoadingStatusEnum.error;
    }
  }

  /// [getCreditSlabList] this fun is used for retrieve  response from [getManySlabList] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [SlabModel] List object
  /// Save the list in temporary variable according to the coditions, that is [slabListForCash] or [slabListForCredit]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getCreditSlabList() async {
    slabListForCash = ObservableList<SlabModel>.of({});
    slabListForCredit = ObservableList<SlabModel>.of({});
    creditPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getManySlabList(
      token: _authStore.accessToken,
    );
    if (_resp['success'] == true) {
      List<SlabModel> _slabList = List<SlabModel>.from(
          _resp['data'].map((res) => SlabModel.fromJson(res)));

      List<SlabModel> _slabListForCash = _slabList.map((e) {
        if (e.point! <= userReferralPoints!.value.data!) {
          slabListForCash.add(e);
        }
        return e;
      }).toList();

      List<SlabModel> _slabListForCredit = _slabList.map((e) {
        if (e.point! <= userReferralPoints!.value.data!) {
          slabListForCredit.add(e);
        }
        return e;
      }).toList();
      slabList = ObservableList<SlabModel>.of(_slabList);
      creditPageState = LoadingStatusEnum.success;
    } else {
      creditPageState = LoadingStatusEnum.error;
    }
  }

  /// [getReferralHistory] this fun is used for retrieve  response from [getManyReferralHistory] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [ReferralHistoryModel] List object
  /// Save the list in temporary variable, that is [referralHistoryList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getReferralHistory({
    bool isFromRefresh = false,
  }) async {
    if (isFromRefresh) {
      referralHistoryList = ObservableList<ReferralHistoryModel>.of({});
      pageIndex = 1;
      isPaginationEnded = false;
    }
    referralHistoryState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.getManyReferralHistory(
        token: _authStore.accessToken, pageIndex: pageIndex);
    if (_resp['success'] == true) {
      List<ReferralHistoryModel> _referralHistoryList =
          List<ReferralHistoryModel>.from(_resp['data']['data']
              .map((res) => ReferralHistoryModel.fromJson(res)));

      if (pageIndex == 1) {
        referralHistoryList =
            ObservableList<ReferralHistoryModel>.of(_referralHistoryList);
      } else if (!isPaginationEnded) {
        referralHistoryList.addAll(_referralHistoryList);
      }
      isPaginationEnded =
          _referralHistoryList.isEmpty || _referralHistoryList.length < 15;
      if (!isPaginationEnded) {
        pageIndex++;
      }
      referralHistoryState = LoadingStatusEnum.success;
    } else {
      referralHistoryState = LoadingStatusEnum.error;
    }
  }

  /// This [redeemCredit] fun is used to redeem the credit of user
  /// if the response will positive ,it will navigate to the [redeem_success_page]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> redeemCredit(dynamic dto, BuildContext context, String token,
      {SlabModel? item}) async {
    if (redeemCreditState == LoadingStatusEnum.loading) {
      return;
    }
    redeemCreditState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.redeemAsCredit(dto, token);
    if (_resp['success'] == true) {
      redeemCreditState = LoadingStatusEnum.success;
      Navigator.pushNamed(context, '/redeem_success_page',
          arguments: RedeemSuccessPageParam(
            type: "CREDITS",
            value: "${item!.credit}",
            point: "${item.point}",
            message: AppTranslations.of(context)!
                .text('REFERRAL', 'REDEEM CREDITS MSG'),
          ));
    } else {
      BotToast.showText(
          text: _resp['message'] ??
              'Something went wrong , Please Check Your Internet Connection');
      redeemCreditState = LoadingStatusEnum.error;
    }
  }

  /// This [redeemCash] fun is used to redeem the cash of user
  /// if the response will positive ,it will navigate to the [redeem_success_page]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> redeemCash(dynamic dto, BuildContext context, String token,
      {SlabModel? item}) async {
    if (redeemCashState == LoadingStatusEnum.loading) {
      return;
    }
    redeemCashState = LoadingStatusEnum.loading;
    dynamic _resp = await _vendorProvider.redeemAsCash(dto, token);
    if (_resp['success'] == true) {
      redeemCashState = LoadingStatusEnum.success;
      Navigator.pushNamed(context, '/redeem_success_page',
          arguments: RedeemSuccessPageParam(
            type: "CASH",
            value: "${item!.cash}",
            point: "${item.point}",
            message: AppTranslations.of(context)!
                .text('REFERRAL', 'REDEEM CASH MSG'),
          ));
    } else {
      BotToast.showText(
          text: _resp['message'] ??
              'Something went wrong , Please Check Your Internet Connection');
      redeemCashState = LoadingStatusEnum.error;
    }
  }
}
