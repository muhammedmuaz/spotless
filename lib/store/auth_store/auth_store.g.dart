// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??=
          Computed<bool>(() => super.isLoggedIn, name: '_AuthStore.isLoggedIn'))
      .value;

  late final _$getOtpPageStateAtom =
      Atom(name: '_AuthStore.getOtpPageState', context: context);

  @override
  LoadingStatusEnum get getOtpPageState {
    _$getOtpPageStateAtom.reportRead();
    return super.getOtpPageState;
  }

  @override
  set getOtpPageState(LoadingStatusEnum value) {
    _$getOtpPageStateAtom.reportWrite(value, super.getOtpPageState, () {
      super.getOtpPageState = value;
    });
  }

  late final _$verifyOtpPageStateAtom =
      Atom(name: '_AuthStore.verifyOtpPageState', context: context);

  @override
  LoadingStatusEnum get verifyOtpPageState {
    _$verifyOtpPageStateAtom.reportRead();
    return super.verifyOtpPageState;
  }

  @override
  set verifyOtpPageState(LoadingStatusEnum value) {
    _$verifyOtpPageStateAtom.reportWrite(value, super.verifyOtpPageState, () {
      super.verifyOtpPageState = value;
    });
  }

  late final _$loginPageStateAtom =
      Atom(name: '_AuthStore.loginPageState', context: context);

  @override
  LoadingStatusEnum get loginPageState {
    _$loginPageStateAtom.reportRead();
    return super.loginPageState;
  }

  @override
  set loginPageState(LoadingStatusEnum value) {
    _$loginPageStateAtom.reportWrite(value, super.loginPageState, () {
      super.loginPageState = value;
    });
  }

  late final _$logOutStateAtom =
      Atom(name: '_AuthStore.logOutState', context: context);

  @override
  LoadingStatusEnum get logOutState {
    _$logOutStateAtom.reportRead();
    return super.logOutState;
  }

  @override
  set logOutState(LoadingStatusEnum value) {
    _$logOutStateAtom.reportWrite(value, super.logOutState, () {
      super.logOutState = value;
    });
  }

  late final _$profilePageStateAtom =
      Atom(name: '_AuthStore.profilePageState', context: context);

  @override
  LoadingStatusEnum get profilePageState {
    _$profilePageStateAtom.reportRead();
    return super.profilePageState;
  }

  @override
  set profilePageState(LoadingStatusEnum value) {
    _$profilePageStateAtom.reportWrite(value, super.profilePageState, () {
      super.profilePageState = value;
    });
  }

  late final _$createPageStateAtom =
      Atom(name: '_AuthStore.createPageState', context: context);

  @override
  LoadingStatusEnum get createPageState {
    _$createPageStateAtom.reportRead();
    return super.createPageState;
  }

  @override
  set createPageState(LoadingStatusEnum value) {
    _$createPageStateAtom.reportWrite(value, super.createPageState, () {
      super.createPageState = value;
    });
  }

  late final _$editPageStateAtom =
      Atom(name: '_AuthStore.editPageState', context: context);

  @override
  LoadingStatusEnum get editPageState {
    _$editPageStateAtom.reportRead();
    return super.editPageState;
  }

  @override
  set editPageState(LoadingStatusEnum value) {
    _$editPageStateAtom.reportWrite(value, super.editPageState, () {
      super.editPageState = value;
    });
  }

  late final _$cityListStateAtom =
      Atom(name: '_AuthStore.cityListState', context: context);

  @override
  LoadingStatusEnum get cityListState {
    _$cityListStateAtom.reportRead();
    return super.cityListState;
  }

  @override
  set cityListState(LoadingStatusEnum value) {
    _$cityListStateAtom.reportWrite(value, super.cityListState, () {
      super.cityListState = value;
    });
  }

  late final _$fcmTokenStateAtom =
      Atom(name: '_AuthStore.fcmTokenState', context: context);

  @override
  LoadingStatusEnum get fcmTokenState {
    _$fcmTokenStateAtom.reportRead();
    return super.fcmTokenState;
  }

  @override
  set fcmTokenState(LoadingStatusEnum value) {
    _$fcmTokenStateAtom.reportWrite(value, super.fcmTokenState, () {
      super.fcmTokenState = value;
    });
  }

  late final _$currencyStateAtom =
      Atom(name: '_AuthStore.currencyState', context: context);

  @override
  LoadingStatusEnum get currencyState {
    _$currencyStateAtom.reportRead();
    return super.currencyState;
  }

  @override
  set currencyState(LoadingStatusEnum value) {
    _$currencyStateAtom.reportWrite(value, super.currencyState, () {
      super.currencyState = value;
    });
  }

  late final _$countryStateAtom =
      Atom(name: '_AuthStore.countryState', context: context);

  @override
  LoadingStatusEnum get countryState {
    _$countryStateAtom.reportRead();
    return super.countryState;
  }

  @override
  set countryState(LoadingStatusEnum value) {
    _$countryStateAtom.reportWrite(value, super.countryState, () {
      super.countryState = value;
    });
  }

  late final _$contactAdminStateAtom =
      Atom(name: '_AuthStore.contactAdminState', context: context);

  @override
  LoadingStatusEnum get contactAdminState {
    _$contactAdminStateAtom.reportRead();
    return super.contactAdminState;
  }

  @override
  set contactAdminState(LoadingStatusEnum value) {
    _$contactAdminStateAtom.reportWrite(value, super.contactAdminState, () {
      super.contactAdminState = value;
    });
  }

  late final _$addAddressStateAtom =
      Atom(name: '_AuthStore.addAddressState', context: context);

  @override
  LoadingStatusEnum get addAddressState {
    _$addAddressStateAtom.reportRead();
    return super.addAddressState;
  }

  @override
  set addAddressState(LoadingStatusEnum value) {
    _$addAddressStateAtom.reportWrite(value, super.addAddressState, () {
      super.addAddressState = value;
    });
  }

  late final _$manageAddressPageStateAtom =
      Atom(name: '_AuthStore.manageAddressPageState', context: context);

  @override
  LoadingStatusEnum get manageAddressPageState {
    _$manageAddressPageStateAtom.reportRead();
    return super.manageAddressPageState;
  }

  @override
  set manageAddressPageState(LoadingStatusEnum value) {
    _$manageAddressPageStateAtom
        .reportWrite(value, super.manageAddressPageState, () {
      super.manageAddressPageState = value;
    });
  }

  late final _$cityListAtom =
      Atom(name: '_AuthStore.cityList', context: context);

  @override
  ObservableList<CityModel> get cityList {
    _$cityListAtom.reportRead();
    return super.cityList;
  }

  @override
  set cityList(ObservableList<CityModel> value) {
    _$cityListAtom.reportWrite(value, super.cityList, () {
      super.cityList = value;
    });
  }

  late final _$addressListAtom =
      Atom(name: '_AuthStore.addressList', context: context);

  @override
  ObservableList<AddressModel> get addressList {
    _$addressListAtom.reportRead();
    return super.addressList;
  }

  @override
  set addressList(ObservableList<AddressModel> value) {
    _$addressListAtom.reportWrite(value, super.addressList, () {
      super.addressList = value;
    });
  }

  late final _$accessTokenAtom =
      Atom(name: '_AuthStore.accessToken', context: context);

  @override
  String? get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String? value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  late final _$phoneNoAtom = Atom(name: '_AuthStore.phoneNo', context: context);

  @override
  String? get phoneNo {
    _$phoneNoAtom.reportRead();
    return super.phoneNo;
  }

  @override
  set phoneNo(String? value) {
    _$phoneNoAtom.reportWrite(value, super.phoneNo, () {
      super.phoneNo = value;
    });
  }

  late final _$currencyCodeAtom =
      Atom(name: '_AuthStore.currencyCode', context: context);

  @override
  String? get currencyCode {
    _$currencyCodeAtom.reportRead();
    return super.currencyCode;
  }

  @override
  set currencyCode(String? value) {
    _$currencyCodeAtom.reportWrite(value, super.currencyCode, () {
      super.currencyCode = value;
    });
  }

  late final _$countryCodeAtom =
      Atom(name: '_AuthStore.countryCode', context: context);

  @override
  String? get countryCode {
    _$countryCodeAtom.reportRead();
    return super.countryCode;
  }

  @override
  set countryCode(String? value) {
    _$countryCodeAtom.reportWrite(value, super.countryCode, () {
      super.countryCode = value;
    });
  }

  late final _$appUserAtom = Atom(name: '_AuthStore.appUser', context: context);

  @override
  Observable<AppUserModel>? get appUser {
    _$appUserAtom.reportRead();
    return super.appUser;
  }

  @override
  set appUser(Observable<AppUserModel>? value) {
    _$appUserAtom.reportWrite(value, super.appUser, () {
      super.appUser = value;
    });
  }

  late final _$adminContactDetailsAtom =
      Atom(name: '_AuthStore.adminContactDetails', context: context);

  @override
  Observable<AdminDetailsModel>? get adminContactDetails {
    _$adminContactDetailsAtom.reportRead();
    return super.adminContactDetails;
  }

  @override
  set adminContactDetails(Observable<AdminDetailsModel>? value) {
    _$adminContactDetailsAtom.reportWrite(value, super.adminContactDetails, () {
      super.adminContactDetails = value;
    });
  }

  late final _$selectedAppUserImageAtom =
      Atom(name: '_AuthStore.selectedAppUserImage', context: context);

  @override
  File? get selectedAppUserImage {
    _$selectedAppUserImageAtom.reportRead();
    return super.selectedAppUserImage;
  }

  @override
  set selectedAppUserImage(File? value) {
    _$selectedAppUserImageAtom.reportWrite(value, super.selectedAppUserImage,
        () {
      super.selectedAppUserImage = value;
    });
  }

  late final _$selectedCityAtom =
      Atom(name: '_AuthStore.selectedCity', context: context);

  @override
  CityModel? get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(CityModel? value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  late final _$selectedPickUplocationsAtom =
      Atom(name: '_AuthStore.selectedPickUplocations', context: context);

  @override
  AddressModel? get selectedPickUplocations {
    _$selectedPickUplocationsAtom.reportRead();
    return super.selectedPickUplocations;
  }

  @override
  set selectedPickUplocations(AddressModel? value) {
    _$selectedPickUplocationsAtom
        .reportWrite(value, super.selectedPickUplocations, () {
      super.selectedPickUplocations = value;
    });
  }

  late final _$selectedDeliverylocationsAtom =
      Atom(name: '_AuthStore.selectedDeliverylocations', context: context);

  @override
  AddressModel? get selectedDeliverylocations {
    _$selectedDeliverylocationsAtom.reportRead();
    return super.selectedDeliverylocations;
  }

  @override
  set selectedDeliverylocations(AddressModel? value) {
    _$selectedDeliverylocationsAtom
        .reportWrite(value, super.selectedDeliverylocations, () {
      super.selectedDeliverylocations = value;
    });
  }

  late final _$getOtpAsyncAction =
      AsyncAction('_AuthStore.getOtp', context: context);

  @override
  Future<void> getOtp(dynamic dto,
      {BuildContext? context, bool isInResend = false}) {
    return _$getOtpAsyncAction
        .run(() => super.getOtp(dto, context: context, isInResend: isInResend));
  }

  late final _$verifyOtpAsyncAction =
      AsyncAction('_AuthStore.verifyOtp', context: context);

  @override
  Future<void> verifyOtp(dynamic dto, {BuildContext? context}) {
    return _$verifyOtpAsyncAction
        .run(() => super.verifyOtp(dto, context: context));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$getProfileDataAsyncAction =
      AsyncAction('_AuthStore.getProfileData', context: context);

  @override
  Future<void> getProfileData() {
    return _$getProfileDataAsyncAction.run(() => super.getProfileData());
  }

  late final _$createAppUserAsyncAction =
      AsyncAction('_AuthStore.createAppUser', context: context);

  @override
  Future<void> createAppUser(
      {required AppUserDto data, required BuildContext context}) {
    return _$createAppUserAsyncAction
        .run(() => super.createAppUser(data: data, context: context));
  }

  late final _$getCityListAsyncAction =
      AsyncAction('_AuthStore.getCityList', context: context);

  @override
  Future<void> getCityList() {
    return _$getCityListAsyncAction.run(() => super.getCityList());
  }

  late final _$getCurrencyDataAsyncAction =
      AsyncAction('_AuthStore.getCurrencyData', context: context);

  @override
  Future<void> getCurrencyData() {
    return _$getCurrencyDataAsyncAction.run(() => super.getCurrencyData());
  }

  late final _$getCountryDataAsyncAction =
      AsyncAction('_AuthStore.getCountryData', context: context);

  @override
  Future<void> getCountryData() {
    return _$getCountryDataAsyncAction.run(() => super.getCountryData());
  }

  late final _$editAppUserAsyncAction =
      AsyncAction('_AuthStore.editAppUser', context: context);

  @override
  Future<void> editAppUser(
      {required AppUserDto data, required BuildContext context}) {
    return _$editAppUserAsyncAction
        .run(() => super.editAppUser(data: data, context: context));
  }

  late final _$addOrEditAddressUserAsyncAction =
      AsyncAction('_AuthStore.addOrEditAddressUser', context: context);

  @override
  Future<void> addOrEditAddressUser(dynamic dto,
      {required BuildContext context, bool isAdd = false}) {
    return _$addOrEditAddressUserAsyncAction.run(
        () => super.addOrEditAddressUser(dto, context: context, isAdd: isAdd));
  }

  late final _$getAddressListAsyncAction =
      AsyncAction('_AuthStore.getAddressList', context: context);

  @override
  Future<void> getAddressList() {
    return _$getAddressListAsyncAction.run(() => super.getAddressList());
  }

  late final _$getContactAdminAsyncAction =
      AsyncAction('_AuthStore.getContactAdmin', context: context);

  @override
  Future<void> getContactAdmin() {
    return _$getContactAdminAsyncAction.run(() => super.getContactAdmin());
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void onAvatarSelected(File image) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.onAvatarSelected');
    try {
      return super.onAvatarSelected(image);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getStoredValues() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getStoredValues');
    try {
      return super.getStoredValues();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getStoredPhone() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getStoredPhone');
    try {
      return super.getStoredPhone();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedImage() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.clearSelectedImage');
    try {
      return super.clearSelectedImage();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toSelectCity(int index, CityModel item) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.toSelectCity');
    try {
      return super.toSelectCity(index, item);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getStoredCurrencValues() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getStoredCurrencValues');
    try {
      return super.getStoredCurrencValues();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getStoredCountryValues() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getStoredCountryValues');
    try {
      return super.getStoredCountryValues();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toSelectAddress(int index, AddressModel item, String type) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.toSelectAddress');
    try {
      return super.toSelectAddress(index, item, type);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getOtpPageState: ${getOtpPageState},
verifyOtpPageState: ${verifyOtpPageState},
loginPageState: ${loginPageState},
logOutState: ${logOutState},
profilePageState: ${profilePageState},
createPageState: ${createPageState},
editPageState: ${editPageState},
cityListState: ${cityListState},
fcmTokenState: ${fcmTokenState},
currencyState: ${currencyState},
countryState: ${countryState},
contactAdminState: ${contactAdminState},
addAddressState: ${addAddressState},
manageAddressPageState: ${manageAddressPageState},
cityList: ${cityList},
addressList: ${addressList},
accessToken: ${accessToken},
phoneNo: ${phoneNo},
currencyCode: ${currencyCode},
countryCode: ${countryCode},
appUser: ${appUser},
adminContactDetails: ${adminContactDetails},
selectedAppUserImage: ${selectedAppUserImage},
selectedCity: ${selectedCity},
selectedPickUplocations: ${selectedPickUplocations},
selectedDeliverylocations: ${selectedDeliverylocations},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
