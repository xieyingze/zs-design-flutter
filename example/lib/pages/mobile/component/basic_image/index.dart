import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'controller.dart';

class MBImagePage extends GetView<MBImageController> {
  const MBImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBImageController());

    return BaseScaffold(
      title: 'ZSImage',
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
        CommonSectionHeader(title: '一、高斯模糊过渡效果'),
        // 实现
        ZSImage(
          margin: EdgeInsets.symmetric(vertical: 16),
          url: controller.imageUrl1,
          size: Size(120, 80),
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
        CommonSectionHeader(title: '二、默认文字过渡效果'),
        // 实现
        ZSImage(
          margin: EdgeInsets.symmetric(vertical: 16),
          placeholder: ZSImagePlaceholder.avatar,
          avatarText: 'HA',
          url: controller.imageUrl2,
          size: Size(80, 80),
          borderColor: ZSColors.card(),
          borderWidth: 10,
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
        CommonSectionHeader(title: '三、loading过渡效果'),
        // 实现
        ZSImage(
          margin: EdgeInsets.symmetric(vertical: 16),
          placeholder: ZSImagePlaceholder.indicator,
          url: controller.imageUrl3,
          size: Size(120, 80),
          backgroundColor: ZSColors.mainYellow(),
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
        CommonSectionHeader(title: '四、圆角+阴影'),
        // 实现
        ZSImage(
          borderRadius: 40,
          margin: EdgeInsets.symmetric(vertical: 16),
          placeholder: ZSImagePlaceholder.avatar,
          avatarText: 'JX',
          url: controller.imageUrl2,
          size: Size(80, 80),
          showShadow: true,
        ),
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
}
