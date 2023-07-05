import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/constants/app_colors.dart';
import 'package:test_app_flutter/constants/app_strings.dart';
import 'package:test_app_flutter/constants/svg_image_data.dart';
import 'package:test_app_flutter/constants/text_styles.dart';
import 'package:test_app_flutter/presentation/profile/provider/profile_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          AppString.profile,
          style: appBarTextStyle,
        ),
        border: null,
      ),
      child: SafeArea(
        child: Consumer<ProfileProvider>(builder: (context, provider, _) {
          return SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0).copyWith(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 64,
                  child: SvgPicture.asset(SVGImageData.user),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    provider.userModel?.nickname ?? "",
                    textAlign: TextAlign.center,
                    style: textStyleSemiBold24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    provider.userModel?.email ?? "",
                    textAlign: TextAlign.center,
                    style: textStyleNormal16.copyWith(
                        color: AppColor.textGrayColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton(
                    onPressed: provider.logout,
                    color: AppColor.whiteColor,
                    alignment: Alignment.centerLeft,
                    borderRadius: BorderRadius.zero,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 30.0,
                    ),
                    child: Text(
                      AppString.logout,
                      style:
                          textStyleNormal16.copyWith(color: AppColor.redColor),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
