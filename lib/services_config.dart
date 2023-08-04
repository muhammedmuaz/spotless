/// [HttpClient] class is a [Dio] class  for making [http] request
/// [parseError] is used for error handling and recovery ,it will give the [http] error massage

import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String serverurl = 'http://spotless.vooly.in/api/';

const String authServiceUrl = serverurl;

HttpClient? http;

class HttpClient {
  static Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    "Authorization": "bearer guest",
  };

  String accessToken = 'guest';
  final Dio authService;

  HttpClient({
    required this.authService,
  });

  /// this [HttpClient.init()] fun is used to initialize the [HttpClient] using [Dio]

  factory HttpClient.init({Map<String, String>? headers}) {
    // int timeout = 10000; //ms
    http = HttpClient(
      authService: Dio(BaseOptions(
          baseUrl: authServiceUrl,
          // connectTimeout: timeout,
          // receiveTimeout: timeout,
          headers: headers ?? requestHeaders)),
    );
    return http!;
  }

  /// This [parseError] fun is used to parse the error from api functions inside the [provider] classes

  String parseError(DioError error) {
    checkInternetConnection();
    if (error.response == null) {
      return error.message;
    } else {
      if (error.response!.data.runtimeType == String) {
        return error.response!.data;
      }
      if (error.response!.data['message'].runtimeType == String) {
        return error.response!.data['message'];
      }

      if (error.response!.data['error'] != null &&
          error.response!.data['error'].runtimeType == String) {
        return error.response!.data['error'];
      } else {
        return 'Something went wrong , Please Check Your Internet Connection';
      }
    }
  }

  /// This [checkInternetConnection] is used to check the internet connection is present or not

  checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('spotless.vooly.in');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      BotToast.showText(
          text: 'Please Check Your Internet Connection',
          duration: const Duration(seconds: 2));
    }
  }
}
