import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

import 'controller.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class MobileRootPage extends GetView<MBRootController> {
  CupertinoTabController _tabBarController = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBRootController());

    return Obx(
      () => CupertinoTabScaffold(
        controller: _tabBarController,
        tabBar: _buildTabBar(),
        tabBuilder: (BuildContext context, int index) {
          return _buildTabBarWidget(index: index);
        },
      ),
    );
  }

  /*
   * @description   创建tabBar
   * @param
   * @return
   * @author        jay
   * @time          2/24/22 3:44 PM
   */
  CupertinoTabBar _buildTabBar() {
    // controller.root.handleTabBarItemClick(0);
    return CupertinoTabBar(
      activeColor: controller.selectedColor.value,
      inactiveColor: controller.unSelectedColor.value,
      backgroundColor: ZSColors.card(),
      items: _buildTabBarItems(),
      onTap: (index) => {},
    );
  }

  /*
   * @description   创建tabBar item
   * @param
   * @return
   * @author        jay
   * @time          2/24/22 3:44 PM
   */
  List<BottomNavigationBarItem> _buildTabBarItems() {
    return controller.tabBarConfig
        .asMap()
        .keys
        .map(
          (index) => BottomNavigationBarItem(
            icon: _buildTabBarItemIcon(index: index, isActive: false),
            activeIcon: _buildTabBarItemIcon(index: index, isActive: true),
            label: controller.tabBarConfig[index]['text'].toString(),
          ),
        )
        .toList();
  }

  /*
   * @description   创建tabBar item icon
   * @param
   * @return
   * @author        jay
   * @time          2/24/22 3:43 PM
   */
  Widget _buildTabBarItemIcon({required int index, required bool isActive}) {
    switch (index) {
      case 0:
        return isActive
            ? ZSIcon(
                data: Ionicons.hardware_chip_outline,
                size: 20,
                color: isActive ? ZSColors.main() : ZSColors.fontNormal(),
              )
            : ZSIcon(
                data: Ionicons.hardware_chip_outline,
                size: 20,
                color: isActive ? ZSColors.main() : ZSColors.fontNormal(),
              );
      case 1:
        return ZSIcon(
          data: Ionicons.extension_puzzle_outline,
          size: 20,
          color: isActive ? ZSColors.main() : ZSColors.fontNormal(),
        );
      case 2:
        return ZSIcon(
          data: Ionicons.code_slash,
          size: 20,
          color: isActive ? ZSColors.main() : ZSColors.fontNormal(),
        );
      case 3:
        return Icon(Icons.home);
      default:
        return Icon(Icons.home);
    }
  }

  /*
   * @description   创建对应的页面
   * @param
   * @return
   * @author        jay
   * @time          2/24/22 3:44 PM
   */
  Widget _buildTabBarWidget({required int index}) {
    switch (index) {
      case 0:
        return controller.informationPage;
      case 1:
        return controller.marketPage;
      case 2:
        return controller.collegePage;
      case 3:
        return controller.mePage;
      default:
        return controller.informationPage;
    }
  }
}
