import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'controller.dart';

class MBContainerPage extends GetView<MBContainerController> {
  const MBContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBContainerController());

    return BaseScaffold(
      title: 'Container容器',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: ListView(
        children: [
          _buildDemo1(),
          _buildDemo2(),
          _buildDemo3(),
          _buildDemo4(),
        ],
      ),
    );
  }

  Widget _buildDemo1() {
    return Column(
      children: [
        CommonSectionHeader(title: '一、Padding && Margin'),
        // 实现
        ZSContainer(
          margin: EdgeInsets.all(32),
          padding: EdgeInsets.all(32),
          onTap: () => {Alert.alertTip('点击BaseContainer')},
          child: Container(
            width: 80,
            height: 80,
            color: ZSColors.mainRed(),
          ),
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {
            Alert.alertTip('已复制代码'),
            ClipBoardUtils.copyText(text: controller.demo1Desc)
          },
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
        CommonSectionHeader(title: '二、Border && BorderRadius'),
        // 实现
        ZSContainer(
          margin: EdgeInsets.all(16),
          width: 120,
          height: 120,
          onTap: () => {Alert.alertTip('点击BaseContainer')},
          child: Icon(
            Ionicons.balloon_outline,
            size: 60,
          ),
          decoration: BoxDecoration(
            color: ZSColors.card(),
            border: Border.all(color: ZSColors.line(), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {
            Alert.alertTip('已复制代码'),
            ClipBoardUtils.copyText(text: controller.demo2Desc)
          },
          child: ZSLabel(
            maxLines: 30,
            text: controller.demo2Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        ),
      ],
    );
  }

  Widget _buildDemo3() {
    return Column(
      children: [
        CommonSectionHeader(title: '二、BoxShadow'),
        // 实现
        ZSContainer(
          margin: EdgeInsets.all(16),
          width: 120,
          height: 120,
          onTap: () => {Alert.alertTip('点击BaseContainer')},
          child: Icon(
            Ionicons.balloon_outline,
            size: 60,
          ),
          decoration: BoxDecoration(
            color: ZSColors.card(),
            boxShadow: [
              BoxShadow(
                  color: ZSColors.shadow(),
                  blurRadius: 5,
                  offset: Offset(0, 2)),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          onHoverDecoration: BoxDecoration(
            color: ZSColors.card(),
            boxShadow: [
              BoxShadow(
                  color: ZSColors.darkShadow(),
                  blurRadius: 10,
                  offset: Offset(1, 5))
            ],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {
            Alert.alertTip('已复制代码'),
            ClipBoardUtils.copyText(text: controller.demo3Desc)
          },
          child: ZSLabel(
            maxLines: 30,
            text: controller.demo3Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        )
      ],
    );
  }

  Widget _buildDemo4() {
    return Column(
      children: [
        CommonSectionHeader(title: '三、Gradient'),
        // 实现
        ZSContainer(
          margin: EdgeInsets.all(16),
          width: 120,
          height: 120,
          onTap: () => {Alert.alertTip('点击BaseContainer')},
          child: Icon(
            Ionicons.balloon_outline,
            size: 60,
            color: ZSColors.white(),
          ),
          decoration: BoxDecoration(
            color: ZSColors.card(),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [ZSColors.mainRed(), ZSColors.mainYellow()]),
            borderRadius: BorderRadius.circular(8),
          ),
          onHoverDecoration: BoxDecoration(
            color: ZSColors.card(),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [ZSColors.mainRed(), ZSColors.mainYellow()]),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {
            Alert.alertTip('已复制代码'),
            ClipBoardUtils.copyText(text: controller.demo4Desc)
          },
          child: ZSLabel(
            maxLines: 30,
            text: controller.demo4Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        )
      ],
    );
  }
}
