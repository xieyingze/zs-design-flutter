import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/pages/desktop/header/index.dart';
import 'package:zs_design_flutter_example/pages/desktop/home/index.dart';

import 'components/menu.dart';
import 'controller.dart';

class DeskTopRootPage extends GetView<DTRootPageController> {
  final List<Widget> _widgets = [DTHomePage(), DeskTopNetworkHeaderPage()];
  final List<Map<String, dynamic>> tabBarDatas = [
    {'label': 'Api', 'icon': Icons.network_wifi},
    {'label': '设置', 'icon': Ionicons.settings},
  ];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DTRootPageController());

    return BaseScaffold(
      child: Row(
        children: [
          Obx(
            () => DTRootMenu(
              menuIndex: controller.tabBarIndex.value,
              callBack: (index) => controller.tabBarIndex.value = index,
            ),
          ),
          Container(
            width: ZSScreen.getWidth(context) - 60,
            child: Obx(
              () => Stack(
                children: _widgets
                    .asMap()
                    .keys
                    .map(
                      (index) => Offstage(
                        offstage: controller.tabBarIndex.value == index ? false : true,
                        child: _widgets[index],
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _getTabBarWidget({required int index}) {
  //   return _widgets[index];
  // }
}
