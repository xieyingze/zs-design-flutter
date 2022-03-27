import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';
import 'controller.dart';

class MBColumnPage extends GetView<MBColumnController> {
  const MBColumnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBColumnController());

    return BaseScaffold(
      title: 'Column容器',
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
    List<MainAxisAlignment> list = [
      MainAxisAlignment.start,
      MainAxisAlignment.center,
      MainAxisAlignment.end,
      MainAxisAlignment.spaceBetween,
      MainAxisAlignment.spaceAround,
      MainAxisAlignment.spaceEvenly,
    ];
    return Column(
      children: [
        CommonSectionHeader(title: '一、MainAxisAlignment'),
        // 实现
        Column(
          children: list
              .map(
                (element) => Container(
                  margin: EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  height: 120,
                  color: ZSColors.card(),
                  child: Column(
                    mainAxisAlignment: element,
                    children: List.generate(
                        3,
                        (index) => Container(
                              margin: EdgeInsets.only(top: 1),
                              width: 80,
                              height: 20,
                              color: ZSColors.mainBlu(),
                            )),
                  ),
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
    List<CrossAxisAlignment> list = [
      CrossAxisAlignment.start,
      CrossAxisAlignment.center,
      CrossAxisAlignment.end,
      CrossAxisAlignment.stretch,
    ];
    return Column(
      children: [
        CommonSectionHeader(title: '二、CrossAxisAlignment'),
        // 实现
        Column(
          children: list
              .map((element) => Container(
                    margin: EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    height: 120,
                    color: ZSColors.card(),
                    child: Column(
                      // mainAxisAlignment: element,
                      crossAxisAlignment: element,
                      children: List.generate(
                          3,
                          (index) => Container(
                                margin: EdgeInsets.only(top: 1),
                                width: 80,
                                height: 20,
                                color: ZSColors.mainBlu(),
                              )),
                    ),
                  ))
              .toList(),
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
