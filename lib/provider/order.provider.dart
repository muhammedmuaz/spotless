import 'dart:convert';
import 'package:dio/dio.dart';
import '../services_config.dart';
import '../shared/model/product/product.model.dart';

class OrderProvider {
  /// [getActivePlan] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/active-plan?] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getActivePlan({String? token}) async {
    try {
      final String url = "customer/orders/active-plan?";
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

  /// [getManyOrder] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/order-detail/13] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getManyOrder({String? token}) async {
    try {
      final String url = "customer/orders/order-detail/13";
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

  /// [getOneOrderDetails] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/order-detail/13] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getOneOrderDetails({String? token}) async {
    try {
      final String url = "customer/orders/order-detail/13";
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

  /// [createOrders] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/create] api
  /// This method is [post],
  /// this fun pass [token] ,[input] as arg

  Future<dynamic> createOrders(
      {CreateOrderDto? input, required String token}) async {
    List<String> serviceList =
        input!.orderDetails!.map((e) => jsonEncode(e)).toList();
    final Map<String, dynamic> _input = {
      "data": {
        "order": {
          "total_credits": "${input.totalCredits}",
          "delivery_address": "${input.deliveryAddress}",
          "pickup_address": "${input.pickupAddress}",
          "delivery_date": "${input.deliveryDate}",
          "pickup_date": "${input.pickupDate}",
          "pickup_time": input.pickupTime,
          "order_date": input.orderDate,
          "order_details": serviceList.map((e) => jsonDecode(e)).toList(),
        }
      }
    };
    print(
        "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm ${_input}");
    try {
      final String url = "customer/orders/create";
      Response resp = await http!.authService.post(url,
          data: _input,
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

  /// [getManyOrders] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/all-orders?page=$pageIndex]
  /// or [http://spotless.vooly.in/api/customer/orders/all-orders?page=$pageIndex] api according to the conditions we apply
  /// This method is [get],
  /// this fun pass [token] ,[pageIndex] ,[orderStatus], as arg

  Future<dynamic> getManyOrders(
      {int? pageIndex, String? token, required String? orderStatus}) async {
    try {
      final String url = orderStatus == "ALL ORDER"
          ? "customer/orders/all-orders?page=$pageIndex"
          : "customer/orders/filtered-orders/${urlAccordingToStatus(orderStatus)}?page=$pageIndex";
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${url}");
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

  ///this [urlAccordingToStatus] fun is switch case for [getManyOrders] fun

  String? urlAccordingToStatus(String? item) {
    switch (item) {
      case "ALL ORDER":
        return "-1";
      case "PENDING":
        return "0";
      case "ACCEPTED":
        return "1";
      case "OUT FOR PICK UP":
        return "2";
      case "REJECTED":
        return "3";
      case "PROCESSING":
        return "4";
      case "READY FOR DELIVERY":
        return "5";
      case "OUT FOR DELIVERY":
        return "6";
      case "DELIVERD":
        return "7";
      case "RECIVED":
        return "8";
    }
  }

  /// [getOneOrder] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/order-detail/$id] api
  /// This method is [get],
  /// this fun pass [token],[id] as arg

  Future<dynamic> getOneOrder({String? token, required int? id}) async {
    try {
      final String url = "customer/orders/order-detail/$id";
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${url}");
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

  /// [getExpiredSoon] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/expired-soon] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getExpiredSoon({String? token}) async {
    try {
      final String url = "customer/orders/expired-soon";
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

  /// [getOrderCount] this fun is used for retrieve [Response] from [http://spotless.vooly.in/api/customer/orders/order-count] api
  /// This method is [get],
  /// this fun pass [token] as arg

  Future<dynamic> getOrderCount({String? token}) async {
    try {
      final String url = "customer/orders/order-count";
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
}

/// [CreateOrderDto] class is used for retrieve value from corresponding page

class CreateOrderDto {
  CreateOrderDto({
    this.totalCredits,
    this.deliveryAddress,
    this.pickupAddress,
    this.deliveryDate,
    this.pickupDate,
    this.pickupTime,
    this.orderDate,
    this.orderDetails,
  });
  int? totalCredits;
  int? deliveryAddress;
  int? pickupAddress;
  String? deliveryDate;
  String? pickupDate;
  String? pickupTime;
  String? orderDate;
  List<ServiceDtoModel>? orderDetails;
}
