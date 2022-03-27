import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/index.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'controller.dart';

class MBIconPage extends GetView<MBIconController> {
  const MBIconPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBIconController());

    controller.initData();

    return BaseScaffold(
      titleWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZSLabel(
            text: 'Icon图标',
            color: ZSColors.fontMain(),
            fontSize: fontSize18,
            fontWeight: FontWeight.w600,
          ),
          ZSLabel(
            text: '点击可以复制实现代码',
            color: ZSColors.fontNormal(),
            fontSize: fontSize10,
          )
        ],
      ),
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) => Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.titles[index]
                .asMap()
                .keys
                .map(
                  (i) => ZSContainer(
                    onTap: () => controller.onHandleCopy(text: controller.titles[index][i]),
                    width: ZSScreen.getWidth(context) / 4,
                    child: ZSIcon(
                      data: controller.icons[index][i],
                      size: 36,
                      color: ZSColors.fontMain(),
                      text: controller.titles[index][i],
                      fontSize: 10,
                    ),
                    decoration: BoxDecoration(border: Border.all(color: ZSColors.line(), width: 0.3)),
                  ),
                )
                .toList(),
          ),
        ),
        itemCount: controller.titles.length,
      ),
    );
  }
}
