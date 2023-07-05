import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/constants/app_colors.dart';
import 'package:test_app_flutter/constants/app_strings.dart';
import 'package:test_app_flutter/constants/text_styles.dart';
import 'package:test_app_flutter/core/routes/routes_name.dart';
import 'package:test_app_flutter/presentation/login/login_provider.dart';
import 'package:test_app_flutter/presentation/profile/provider/profile_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          AppString.authorization,
          style: appBarTextStyle,
        ),
        border: null,
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildForm(context),
                _buildButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildForm(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return Container(
      color: AppColor.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoTextField.borderless(
            placeholderStyle: inputHintTextStyle,
            style: inputTextStyle,
            placeholder: AppString.loginOrEmail,
            padding: const EdgeInsets.symmetric(vertical: 12),
            controller: provider.loginController,
          ),
          const Divider(),
          CupertinoTextField.borderless(
            placeholderStyle: inputHintTextStyle,
            style: inputTextStyle,
            placeholder: AppString.password,
            obscureText: true,
            padding: const EdgeInsets.symmetric(vertical: 12),
            controller: provider.passwordController,
          ),
        ],
      ),
    );
  }

  _buildButtons(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              onPressed: () {
                _handleLogin(context);
              },
              color: AppColor.violetColor,
              borderRadius: BorderRadius.circular(6.0),
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Text(
                AppString.login,
                style: elevatedButtonTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {},
              color: AppColor.violetColor,
              borderRadius: BorderRadius.circular(6.0),
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Text(
                AppString.register,
                style: elevatedButtonTextStyle,
              ),
            ),
          ],
        ),
      );

  _handleLogin(BuildContext context) {
    final provider = context.read<LoginProvider>();
    provider.login((p0) {
      context.read<ProfileProvider>().setUserData(p0.user);
      _navigateMainTabPage(context);
    }, (p0) {
      _showErrorAlert(context, p0);
    });
  }

  _navigateMainTabPage(BuildContext context) async {
    await Navigator.of(context).pushReplacementNamed(AppRouteName.mainTab);
  }

  _showErrorAlert(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(message),
          actions: [
            CupertinoButton(
              child: const Text(
                "OK",
                textAlign: TextAlign.center,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
