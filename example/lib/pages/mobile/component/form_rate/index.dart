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

class MBRatePage extends GetView<MBRateController> {
  const MBRatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBRateController());

    return BaseScaffold(
      title: 'ZSRate评分',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: ListView(
        children: [
          _buildDemo1(),
          _buildDemo2(),
          _buildDemo3(),
        ],
      ),
    );
  }

  Widget _buildDemo1() {
    return Column(
      children: [
        CommonSectionHeader(title: '一、评分只读'),
        // 实现
        ZSRate(
          margin: EdgeInsets.symmetric(vertical: 16),
          allowHalfRating: true,
          starCount: 5,
          rating: 3,
          size: 24,
          spacing: 10,
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
        CommonSectionHeader(title: '二、评分可交互'),
        // 实现
        ZSRate(
          margin: EdgeInsets.symmetric(vertical: 16),
          allowHalfRating: true,
          starCount: 5,
          rating: 3,
          size: 24,
          isReadOnly: false,
          onRated: (rate) {
            logger.d('--------$rate');
          },
          spacing: 10,
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
        CommonSectionHeader(title: '三、自定义'),
        // 实现
        ZSRate(
          margin: EdgeInsets.symmetric(vertical: 16),
          allowHalfRating: true,
          starCount: 5,
          rating: 3,
          size: 24,
          isReadOnly: false,
          filledIcon: Icon(Ionicons.heart, color: ZSColors.mainRed()),
          nonFilledIcon: Icon(Ionicons.map, color: ZSColors.line()),
          onRated: (rate) {},
          spacing: 10,
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
}
