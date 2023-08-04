import 'dart:io';

import 'package:dio/dio.dart';

import '../services_config.dart';

class AuthProvider {
  /// [getOneOtp] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer-login] api
  /// This method is [post],

  Future<dynamic> getOneOtp(dto) async {
    try {
      final String url = "customer-login";
      Response resp = await http!.authService.post(url, data: dto);
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [verifyOneOtp] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer-otp] api
  /// This method is [post],

  Future<dynamic> verifyOneOtp(dto) async {
    try {
      final String url = "customer-otp";
      Response resp = await http!.authService.post(url, data: dto);
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [loginUser] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer-login] api
  /// This method is [post],
  /// this fun pass [dto] as arg

  Future<dynamic> loginUser(dto) async {
    try {
      final String url = "customer-login";
      Response resp = await http!.authService.post(url, data: dto);
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [logOutUser] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/logout-customer] api
  /// This method is [post],
  /// this fun pass [token] as arg

  Future<dynamic> logOutUser({String? token}) async {
    try {
      final String url = "customer/logout-customer";
      Response resp = await http!.authService.post(url,
          options: Options(headers: {
            'Token': '$token',
          }));
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [getAppUserData] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/get-profile-data] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getAppUserData({String? token}) async {
    try {
      final String url = "customer/get-profile-data";
      Response resp = await http!.authService.get(url,
          options: Options(headers: {
            'Token': '$token',
          }));
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [signUpAppUser] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer-registration] api
  /// This method is [post],
  /// this fun pass [data] as arg

  Future<dynamic> signUpAppUser({
    required FormData data,
  }) async {
    try {
      final String url = "customer-registration";
      Response resp = await http!.authService.post(
        url,
        data: data,
      );
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [editAppUser] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/edit-profile] api
  /// This method is [post],
  /// this fun pass [data],[token] as arg

  Future<dynamic> editAppUser({
    required FormData data,
    String? token,
  }) async {
    try {
      final String url = "customer/edit-profile";
      Response resp = await http!.authService.post(url,
          data: data,
          options: Options(headers: {
            'Token': '$token',
          }));
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [getManyCityList] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-city-list] api
  /// This method is [get],

  Future<dynamic> getManyCityList() async {
    try {
      final String url = "get-city-list";
      Response resp = await http!.authService.get(url);
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [getAppCurrency] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-master-currency] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getAppCurrency({String? token}) async {
    try {
      final String url = "get-master-currency";
      Response resp = await http!.authService.get(
        url,
      );
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [getAppCountryCode] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-master-country-code] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getAppCountryCode({String? token}) async {
    try {
      final String url = "get-master-country-code";
      Response resp = await http!.authService.get(
        url,
      );
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [addOrEditUserAddress] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/add-address] 
  /// or [http://spotless.vooly.in/api/customer/edit-address] api according to the conditions we apply
  /// This method is [post],
  /// this fun pass [token],[dto] as arg

  Future<dynamic> addOrEditUserAddress(dto, String token,
      {bool isAdd = false}) async {
    try {
      final String url =
          isAdd ? "customer/add-address" : "customer/edit-address";

      Response resp = await http!.authService.post(url,
          data: dto,
          options: Options(headers: {
            'Token': '$token',
          }));
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [getUserAddress] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/get-address] api 
  /// This method is [get], 
  /// this fun pass [token] as arg 

  Future<dynamic> getUserAddress({String? token}) async {
    try {
      final String url = "customer/get-address";
      Response resp = await http!.authService.get(url,
          options: Options(headers: {
            'Token': '$token',
          }));
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }

  /// [getAdminContactDetails] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-admin-name-and-phone] api 
  /// This method is [get] 

  Future<dynamic> getAdminContactDetails() async {
    try {
      final String url = "get-admin-name-and-phone";
      Response resp = await http!.authService.get(
        url,
      );
      return resp.data;
    } on DioError catch (e) {
      return {'status': 'error', 'message': http!.parseError(e)};
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Something went wrong , Please Check Your Internet Connection'
      };
    }
  }
}

/// This [AppUserDto] class is used to get data from page  
/// This class has [email],[name],[phone],[cityId],[referral],[selectedAppUserImage]

class AppUserDto {
  AppUserDto({
    required this.email,
    required this.name,
    this.phone,
    required this.cityId,
    required this.referral,
    this.selectedAppUserImage,
  });
  final String email;
  final String name;
  final String? phone;
  final String cityId;
  final String referral;
  File? selectedAppUserImage;
}
