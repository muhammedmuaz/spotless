import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/pages/track_order_page/widgets/track_order_card.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';

class TrackOrderPage extends StatefulWidget {
  final int? step;
  const TrackOrderPage({Key? key, this.step}) : super(key: key);

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  List<String> steps = [
    'Order Pending',
    'Order Accepted',
    'Out For Pick-Up',
    'Order Processing',
    'Ready For Delivery',
    'Out For Delivery',
    'Out For Delivery',
    'Order Delivered'
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onBackButtonTap(context);
      },
      child: Scaffold(
        appBar: CommonAppBar(
          color: Colors.white,
          showLeading: true,
          elevation: 0,
          leadingWidth: 80.w,
          leadingPadding: const EdgeInsets.all(5),
          name: 'ORD-00123',
          showAction: true,
          actionIcon: Container(
              margin: EdgeInsets.only(right: 16.w, top: 23.h),
              child: Text(
                "Mar 21",
                style:
                    TextStyle(fontSize: 12.sp, color: MainTheme.greyTypeColor),
              )),
          onTapAction: () {},
          onTapLeading: () {
            _onBackButtonTap(context);
          },
        ),
        body: ListView.builder(
          itemCount: steps.length,
          padding: EdgeInsets.only(left: 16.w, top: 50.h),
          // scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            String item = steps[index];
            return TrackOrderCard(
              index: index,
              name: item,
              step: widget.step,
              isEnd: index == steps.length - 1 ? true : false,
            );
            // return OrderItemCard(
            //   step: 0,
            //   index: index,
            //   isEnd: index == 7 ? true : false,
            // );
          },
        ),
      ),
    );
  }

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushReplacementNamed(
      context,
      "/my_order_details_page",
    );
    return Future.value(false);
  }
}
