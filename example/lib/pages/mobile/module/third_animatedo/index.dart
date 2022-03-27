import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'controller.dart';

// # (测试) (ANDROID IOS LINUX MACOS WEB WINDOWS)
// animate_do: ^2.1.0

class MBAnimationDoPage extends GetView<MBAnimationDoController> {
  const MBAnimationDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBAnimationDoController());

    return BaseScaffold(
      title: 'Animate do',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      backgroundColor: ZSColors.card(),
      child: ListView(
        children: [],
      ),
    );
  }

  Widget _demo1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // FadeInLeft(
          //   duration: Duration(seconds: 2),
          //   child: Container(width: 50, height: 50, color: Colors.blueAccent),
          // ),
          // FadeInUp(
          //   duration: Duration(seconds: 2),
          //   child: Container(width: 50, height: 50, color: Colors.blueAccent),
          // ),
          // FadeInDown(
          //   duration: Duration(seconds: 2),
          //   child: Container(width: 50, height: 50, color: Colors.blueAccent),
          // ),
          // FadeInRight(
          //   duration: Duration(seconds: 2),
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //   ),
          // ),
        ],
      ),
    );
  }
}
