import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_app_flutter/constants/app_strings.dart';
import 'package:test_app_flutter/core/api_base/api_response.dart';
import 'package:test_app_flutter/core/models/login/login/logged_model.dart';
import 'package:test_app_flutter/core/repository_services/login/login_service_impl.dart';
import 'package:test_app_flutter/core/utils/validations.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController _loginController = TextEditingController();

  TextEditingController get loginController => _loginController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  _reset(){
    _loginController.clear();
    _passwordController.clear();
  }

  Future<void> login(
      Function(LoggedModel) success, Function(String) fail) async {
    debugPrint(_loginController.text);
    debugPrint(_passwordController.text);

    if (!isEmailValidate(_loginController.text)) {
      fail(AppString.emailMustBeValid);
      return;
    }

    if (!isPasswordValidate(_passwordController.text)) {
      fail(AppString.passwordLengthMustBeLeast8Char);
      return;
    }

    await EasyLoading.show();
    await LoginServiceImpl()
        .login(_loginController.text, _passwordController.text)
        .then((value) async {
      await EasyLoading.dismiss();
      _reset();
      success(value);
    }).catchError((e) async {
      await EasyLoading.dismiss();
      ApiError error = e;
      fail(error.message?.replaceAll("\"", "") ?? "");
    });
  }
}
