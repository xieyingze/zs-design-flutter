import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';
import '../../../../main.dart';
import 'controller.dart';

class MBTextFieldPage extends GetView<MBTextFieldController> {
  const MBTextFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBTextFieldController());

    return BaseScaffold(
      title: 'SMTextField输入框',
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
        Column(
          children: [
            SMTextField(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 8),
              hintText: '输入品种搜索',
              backgroundColor: ZSColors.card(),
              borderRadius: 4,
              fieldCallBack: (val) => {logger.d('$val')},
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
        CommonSectionHeader(title: '二、定制TextField'),
        // 实现
        Column(
          children: [
            SMTextField(
              clearDisplayMode: SMClearDisplayMode.always,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 8),
              hintText: '输入品种搜索',
              fontSize: fontSize16,
              backgroundColor: ZSColors.card(),
              borderColor: ZSColors.line(),
              prefixIcon: Icon(Ionicons.search_outline, size: 20, color: ZSColors.fontMain()),
              suffixWidget: ZSIcon(
                data: Ionicons.eye_outline,
                size: 24,
              ),
              borderRadius: 4,
              fieldCallBack: (val) => {logger.d('$val')},
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
