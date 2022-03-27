import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';
import 'controller.dart';

class MBDisplayPage extends GetView<MBDisplayController> {
  const MBDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBDisplayController());

    return BaseScaffold(
      title: 'Layout容器',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildDemo1(),
                _buildDemo2(),
                _buildDemo3(),
                _buildDemo4(),
                _buildDemo5(),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.list
                    .asMap()
                    .keys
                    .map((index) => ZSContainer(
                          width: 80,
                          height: 40,
                          color: ZSColors.background(),
                          alignment: Alignment.center,
                          onTap: () => controller.onJumpToNextPage(index: index),
                          child: ZSLabel(
                            text: controller.list[index],
                            fontSize: fontSize10,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    .toList(),
              ),
              decoration: BoxDecoration(
                color: ZSColors.card(),
                boxShadow: [BoxShadow(color: ZSColors.shadow(), offset: Offset(1, -3), blurRadius: 5)],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDemo1() {
    return Column(
      children: [
        CommonSectionHeader(title: '一、type为column'),
        // 实现
        ZSLayout(
          type: ZSLayoutType.column,
          children: [ZSColors.mainGreen(alpha: 0.5), ZSColors.mainRed(alpha: 0.5), ZSColors.mainBlu(alpha: 0.5)]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 20,
                  color: color,
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
        CommonSectionHeader(title: '二、type为row'),
        // 实现
        ZSLayout(
          type: ZSLayoutType.row,
          children: [ZSColors.mainGreen(alpha: 0.5), ZSColors.mainRed(alpha: 0.5), ZSColors.mainBlu(alpha: 0.5)]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 20,
                  color: color,
                ),
              )
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

  Widget _buildDemo3() {
    return Column(
      children: [
        CommonSectionHeader(title: '三、type为wrap'),
        // 实现
        ZSLayout(
          type: ZSLayoutType.wrap,
          children: [
            ZSColors.mainGreen(alpha: 0.5),
            ZSColors.mainRed(alpha: 0.5),
            ZSColors.mainBlu(alpha: 0.5),
            ZSColors.mainGreen(alpha: 0.5),
            ZSColors.mainRed(alpha: 0.5),
            ZSColors.mainBlu(alpha: 0.5),
            ZSColors.mainGreen(alpha: 0.5),
            ZSColors.mainRed(alpha: 0.5),
            ZSColors.mainBlu(alpha: 0.5),
          ]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 20,
                  color: color,
                ),
              )
              .toList(),
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
        CommonSectionHeader(title: '四、type为stack'),
        // 实现
        ZSLayout(
          type: ZSLayoutType.stack,
          children: [
            ZSColors.mainGreen(alpha: 0.5),
            ZSColors.mainRed(alpha: 0.5),
            ZSColors.mainBlu(alpha: 0.5),
          ]
              .asMap()
              .keys
              .map(
                (index) => Container(
                  margin: EdgeInsets.only(top: (30 * double.parse(index.toString()))),
                  width: 80,
                  height: 40,
                  color: [
                    ZSColors.mainGreen(alpha: 0.5),
                    ZSColors.mainRed(alpha: 0.5),
                    ZSColors.mainBlu(alpha: 0.5),
                  ][index],
                ),
              )
              .toList(),
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

  Widget _buildDemo5() {
    return Column(
      children: [
        CommonSectionHeader(title: '五、type为list'),
        // 实现
        ZSLayout(
          type: ZSLayoutType.list,
          listWidth: double.infinity,
          listHeight: 200,
          children: [
            ZSColors.mainGreen(alpha: 0.5),
            ZSColors.mainRed(alpha: 0.5),
            ZSColors.mainBlu(alpha: 0.5),
            ZSColors.mainGreen(alpha: 0.5),
            ZSColors.mainRed(alpha: 0.5),
            ZSColors.mainBlu(alpha: 0.5),
            ZSColors.mainGreen(alpha: 0.5),
            ZSColors.mainRed(alpha: 0.5),
            ZSColors.mainBlu(alpha: 0.5),
          ]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 30,
                  color: color,
                ),
              )
              .toList(),
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
