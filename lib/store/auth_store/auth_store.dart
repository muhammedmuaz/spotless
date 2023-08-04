import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:spotless/enum.dart';
import 'package:spotless/provider/auth.provider.dart';
import 'package:spotless/shared/model/user/user.model.dart';
import 'package:spotless/services_config.dart';
import 'package:spotless/store/notification_store/notification_store.dart';

import '../../locator.dart';
import '../../main.dart';
import '../../storage_manager.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  _AuthStore() {
    getStoredPhone();
    getStoredValues();
    getStoredCurrencValues();
    getStoredCountryValues();
  }

  final AuthProvider _authProvider = locator.get<AuthProvider>();
  final NotificationStore _notificationStore = locator.get<NotificationStore>();

  /// one signal key for accessing one signal
  static final String oneSignalAppId = '3b8c2e13-15b4-40f7-9a46-549b43bb6523';

  @observable
  LoadingStatusEnum getOtpPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum verifyOtpPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum loginPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum logOutState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum profilePageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum createPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum editPageState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum cityListState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum fcmTokenState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum currencyState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum countryState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum contactAdminState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum addAddressState = LoadingStatusEnum.init;

  @observable
  LoadingStatusEnum manageAddressPageState = LoadingStatusEnum.init;

  @observable
  ObservableList<CityModel> cityList = ObservableList<CityModel>();

  @observable
  ObservableList<AddressModel> addressList = ObservableList<AddressModel>();

  @observable
  String? accessToken;

  @observable
  String? phoneNo;

  @observable
  String? currencyCode;

  @observable
  String? countryCode;

  @observable
  Observable<AppUserModel>? appUser;

  @observable
  Observable<AdminDetailsModel>? adminContactDetails;

  @computed
  bool get isLoggedIn {
    return accessToken != null;
  }

  @observable
  File? selectedAppUserImage;

  @action
  void onAvatarSelected(File image) {
    selectedAppUserImage = image;
  }

  @observable
  CityModel? selectedCity;

  @observable
  AddressModel? selectedPickUplocations;

  @observable
  AddressModel? selectedDeliverylocations;

  /// [getOtp] this fun is used for retrieve response from [loginUser] inside the [_authProvider]
  /// it will pass the dto as arg
  /// after getting the positive response , it will store the phone number in local storage
  /// then using a [navigator] fun navigate to [otp_page]
  /// If Api retrieve [error] , The [error] status will show

  @action
  Future<void> getOtp(dto,
      {BuildContext? context, bool isInResend = false}) async {
    getOtpPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.loginUser(dto);
    if (_resp['success'] == true) {
      phoneNo = dto["phone"];
      StorageManager.instance!
          .saveStringValue(StorageManager.xPhoneNo, phoneNo!);
      getOtpPageState = LoadingStatusEnum.success;
      if (!isInResend) {
        Navigator.pushReplacementNamed(
          context!,
          "/otp_page",
        );
      }
    } else {
      getOtpPageState = LoadingStatusEnum.error;
    }
  }

  /// [verifyOtp] this fun is used for retrieve response from [verifyOneOtp] inside the [_authProvider]
  /// it will pass the dto as arg
  /// after getting the positive response , it will covert [json] response from the Api to [AppUserModel] object
  /// then the [model] is Stored in [StorageManager]
  /// then using a [navigator] fun navigate to [home_page]
  /// If Api retrieve [error] , The [error] will Shown in [BotToast] ,the text will be "Invalid OTP"

  @action
  Future<void> verifyOtp(dto, {BuildContext? context}) async {
    verifyOtpPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.verifyOneOtp(dto);

    if (_resp['success'] == true) {
      verifyOtpPageState = LoadingStatusEnum.success;
      if (_resp["data"].toString() == "[]") {
        Navigator.pushReplacementNamed(
          context!,
          "/register_page",
        );
      } else {
        AppUserModel _appUser = AppUserModel.fromJson(_resp["data"]);
        appUser = Observable(_appUser);
        StorageManager.instance!.saveStringValue(
            StorageManager.user, json.encode(appUser!.value.toJson()));
        accessToken = _resp["data"]["auth_token"];
        StorageManager.instance!
            .saveStringValue(StorageManager.xToken, accessToken!);
        initPlatformState();
        Navigator.pushReplacementNamed(
          context!,
          "/home_page",
        );
      }
    } else {
      verifyOtpPageState = LoadingStatusEnum.error;
      BotToast.showText(text: 'Invalid OTP', duration: Duration(seconds: 5));
    }
  }

  /// [logout] this fun is used for retrieve  response from [logOutUser] inside the [_authProvider]
  /// then clear the Stored vales in [StorageManager], it will clear accessToken ,phone no, appUser info,one signal External user Id ,httpClient
  /// using a [navigator] fun navigate to [loginPage]
  /// If Api retrieve [error] , The [error] will Shown in [BotToast]

  @action
  Future<void> logout() async {
    logOutState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.logOutUser(token: accessToken);
    if (_resp['success'] == true) {
      StorageManager.instance!.clearAllPreferences();
      accessToken = null;
      appUser = null;
      phoneNo = null;
      OneSignal.shared.removeExternalUserId();
      HttpClient.init();
      BotToast.showText(
          text: '${_resp['message']}', duration: Duration(seconds: 5));
    } else {
      logOutState = LoadingStatusEnum.error;
      BotToast.showText(
          text: 'Something went wrong , Please Check Your Internet Connection',
          duration: Duration(seconds: 5));
    }
  }

  /// [getProfileData] this fun is used for retrieve  response from [getAppUserData] inside the [_authProvider]
  /// and covert [json] response  from the Api to [ProfileModel] and [AppUserModel]
  /// Save the list in temporary variable, that is[and [appUser]
  /// then the [model] is Stored in [StorageManager]
  /// If Api retrieve [error] , The [error] will Shown in [BotToast]

  @action
  Future<void> getProfileData() async {
    profilePageState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.getAppUserData(
      token: accessToken,
    );
    if (_resp['success'] == true) {
      AppUserModel _appUser = AppUserModel.fromJson(_resp["data"]);
      appUser = Observable(_appUser);
      StorageManager.instance!.saveStringValue(
          StorageManager.user, json.encode(appUser!.value.toJson()));
      profilePageState = LoadingStatusEnum.success;
    } else {
      profilePageState = LoadingStatusEnum.error;
      BotToast.showText(
          text: 'Something went wrong , Please Check Your Internet Connection',
          duration: Duration(seconds: 5));
    }
  }

  /// this [getStoredValues] fun is used for Store value for app,
  /// it will get [appUser],[accessToken] inside the [StorageManager]

  @action
  void getStoredValues() {
    String? _user =
        StorageManager.instance!.getStringValue(StorageManager.user);
    String? _token =
        StorageManager.instance!.getStringValue(StorageManager.xToken);

    if (_user != null && _user != '') {
      try {
        appUser = Observable(AppUserModel.fromJson(json.decode(_user)));
        accessToken = _token;
      } catch (e) {
        print(e);
        // TODO(jinto): Add Crashlytics
      }
    }
  }

  /// this [getStoredPhone] fun is used for Store value for app,
  /// it will get [phoneNo] inside the [StorageManager]

  @action
  void getStoredPhone() {
    String? _phoneNo =
        StorageManager.instance!.getStringValue(StorageManager.xPhoneNo);
    if (_phoneNo != null && _phoneNo != '') {
      try {
        phoneNo = _phoneNo;
      } catch (e) {
        print(e);
        // TODO(jinto): Add Crashlytics
      }
    }
  }

  /// This [createAppUser] is used for creating app user
  /// This [createAppUser] is getting [data] and [context] as params
  /// It used to create appUser ,  If the response is positive , success status will go back to corresponding page [home_page]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> createAppUser({
    required AppUserDto data,
    required BuildContext context,
  }) async {
    createPageState = LoadingStatusEnum.loading;
    FormData _data = data.selectedAppUserImage == null
        ? FormData.fromMap({
            "email": data.email,
            "name": data.name,
            "phone": data.phone,
            "referral_code": data.referral,
            "city_id": data.cityId,
          })
        : FormData.fromMap({
            "email": data.email,
            "name": data.name,
            "phone": data.phone,
            "referral_code": data.referral,
            "city_id": data.cityId,
            "avatar":
                MultipartFile.fromFileSync(data.selectedAppUserImage!.path),
          });

    print(_data);

    dynamic _resp = await _authProvider.signUpAppUser(
      data: _data,
    );
    print(
        "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk ${_resp}");
    if (_resp['success'] == true) {
      AppUserModel _appUser = AppUserModel.fromJson(_resp["data"]);
      appUser = Observable(_appUser);
      StorageManager.instance!.saveStringValue(
          StorageManager.user, json.encode(appUser!.value.toJson()));
      accessToken = _resp["data"]["auth_token"];
      StorageManager.instance!
          .saveStringValue(StorageManager.xToken, accessToken!);
      BotToast.showText(
          text: "Account Has Created Successfully , Please Login");
      Navigator.pushReplacementNamed(
        context,
        "/home_page",
      );
      clearSelectedImage();
      initPlatformState();
      createPageState = LoadingStatusEnum.success;
    } else {
      if (_resp["data"] == null) {
        BotToast.showText(
            text: _resp['message']["phone"][0] ??
                'Something went wrong , Please Check Your Internet Connection');
      } else {
        BotToast.showText(
            text: _resp['data'] ??
                'Something went wrong , Please Check Your Internet Connection');
      }
      createPageState = LoadingStatusEnum.error;
    }
  }

  /// This [clearSelectedImage] fun is used to clear this [selectedAppUserImage] local veriable data

  @action
  void clearSelectedImage() {
    selectedAppUserImage = null;
  }

  /// [getCityList] this fun is used for retrieve  response from [getManyCityList] inside the [_vendorProvider]
  /// and covert [json] response  from the Api to [CityModel]
  /// Save the list in temporary variable, that is [appUserArea]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getCityList() async {
    cityListState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.getManyCityList();
    if (_resp['success'] == true) {
      List<CityModel> _cityList = List<CityModel>.from(
          _resp['data'].map((res) => CityModel.fromJson(res)));
      if (selectedCity != null) {
        List<CityModel> cityListModify = _cityList.map((e) {
          if (e == selectedCity) {
            e = e.copyWith(isSelected: true);
          }
          return e;
        }).toList();

        cityList = ObservableList<CityModel>.of(cityListModify);
      } else {
        cityList = ObservableList<CityModel>.of(_cityList);
      }
      cityListState = LoadingStatusEnum.success;
    } else {
      cityListState = LoadingStatusEnum.error;
    }
  }

  /// [toSelectCity] this fun used for single select Category ,
  /// Save the selected Category in temporary variable, that is [selectedCity]

  @action
  toSelectCity(int index, CityModel item) {
    selectedCity = item;
    List<CityModel> _cityList = cityList;
    int _index = 0;
    _cityList = _cityList.map((e) {
      if (_index == index) {
        e = e.copyWith(isSelected: true);
      } else {
        e = e.copyWith(isSelected: false);
      }
      _index++;
      return e;
    }).toList();
    cityList = ObservableList.of(_cityList);
  }

  /// [getCurrencyData] this fun is used for retrieve  response from [getCurrencyData] inside the [_authProvider]
  /// if it retrieve the positive respone , the respon is Save the list in temporary variable, that is [currencyCode]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getCurrencyData() async {
    currencyState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.getAppCurrency();
    if (_resp['success'] == true) {
      currencyCode = _resp['data'];
      StorageManager.instance!
          .saveStringValue(StorageManager.currencyCode, currencyCode!);
      print(
          "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww $currencyCode");
      currencyState = LoadingStatusEnum.success;
    } else {
      currencyState = LoadingStatusEnum.error;
    }
  }

  /// [getCountryData] this fun is used for retrieve  response from [getAppCountryCode] inside the [_authProvider]
  /// if it retrieve the positive respone , the respon is Save the list in temporary variable, that is [countryCode]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getCountryData() async {
    countryState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.getAppCountryCode();
    if (_resp['success'] == true) {
      countryCode = _resp['data'];
      StorageManager.instance!
          .saveStringValue(StorageManager.countryCode, countryCode!);
      countryState = LoadingStatusEnum.success;
    } else {
      countryState = LoadingStatusEnum.error;
    }
  }

  /// this [getStoredCurrencValues] fun is used for Store value for app,
  /// it will store [currencyCode] inside the [StorageManager]

  @action
  void getStoredCurrencValues() {
    String? _currencyCode =
        StorageManager.instance!.getStringValue(StorageManager.currencyCode);
    if (_currencyCode != null && _currencyCode != '') {
      try {
        currencyCode = _currencyCode;
      } catch (e) {
        print(e);
        // TODO(jinto): Add Crashlytics
      }
    }
  }

  /// this [getStoredCountryValues] fun is used for Store value for app,
  /// it will store [currencyCode] inside the [StorageManager]

  @action
  void getStoredCountryValues() {
    String? _countryCode =
        StorageManager.instance!.getStringValue(StorageManager.countryCode);
    if (_countryCode != null && _countryCode != '') {
      try {
        currencyCode = _countryCode;
      } catch (e) {
        print(e);
        // TODO(jinto): Add Crashlytics
      }
    }
  }

  /// This [editAppUser] is used for creating app user
  /// This [editAppUser] is getting [data] and [context] as params
  /// It used to create appUser ,  If the response is positive , success status will go back to corresponding page [profile_page]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> editAppUser({
    required AppUserDto data,
    required BuildContext context,
  }) async {
    if (editPageState == LoadingStatusEnum.loading) {
      return;
    }

    editPageState = LoadingStatusEnum.loading;
    FormData _data = data.selectedAppUserImage == null
        ? FormData.fromMap({
            "email": data.email,
            "name": data.name,
          })
        : FormData.fromMap({
            "email": data.email,
            "name": data.name,
            "avatar":
                MultipartFile.fromFileSync(data.selectedAppUserImage!.path),
          });

    dynamic _resp =
        await _authProvider.editAppUser(data: _data, token: accessToken);

    if (_resp['success'] == true) {
      editPageState = LoadingStatusEnum.success;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/profile_page", (route) => false);
      });

      clearSelectedImage();
      BotToast.showText(text: _resp['message']);
    } else {
      BotToast.showText(
          text: _resp['data'] ??
              'Something went wrong , Please Check Your Internet Connection');
      editPageState = LoadingStatusEnum.error;
    }
  }

  /// This [addOrEditAddressUser] is used for creating or edit address
  /// This [editAppUser] is getting [isAdd] and [context] as params
  /// It used to create creating or edit address of user ,  If the response is positive , success status will go back to corresponding page
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> addOrEditAddressUser(dto,
      {required BuildContext context, bool isAdd = false}) async {
    addAddressState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.addOrEditUserAddress(dto, accessToken!,
        isAdd: isAdd);
    if (_resp['success'] == true) {
      addAddressState = LoadingStatusEnum.success;
      getAddressList();
      if (isAdd == true) {
        BotToast.showText(text: "Address Added Successfully");
      } else {
        BotToast.showText(text: "Address Edited Successfully");
      }
      Navigator.pop(context);
    } else {
      addAddressState = LoadingStatusEnum.error;
    }
  }

  /// [getAddressList] this fun is used for retrieve  response from [getUserAddress] inside the [_authProvider]
  /// and covert [json] response  from the Api to [String]
  /// Save the list in temporary variable, that is [addressList]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getAddressList() async {
    manageAddressPageState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.getUserAddress(token: accessToken);
    if (_resp['success'] == true) {
      List<AddressModel> _addressList = List<AddressModel>.from(
          _resp['data'].map((res) => AddressModel.fromJson(res)));
      addressList = ObservableList<AddressModel>.of(_addressList);
      manageAddressPageState = LoadingStatusEnum.success;
    } else {
      manageAddressPageState = LoadingStatusEnum.error;
    }
  }

  /// [getAddressList] this fun is used for retrieve  response from [getAdminContactDetails] inside the [_authProvider]
  /// and covert [json] response  from the Api to [String]
  /// Save the list in temporary variable, that is [contactAdminState]
  /// If Api retrieve [error] , a error status will go back to corresponding page

  @action
  Future<void> getContactAdmin() async {
    contactAdminState = LoadingStatusEnum.loading;
    dynamic _resp = await _authProvider.getAdminContactDetails();
    if (_resp['success'] == true) {
      AdminDetailsModel _adminContactDetails =
          AdminDetailsModel.fromJson(_resp);
      adminContactDetails = Observable(_adminContactDetails);
      contactAdminState = LoadingStatusEnum.success;
    } else {
      contactAdminState = LoadingStatusEnum.error;
    }
  }

  /// [toSelectAddress] this fun used for single select address according to conditions,
  /// Save the selected address inside the addressList

  @action
  toSelectAddress(int index, AddressModel item, String type) {
    if (type == "PICKUP") {
      selectedPickUplocations = item;
      List<AddressModel> _addressList = addressList;
      int _index = 0;
      _addressList = _addressList.map((e) {
        if (_index == index) {
          e = e.copyWith(isSelected: true);
        } else {
          e = e.copyWith(isSelected: false);
        }
        _index++;
        return e;
      }).toList();
      addressList = ObservableList.of(_addressList);
    }
    if (type == "DELIVERY") {
      selectedDeliverylocations = item;
      List<AddressModel> _addressList = addressList;
      int _index = 0;
      _addressList = _addressList.map((e) {
        if (_index == index) {
          e = e.copyWith(isSelected: true);
        } else {
          e = e.copyWith(isSelected: false);
        }
        _index++;
        return e;
      }).toList();
      addressList = ObservableList.of(_addressList);
    }
  }

  /// [initPlatformState] is a fun that is used to integrate one signal with key

  Future<void> initPlatformState() async {
    // if (!mounted) return;
    /// setting [externalUserId] as app user phone number
    final externalUserId = "${appUser!.value.phone}";
    print(" ${externalUserId}");

    /// This [setExternalUserId] one signal fun is used to genarate external user id using app user mobile no
    OneSignal.shared.setExternalUserId(externalUserId).then((results) {
      print("${results.toString()}");
    }).catchError((error) {
      print("${error.toString()}");
    });

    /// OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(oneSignalAppId);

    /// access permission of one signal
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });

    /// Foreground massgae handling in one signal plugin side [OSNotificationReceivedEvent] observer event
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(null);

      /// if the notification is null , it won't invoke the [flutterLocalNotificationsPlugin]
      if (event.notification != null) {
        flutterLocalNotificationsPlugin!.show(
            event.notification.hashCode,
            event.notification.title,
            event.notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel!.id, channel!.name,
                  channelDescription: channel!.description,
                  icon: 'launch_background',
                  priority: Priority.high),
            ));
      }

      /// This [onFCMReceived] fun is used to receive notification and also store the notification in local storage
      /// ,when the notification came to the device
      _notificationStore.onFCMReceived(
        {
          "title": "${event.notification.title}",
          "message": "${event.notification.body}"
        },
      );
    });

    /// this one signal fun [setNotificationOpenedHandler] is used to handling notification when open the notification
    /// , when it open it will store the notification in local storage
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      _notificationStore.onFCMReceived(
        {
          "title": "${result.notification.title}",
          "message": "${result.notification.body}"
        },
      );
    });
  }
}
