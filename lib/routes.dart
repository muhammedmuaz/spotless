/// [Routes] calss is used for navigation and routing

import 'package:flutter/material.dart';

import 'package:spotless/pages/address_page/address_page.dart';
import 'package:spotless/pages/all_service_page/all_service_page.dart';

import 'package:spotless/pages/cart_page/cart_page.dart';
import 'package:spotless/pages/category_page/category_page.dart';
import 'package:spotless/pages/checkout_page/checkout_page.dart';
import 'package:spotless/pages/checkout_sucess_page/checkout_sucess_page.dart';
import 'package:spotless/pages/choose_plan_page/choose_plan_page.dart';
import 'package:spotless/pages/confirm_plan_page/confirm_plan_page.dart';
import 'package:spotless/pages/credits_page/credits_page.dart';
import 'package:spotless/pages/edit_profile_page/edit_profile_page.dart';
import 'package:spotless/pages/extar_credit_page/extra_credit_page.dart';
import 'package:spotless/pages/home_page/home_page.dart';
import 'package:spotless/pages/login_page/login_page.dart';
import 'package:spotless/pages/manage_address_page/manage_address_page.dart';
import 'package:spotless/pages/my_orders_page/my_order_page.dart';
import 'package:spotless/pages/otp_page/otp_page.dart';
import 'package:spotless/shared/model/order/order.model.dart';
import 'package:spotless/shared/model/referral/referral.model.dart';
import 'package:spotless/shared/widgets/no_connection_error_page.dart';
import 'package:spotless/pages/notification_page/notification_page.dart';
import 'package:spotless/pages/order_details_page/order_details_page.dart';
import 'package:spotless/pages/profile_page/profile_page.dart';
import 'package:spotless/pages/redeem_cash_page.dart/redeem_cash_page.dart';
import 'package:spotless/pages/redeem_success_page.dart/redeem_success_page.dart';
import 'package:spotless/pages/referral_history_page/referral_history_page.dart';
import 'package:spotless/pages/referral_page/referral_page.dart';
import 'package:spotless/pages/register_page/register_page.dart';
import 'package:spotless/pages/search_page/search_page.dart';
import 'package:spotless/pages/track_order_page/track_order_page.dart';

/// This [onGeneratedRoute] fun used for switch case of static pages
/// it has the [RouteSettings] as it param

onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => LoginPage(),
      );

    case '/otp_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => OtpPage(),
      );

    case '/register_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => RegisterPage(),
      );

    case '/home_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => HomePage(),
      );
    case '/notification_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => NotificationPage(),
      );
    case '/category_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => CategoryPage(),
      );

    case '/all_service_page':
      final bool? args = settings.arguments as bool?;
      return NoAnimationRoute(
        builder: (BuildContext context) => AllServicePage(
          fromAppBar: args == null ? true : args,
        ),
      );

    case '/cart_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => CartPage(),
      );
    case '/choose_plan_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => ChoosePlanePage(),
      );

    case '/confirom_plan_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => ConfirmPlanPage(),
      );

    case '/checkout_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => CheckoutPage(),
      );

    case '/address_page':
      final String? args = settings.arguments as String;
      return NoAnimationRoute(
        builder: (BuildContext context) => AddressPage(
          locationType: args,
        ),
      );

    case '/checkout_sucess_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const CheckoutSucessPage(),
      );
    case '/profile_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const ProfilePage(),
      );
    case '/manage_address_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const ManageAddressPage(),
      );
    case '/edit_profile_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const EditProfilePage(),
      );
    case '/extra_credits_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const ExtarCreditPage(),
      );
    case '/referral_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const ReferralPage(),
      );
    case '/referral_history_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const ReferralHistoryPage(),
      );

    case '/my_order_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const MyOrderPage(),
      );

    case '/my_order_details_page':
      final OrderModel? args = settings.arguments as OrderModel;
      return NoAnimationRoute(
        builder: (BuildContext context) => OrderDetailsPage(
          item: args,
        ),
      );

    // case '/track_order_page':
    //   int args = settings.arguments as int;
    //   return NoAnimationRoute(
    //     builder: (BuildContext context) => TrackOrderPage(
    //       step: args,
    //     ),
    //   );

    case '/search_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => SearchPage(),
      );

    case '/redeem_success_page':
      RedeemSuccessPageParam args =
          settings.arguments as RedeemSuccessPageParam;
      return NoAnimationRoute(
        builder: (BuildContext context) => RedeemSuccessPage(
          item: args,
        ),
      );

    case '/redeem_cash_page':
      RedeemSuccessPageParam args =
          settings.arguments as RedeemSuccessPageParam;
      return NoAnimationRoute(
        builder: (BuildContext context) => RedeemCashPage(
          item: args,
        ),
      );

    case '/credits_page':
      return NoAnimationRoute(
        builder: (BuildContext context) => const CreditsPage(),
      );
  }
}

/// This [NoAnimationRoute] class is used to navigate without transitions
/// this is a [RouteSettings] to control the navigations

class NoAnimationRoute<T> extends MaterialPageRoute<T> {
  NoAnimationRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

/// This [RedeemSuccessPageParam] class is used to get values from particular pages
/// [value],[point],[type],[message],[selectedItem] are it's attributes

class RedeemSuccessPageParam {
  RedeemSuccessPageParam(
      {this.message, this.type, this.value, this.point, this.selectedItem});
  final String? value;
  final String? point;
  final String? type;
  final String? message;
  final SlabModel? selectedItem;
}
