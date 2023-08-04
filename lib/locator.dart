/// This [setupLocator] fun used for accesing global variables
/// It is [GetIt] instance for [Singleton] object

import 'package:get_it/get_it.dart';
import 'package:spotless/provider/auth.provider.dart';
import 'package:spotless/provider/order.provider.dart';
import 'package:spotless/provider/vendor.provider.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:spotless/store/cart_store/cart_store.dart';
import 'package:spotless/store/notification_store/notification_store.dart';
import 'package:spotless/store/vendor_store/vendor_store.dart';

final locator = GetIt.instance;

void setupLocator() async {
  locator
    ..registerLazySingleton<AuthProvider>(() => AuthProvider())
    ..registerLazySingleton<VendorProvider>(() => VendorProvider())
    ..registerLazySingleton<OrderProvider>(() => OrderProvider())
    ..registerLazySingleton<AuthStore>(() => AuthStore())
    ..registerLazySingleton<VendorStore>(() => VendorStore())
    ..registerLazySingleton<NotificationStore>(() => NotificationStore())
    ..registerLazySingleton<CartStore>(() => CartStore());
}
