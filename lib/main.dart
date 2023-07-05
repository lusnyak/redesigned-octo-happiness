import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/constants/app_colors.dart';
import 'package:test_app_flutter/core/routes/routes_name.dart';
import 'package:test_app_flutter/presentation/login/login_provider.dart';
import 'package:test_app_flutter/presentation/profile/provider/profile_provider.dart';

import 'core/utils/navigator_state_helper.dart';
import 'core/utils/shared_preferences_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().getInstance();
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..maskType = EasyLoadingMaskType.custom
    ..indicatorSize = 40.0
    ..radius = 10.0
    ..boxShadow = [
      BoxShadow(
        color: AppColor.blackColor.withOpacity(0.1),
        offset: const Offset(1.0, 2.0),
        blurRadius: 50.0,
      )
    ]
    ..backgroundColor = AppColor.whiteColor
    ..indicatorColor = AppColor.violetColor
    ..maskColor = AppColor.blackColor.withOpacity(0.2)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _sharedPrefManager = SharedPreferencesManager();
  String? initialRoute;

  @override
  void initState() {
    super.initState();
    _sharedPrefManager.getInstance();
    _checkUserLoginState();
  }

  _checkUserLoginState() {
    if (_sharedPrefManager.token.isEmpty) {
      _sharedPrefManager.removeAll();
      initialRoute = AppRouteName.login;
    } else {
      initialRoute = AppRouteName.mainTab;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child:  CupertinoApp(
        navigatorKey: NavigatorStateHelper.globalKey,
        theme: const CupertinoThemeData(
          scaffoldBackgroundColor: AppColor.scaffoldBgColor,
          barBackgroundColor: AppColor.whiteColor,
          primaryColor: AppColor.violetColor
        ),
        title: 'Test App',
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoutes,
        builder: EasyLoading.init(),
      ),
    );
  }
}
