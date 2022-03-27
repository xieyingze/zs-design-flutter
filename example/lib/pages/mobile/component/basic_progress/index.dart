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

class MBProgressPage extends GetView<MBProgressController> {
  const MBProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBProgressController());

    return BaseScaffold(
      title: 'Progress进度条',
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
        CommonSectionHeader(
          title: '一、LinearProgress',
        ),
        // 实现
        Column(
          children: [
            ZSLinearProgress(
              alignment: MainAxisAlignment.center,
              percent: 0.6,
              lineHeight: 10,
              backgroundColor: ZSColors.line(),
              progressColor: ZSColors.main(),
              barRadius: Radius.circular(5),
              animation: true,
              widgetIndicator: ZSLabel(
                text: '60%',
                fontSize: 10,
                color: ZSColors.fontMain(),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo1Desc)},
          child: ZSLabel(
            maxLines: 100,
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
        CommonSectionHeader(title: '二、字体大小自动适应(固定宽高)'),
        // 实现
        Column(
          children: [
            ZSCircularProgress(
              radius: 80,
              percent: 0.6,
              animation: true,
              lineWidth: 10,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: ZSColors.line(),
              progressColor: ZSColors.main(),
            ),
          ],
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo2Desc)},
          child: ZSLabel(
            maxLines: 100,
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
