import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';
import 'controller.dart';

class MBStackPage extends GetView<MBStackController> {
  const MBStackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBStackController());

    return BaseScaffold(
      title: 'Stack容器',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: ListView(
        children: [
          _buildDemo1(),
          _buildDemo2(),
        ],
      ),
    );
  }

  Widget _buildDemo1() {
    return Column(
      children: [
        CommonSectionHeader(title: '一、基本使用'),
        // 实现
        Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ZSColors.mainGreen(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ZSColors.mainRed(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 40),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ZSColors.mainBlu(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            )
          ],
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo1Desc)},
          child: ZSLabel(
            maxLines: 30,
            text: controller.demo1Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        )
      ],
    );
  }

  Widget _buildDemo2() {
    return Column(
      children: [
        CommonSectionHeader(title: '二、搭配Align定位'),
        // 实现
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ZSColors.mainGreen(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: ZSColors.mainRed(alpha: 0.5),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 40),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ZSColors.mainBlu(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            )
          ],
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo2Desc)},
          child: ZSLabel(
            maxLines: 30,
            text: controller.demo2Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        )
      ],
    );
  }
}
