import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/index.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'controller.dart';

// enum ZSButtonType {
//   normal,
//   info,
//   success,
//   danger,
//   warming,
// }

class MBButtonPage extends GetView<MBButtonController> {
  const MBButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBButtonController());

    return BaseScaffold(
      title: 'ZSButton',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: ListView(
        children: [
          _buildDemo1(),
          _buildDemo2(),
          _buildDemo3(),
          _buildDemo4(),
          _buildDemo5(),
        ],
      ),
    );
  }

  Widget _buildDemo1() {
    return Column(
      children: [
        CommonSectionHeader(title: '一、按钮类型'),
        // 实现
        Wrap(
          children: [ZSButtonType.normal, ZSButtonType.info, ZSButtonType.success, ZSButtonType.danger, ZSButtonType.warming]
              .map(
                (type) => ZSButton(
                  type: type,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  size: Size(120, 50),
                  title: '确定',
                  onTap: () => {},
                ),
              )
              .toList(),
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
        CommonSectionHeader(title: '二、自定义颜色按钮'),
        // 实现
        ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(200, 50),
          title: '确定',
          textColor: ZSColors.mainGreen(),
          normalColor: ZSColors.card(),
          borderColor: ZSColors.mainGreen(),
          highColor: ZSColors.background(),
          onTap: () => {},
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

  Widget _buildDemo3() {
    return Column(
      children: [
        CommonSectionHeader(title: '三、禁用状态'),
        // 实现
        ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          type: ZSButtonType.info,
          enable: false,
          size: Size(200, 50),
          title: '禁用状态',
          highColor: Colors.blue,
          onTap: () => {},
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo3Desc)},
          child: ZSLabel(
            maxLines: 100,
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
        CommonSectionHeader(title: '四、加载中'),
        // 实现
        Obx(() => ZSButton(
              margin: EdgeInsets.symmetric(vertical: 16),
              type: ZSButtonType.info,
              size: Size(200, 50),
              title: '点击加载',
              loadingText: '加载中..',
              loading: controller.isLoading.value,
              highColor: Colors.blue,
              onTap: () => controller.onClickButton(),
            )),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo4Desc)},
          child: ZSLabel(
            maxLines: 100,
            text: controller.demo4Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        )
      ],
    );
  }

  Widget _buildDemo5() {
    return Column(
      children: [
        CommonSectionHeader(title: '五、文字+Icon按钮'),
        // 实现
        ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(200, 50),
          title: '确定',
          iconData: Ionicons.logo_twitter,
          highColor: Colors.blue,
          onTap: () => {},
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo5Desc)},
          child: ZSLabel(
            maxLines: 100,
            text: controller.demo5Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        )
      ],
    );
  }
}
