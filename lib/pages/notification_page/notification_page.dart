import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/notification_page/widgets/notification_card.dart';
import 'package:spotless/shared/model/notification/notification.dart';
import 'package:spotless/shared/shimmers/order_shimmer.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/app_bar.dart';
import 'package:spotless/store/notification_store/notification_store.dart';

import '../../app_localizations.dart';

import '../../shared/shimmers/notification_shimmer.dart';
import 'package:grouped_list/grouped_list.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationStore _notificationStore = locator.get<NotificationStore>();

  String get todayDay {
    var date = DateTime.now();
    DateFormat _fmt = new DateFormat('MMM d');
    return _fmt.format(date.toLocal());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (_notificationStore.notificationList.isEmpty) {
      _notificationStore.notificationLength = 0;
      _notificationStore.saveNotificationListLength(0);
    } else {
      _notificationStore.notificationLength =
          _notificationStore.notificationList.length;
      _notificationStore.saveNotificationListLength(
          _notificationStore.notificationList.length);
    }
    _notificationStore.addNotificationCount();
  }

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
              name: AppTranslations.of(context)!
                  .text('NOTIFICATION', 'NOTIFICATION'),
              onTapLeading: () {
                _onBackButtonTap(context);
              },
            ),
            body: Observer(builder: (BuildContext context) {
              if (_notificationStore.notificationList.isEmpty) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child: Text(
                      AppTranslations.of(context)!
                          .text('GENERAL', 'NO DATA FOUND'),
                      style: TextStyle(color: Colors.black),
                    )));
              }

              return SingleChildScrollView(
                  padding: EdgeInsets.only(left: 14.w, right: 14.w),
                  child: Column(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(bottom: 15.h),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.only(left: 4.w),
                      //         child: Text(
                      //           "Today",
                      //           style: TextStyle(
                      //               fontSize: 18.sp,
                      //               color: MainTheme.blackypeColor,
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // ListView.builder(
                      //   itemCount: _notificationStore.notificationList.length,
                      //   shrinkWrap: true,
                      //   physics: const ClampingScrollPhysics(),
                      //   itemBuilder: (BuildContext context, int index) {
                      //     NotificationModel? item =
                      //         _notificationStore.notificationList[index];
                      //     return NotificationCard(
                      //       title: item.title == null ? "" : item.title,
                      //       date: item.date == null
                      //           ? ""
                      //           : "${item.formattedDate}",
                      //       description:
                      //           item.message == null ? "" : item.message,
                      //     );
                      //   },
                      // ),

                      GroupedListView<NotificationModel, String>(
                        shrinkWrap: true,
                        elements: _notificationStore.notificationList,
                        groupBy: (element) => element.formattedDateGroup,
                        itemBuilder: (context, element) {
                          NotificationModel? item = element;
                          return NotificationCard(
                            title: item.title == null ? "" : item.title,
                            date: item.date == null
                                ? ""
                                : "${item.formattedDate}",
                            description:
                                item.message == null ? "" : item.message,
                          );
                        },
                        groupSeparatorBuilder: (String value) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: value == todayDay
                              ? Text(
                                  'Today',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  value,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                        floatingHeader: true, // optional
                        order: GroupedListOrder.DESC, // optional
                      ),
                    ],
                  ));
            })));
  }

  /// This [_onBackButtonTap] fun handle the device back button press

  Future<bool> _onBackButtonTap(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
    return Future.value(false);
  }
}
