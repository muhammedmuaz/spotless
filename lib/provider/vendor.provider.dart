import 'dart:convert';
import 'package:dio/dio.dart';
import '../services_config.dart';

class VendorProvider {
  /// [getHomeData] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/dashboard] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getHomeData({String? token}) async {
    try {
      final String url = "customer/dashboard";
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

  /// [getManyServiceCategoryPageData] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-service-category-list-with-paginate?page=$pageIndex] api
  /// This method is [get],
  /// this fun pass [pageIndex] as arg

  Future<dynamic> getManyServiceCategoryPageData({
    int? pageIndex,
  }) async {
    try {
      final String url =
          "get-service-category-list-with-paginate?page=$pageIndex";
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

  /// [getManyServices] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-service-list-with-paginate?page=$pageIndex] api
  /// or [http://spotless.vooly.in/api/get-service-list-by-category-id/$categoryId?page=$pageIndex] api according to the conditions we apply
  /// This method is [get],
  /// this fun pass [pageIndex],[token],[userId],[categoryId] as arg

  Future<dynamic> getManyServices({
    String? token,
    int? pageIndex,
    int? userId,
    int? categoryId,
  }) async {
    try {
      final String url = categoryId == null
          ? "get-service-list-with-paginate?page=$pageIndex"
          : "get-service-list-by-category-id/$categoryId?page=$pageIndex";

      print(
          'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss ${url}');

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

  /// [getManyCategory] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-service-category-list] api
  /// This method is [get],

  Future<dynamic> getManyCategory() async {
    try {
      final String url = "get-service-category-list";
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

  /// [getManyPlanData] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-plan-list] api
  /// This method is [get],

  Future<dynamic> getManyPlanData() async {
    try {
      final String url = "get-plan-list";
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

  /// [getManySearchServiceList] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/get-service-by-name?service_name=$query&page=$pageIndex] api
  /// This method is [get],
  /// this fun pass [pageIndex] as arg

  Future<dynamic> getManySearchServiceList(
      {int? pageIndex, String? query, String? token}) async {
    try {
      final String url =
          "get-service-by-name?service_name=$query&page=$pageIndex";

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

  /// [getOneReferralPoints] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/referral/available-points] api
  /// This method is [get],

  Future<dynamic> getOneReferralPoints({String? token}) async {
    try {
      final String url = "customer/referral/available-points";
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

  /// [getManyMyReferralList] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/referral/my-referral?page=$pageIndex] api
  /// This method is [get],
  /// this fun pass [pageIndex] as arg

  Future<dynamic> getManyMyReferralList({
    String? token,
    int? pageIndex,
  }) async {
    try {
      final String url = "customer/referral/my-referral?page=$pageIndex";
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

  /// [getManySlabList] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/referral/referral-settings] api
  /// This method is [get],
  /// this fun pass [pageIndex] as arg

  Future<dynamic> getManySlabList({String? token}) async {
    try {
      final String url = "customer/referral/referral-settings";
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

  /// [getManyReferralHistory] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/referral/history?page=$pageIndex] api
  /// This method is [get],
  /// this fun pass [pageIndex],[token] as arg

  Future<dynamic> getManyReferralHistory({
    String? token,
    int? pageIndex,
  }) async {
    try {
      final String url = "customer/referral/history?page=$pageIndex";
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

  /// [redeemAsCredit] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/referral/redeem?] api
  /// This method is [post],
  /// this fun pass [dto],[token] as arg

  Future<dynamic> redeemAsCredit(dto, String token) async {
    try {
      final String url = "customer/referral/redeem?";
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

  /// [redeemAsCash] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/referral/redeem?] api
  /// This method is [post],
  /// this fun pass [dto],[token] as arg

  Future<dynamic> redeemAsCash(dto, String token) async {
    try {
      final String url = "customer/referral/redeem?";

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
}

/// [CreatePaymentDto] class is used for retrieve value from corresponding page
class CreatePaymentDto {
  CreatePaymentDto(
      {this.customerId,
      this.createdBy,
      this.paidAmount,
      this.paidDate,
      this.note});
  int? customerId;
  int? createdBy;
  int? paidAmount;
  String? paidDate;
  String? note;
}
