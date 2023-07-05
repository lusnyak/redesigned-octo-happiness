import 'package:flutter/material.dart';
import 'package:test_app_flutter/core/models/login/user/user_model.dart';
import 'package:test_app_flutter/core/routes/routes_name.dart';
import 'package:test_app_flutter/core/utils/navigator_state_helper.dart';
import 'package:test_app_flutter/core/utils/shared_preferences_manager.dart';

class ProfileProvider extends ChangeNotifier {
  
  ProfileProvider() {
    List<String> userInfo = SharedPreferencesManager().userInfo;
    if (userInfo.isNotEmpty) {
      _userModel = UserModel.init(userInfo);
    }
  }

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  setUserData(UserModel newValue) {
    _userModel = newValue;
  }

  logout() {
    debugPrint("logout");
    SharedPreferencesManager().removeAll();
    BuildContext? context = NavigatorStateHelper.globalKey.currentContext;
    if(context != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(AppRouteName.login, (route) => false);
    }
  }
}