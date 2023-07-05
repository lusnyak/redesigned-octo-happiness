import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app_flutter/constants/app_strings.dart';
import 'package:test_app_flutter/constants/svg_image_data.dart';
import 'package:test_app_flutter/core/models/common/menu_item/menu_item.dart';
import 'package:test_app_flutter/presentation/profile/profile_page.dart';
import 'package:test_app_flutter/constants/app_colors.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  CupertinoTabController controller = CupertinoTabController(initialIndex: 3);
  List<Widget> get _pages =>
      <Widget>[Container(), Container(), Container(), const ProfilePage()];

  List<MenuItem> get _menuItems => <MenuItem>[
        MenuItem(title: AppString.timeline, icon: SVGImageData.timeline),
        MenuItem(title: AppString.map, icon: SVGImageData.map),
        MenuItem(title: AppString.favorite, icon: SVGImageData.favorite),
        MenuItem(title: AppString.profile, icon: SVGImageData.profile),
      ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      controller: controller,
      tabBar: CupertinoTabBar(
        activeColor: AppColor.violetColor,
        inactiveColor: AppColor.blackColor,
        iconSize: 18.0,
        items: [
          for (var item in _menuItems)
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.icon,
                width: 18.0,
                height: 18.0,
              ),
              activeIcon: SvgPicture.asset(
                item.icon,
                color: AppColor.violetColor,
              ),
              label: item.title,
            ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return _pages[index];
          },
        );
      },
    );
  }
}
