import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';
import 'controller.dart';

class MBLabelPage extends GetView<MBLabelController> {
  const MBLabelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBLabelController());

    return BaseScaffold(
      title: 'ZSLabel容器',
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
        CommonSectionHeader(title: '一、自动换行'),
        // 实现
        Column(
          children: [
            ZSLabel(
              padding: EdgeInsets.all(16),
              maxLines: 2,
              text: '以下展示的为公共组件及业务组件。组件的样式仅供参考，开发者可根据自身的需求来自定义自定义组件的样式。',
              color: ZSColors.main(),
              fontSize: fontSize16,
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
            ZSLabel(
              width: 300,
              height: 40,
              softWrap: false,
              text: '以下展示的为公共组件及业务组件。组件的样式仅供参考，开发者可根据自身的需求来自定义自定义组件的样式。',
              color: ZSColors.main(),
              fontSize: fontSize16,
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
