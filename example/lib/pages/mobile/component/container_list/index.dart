import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';
import 'controller.dart';

import 'controller.dart';

class MBListPage extends GetView<MBListController> {
  const MBListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBListController());

    return BaseScaffold(
      title: 'ListView容器',
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
        CommonSectionHeader(title: '一、简单的使用'),
        // 实现
        Container(
          height: 200,
          child: ListView(
            children: List.generate(
                5,
                (index) => Container(
                      margin: EdgeInsets.only(top: 8),
                      height: 40,
                      color: ZSColors.mainBlu(),
                    )),
          ),
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
    return Column(children: [
      CommonSectionHeader(title: '二、无限列表(性能最优)'),
      // 实现
      Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(top: 8),
            height: 40,
            color: ZSColors.mainBlu(),
          ),
          // itemCount: 100,
        ),
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
    ]);
  }
}
