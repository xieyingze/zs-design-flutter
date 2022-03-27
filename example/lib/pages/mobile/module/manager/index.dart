import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'components/sectionlist.dart';
import 'components/segment.dart';
import 'components/symbollist.dart';
import 'controller.dart';

class MBMarketManagerPage extends GetView<MBMarketManagerController> {
  const MBMarketManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBMarketManagerController());

    return BaseScaffold(
      title: '品种管理',
      leftWidget: CommonNavBarButton(
        callBack: () => Get.back(),
      ),
      backgroundColor: ZSColors.card(),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            // 品种管理 || 分组管理
            Obx(() => MBMarketManagerSegment(
                  index: controller.segmentIndex.value,
                  callBack: (index) => controller.onHandleSwitchSegment(index: index),
                )),
            Expanded(
              child: Stack(
                children: [
                  Obx(
                    () => Offstage(
                      offstage: controller.segmentIndex.value == 0 ? false : true,
                      // 品种管理列表
                      child: MBMarketManagerSymbolList(
                        titles: controller.symbolTabBars,
                        tabController: controller.symbolTabController,
                      ),
                    ),
                  ),
                  Obx(
                    () => Offstage(
                      offstage: controller.segmentIndex.value == 1 ? false : true,
                      // 分组管理列表
                      child: MBMarketManagerSectionList(
                          // titles: controller.symbolTabBars,
                          // tabController: controller.symbolTabController,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
