import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/routes.dart';
import 'package:spotless/services_config.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/storage_manager.dart';
import 'package:spotless/store/auth_store/auth_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spotless/store/notification_store/notification_store.dart';
import 'app_localizations.dart';

/// global localization of Android Notification channel

AndroidNotificationChannel? channel;

/// global localization of [FlutterLocalNotificationsPlugin]

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

///root of the project

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// declaration and initialization of [SharedPreferences] for local storage
  SharedPreferences sharedPref = await SharedPreferences.getInstance();

  /// initialization of [StorageManager]

  StorageManager.init(sharedPref);

  /// this [SystemChrome.setSystemUIOverlayStyle] used to change status bar color to [transparent]
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  /// this is the function calling of locator , for dependency injection
  setupLocator();

  /// setting Android platform Notification channel usin [AndroidNotificationChannel]

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    /// integrating local channel with [FlutterLocalNotificationsPlugin]

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();
  final AuthStore _authStore = locator.get<AuthStore>();
  final NotificationStore _notificationStore = locator.get<NotificationStore>();

  late AppLocalizationsDelegate _localizationDelegate;
  late Locale currentLocale;

  String initialRoute = '/login_page';

  @override
  void initState() {
    super.initState();
    _initLocalization();
    _initHttp();
  }

  /// one signal key for accessing one signal

  static final String oneSignalAppId = '3b8c2e13-15b4-40f7-9a46-549b43bb6523';

  /// one singanl platform integration with key

  Future<void> initPlatformState() async {
    if (!mounted) return;
    print('${_authStore.appUser!.value.phone}');

    /// setting [externalUserId] as app user phone number

    final externalUserId = "${_authStore.appUser!.value.phone}";

    /// This [setExternalUserId] one signal fun is used to genarate external user id using app user mobile no

    OneSignal.shared.setExternalUserId(externalUserId).then((results) {
      print("${results.toString()}");
    }).catchError((error) {
      print("${error.toString()}");
    });

    /// OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(oneSignalAppId);

    /// access permission of one signal
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });

    /// Foreground massgae handling in one signal plugin side [OSNotificationReceivedEvent] observer event

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(null);

      /// if the notification is null , it won't invoke the [flutterLocalNotificationsPlugin]

      if (event.notification != null) {
        flutterLocalNotificationsPlugin!.show(
            event.notification.hashCode,
            event.notification.title,
            event.notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel!.id, channel!.name,
                  channelDescription: channel!.description,
                  icon: 'launch_background',
                  priority: Priority.high),
            ));
      }

      /// This [onFCMReceived] fun is used to receive notification and also store the notification in local storage
      /// ,when the notification came to the device

      _notificationStore.onFCMReceived(
        {
          "title": "${event.notification.title}",
          "message": "${event.notification.body}"
        },
      );
    });

    /// this one signal fun [setNotificationOpenedHandler] is used to handling notification when open the notification
    /// , when it open it will store the notification in local storage

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      _notificationStore.onFCMReceived(
        {
          "title": "${result.notification.title}",
          "message": "${result.notification.body}"
        },
      );
      navKey.currentState?.pushNamed('/notification_page');
    });
  }

  /// This [_initHttp] fun is used for initialize service config classes

  _initHttp() {
    print(_authStore.isLoggedIn);

    if (_authStore.isLoggedIn) {
      HttpClient.init(headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer ${_authStore.accessToken}",
      });
      initialRoute = "/home_page";
      initPlatformState();
    } else
      HttpClient.init();
  }

  /// This [_initLocalization] used for internationalization

  _initLocalization() {
    currentLocale = Locale('en');
    _localizationDelegate =
        new AppLocalizationsDelegate(newLocale: currentLocale);
    applicationLocale.onLocaleChanged = onLocaleChange;
  }

  /// In this [MaterialApp] containe [ScreenUtil] is used for responsiveness

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(390, 844),
        builder: (context, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Spotless',
              themeMode: ThemeMode.light,
              builder: BotToastInit(),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                fontFamily: "Poppins",
                scaffoldBackgroundColor: MainTheme.whiteTypeColor,
                colorScheme:
                    ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
                  secondary: Colors.grey.shade300,
                  brightness: Brightness.dark,
                ),
              ),
              theme: ThemeData(
                brightness: Brightness.light,
                fontFamily: "Poppins",
                scaffoldBackgroundColor: MainTheme.whiteTypeColor,
                colorScheme:
                    ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
                  secondary: Colors.grey.shade300,
                  brightness: Brightness.light,
                ),
              ),
              initialRoute: initialRoute,
              navigatorKey: navKey,
              navigatorObservers: [routeObserver, BotToastNavigatorObserver()],
              locale: currentLocale,
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                _localizationDelegate,
                AppLocalizationsDelegate(newLocale: currentLocale),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: applicationLocale.supportedLocales(),
              onGenerateRoute: (RouteSettings settings) =>
                  onGeneratedRoute(settings),
            ));
  }

  /// This [_initLocalization] used for internationalization

  void onLocaleChange(Locale locale) {
    setState(() {
      _localizationDelegate = AppLocalizationsDelegate(newLocale: locale);
      currentLocale = locale;
    });
  }
}
