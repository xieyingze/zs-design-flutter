import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'controller.dart';

// # 瀑布流之类(测试) (ANDROID IOS LINUX MACOS WEB WINDOWS)
// flutter_staggered_grid_view: ^0.6.1

class MBKeyBoardPage extends GetView<MBKeyBoardController> {
  const MBKeyBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBKeyBoardController());

    controller.reqData();

    return BaseScaffold(
      title: '键盘相关处理',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: Container(),
    );
  }
}
