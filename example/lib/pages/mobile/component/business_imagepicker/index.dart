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

class MBImagePickerPage extends GetView<MBImagePickerController> {
  const MBImagePickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBImagePickerController());

    return BaseScaffold(
      title: '图片选择',
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
        CommonSectionHeader(
          title: '一、选择单张图片',
        ),
        // 实现
        Column(
          children: [
            Obx(() => ZSImage(
                  url: controller.imagePath.value,
                  size: Size(120, 80),
                  backgroundColor: ZSColors.line(),
                  onTap: () => controller.onJumpToImageViewer(),
                )),
            ZSButton(
              margin: EdgeInsets.symmetric(vertical: 16),
              size: Size(120, 40),
              title: '选择图片',
              onTap: () => controller.onSelectSingleImage(),
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
        CommonSectionHeader(title: '二、选择多张图片'),
        // 实现
        Column(
          children: [
            Obx(() => Wrap(
                  children: controller.images
                      .map((element) => ZSImage(
                            margin: EdgeInsets.only(right: 8, top: 8),
                            size: Size(120, 80),
                            url: element,
                            backgroundColor: ZSColors.line(),
                          ))
                      .toList(),
                )),
            ZSButton(
              margin: EdgeInsets.symmetric(vertical: 16),
              size: Size(120, 40),
              title: '选择图片',
              onTap: () => controller.onSelectMultiImage(),
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

  Widget _buildDemo3() {
    return Column(
      children: [
        CommonSectionHeader(title: '二、选择视频'),
        // 实现
        Column(
          children: [
            ZSButton(
              margin: EdgeInsets.symmetric(vertical: 16),
              size: Size(120, 40),
              title: '选择图片',
              onTap: () => controller.onSelectMultiImage(),
            ),
          ],
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
