import 'package:flutter/cupertino.dart';
import 'package:test_app_flutter/presentation/login/login_page.dart';
import 'package:test_app_flutter/presentation/main_tab/main_tab_page.dart';

class AppRouteName {
  static const mainTab = '/mainTab';
  static const login = '/login';
}

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRouteName.mainTab:
      return _buildRoute(const MainTabPage(), settings);
    case AppRouteName.login:
      return _buildRoute(const LoginPage(), settings);

    default:
      return _buildRoute(CupertinoPageScaffold(child: Container()), settings);
  }
}

_buildRoute(Widget widget, RouteSettings settings) {
  return CupertinoPageRoute(builder: (context) => widget);
  // return MaterialPageRoute(builder: (context) => widget, settings: settings);
}
