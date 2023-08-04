import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/pages/cart_page/widgets/subscription_card.dart';
import 'package:spotless/shared/theme/theme.dart';

import '../../../app_localizations.dart';

class ActivePlan extends StatefulWidget {
  final String? subscriptionName;
  final String? subscriptionCode;
  final String? dateOfValidity;
  final String? totalQty;
  final String? usedQty;
  final String? reminningQty;
  const ActivePlan(
      {Key? key,
      this.dateOfValidity,
      this.reminningQty,
      this.subscriptionCode,
      this.subscriptionName,
      this.totalQty,
      this.usedQty})
      : super(key: key);

  @override
  State<ActivePlan> createState() => _ActivePlanState();
}

class _ActivePlanState extends State<ActivePlan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 2.w),
          child: Row(
            children: [
              Text(
                AppTranslations.of(context)!.text('MY CART', 'ACTIVE PLAN'),
                style: TextStyle(
                    color: MainTheme.blackypeColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SubscriptionCard(
          subscriptionName: widget.subscriptionName,
          subscriptionCode: widget.subscriptionCode,
          // "XAF25/M",
          dateOfValidity: widget.dateOfValidity,
          totalQty: "${widget.totalQty}",
          usedQty: "${widget.usedQty}",
          reminningQty: "${widget.reminningQty}",
        ),
      ],
    );
  }
}
