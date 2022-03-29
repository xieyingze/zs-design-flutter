import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/section/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/clipboard.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';
import 'controller.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBPickerPage extends GetView<MBPickerController> {
  const MBPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBPickerController());

    return BaseScaffold(
      title: 'Picker',
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
        CommonSectionHeader(title: '一、显示单行'),
        // 实现
        ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(120, 44),
          title: 'SHOW',
          highColor: Colors.blue,
          onTap: () => _showPicker(),
        ),
      ],
    );
  }

  /*
   * @description   显示选择picker
   * @param
   * @return        void
   * @author        jay
   * @date:         2022/3/29 12:59 AM
  */
  void _showPicker() {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    ZSPicker picker = ZSPicker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(controller.pickerData)),
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: TextStyle(color: Colors.blue,),
        selectedTextStyle: TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (ZSPicker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.show(Get.context!);
  }


  Widget _buildDemo2() {
    return Column(
      children: [
        CommonSectionHeader(title: '二、提示成功'),
        // 实现
        ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(120, 44),
          title: 'SHOW',
          highColor: Colors.blue,
          onTap: () => _showPicker2(),
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => _showPicker2(),
          child: ZSLabel(
            maxLines: 30,
            text: controller.demo2Desc,
            color: ZSColors.fontMain(),
            fontSize: fontSize10,
          ),
          color: ZSColors.card(),
        )
      ],
    );
  }

  /*
   * @description   显示选择picker
   * @param
   * @return        void
   * @author        jay
   * @date:         2022/3/29 12:59 AM
  */
  void _showPicker2() {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    ZSPicker pi = ZSPicker(adapter: PickerDataAdapter<String>(
        pickerdata: JsonDecoder().convert(controller.pickerData)),
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: TextStyle(color: ZSColors.fontMain(),),
        selectedTextStyle: TextStyle(color: ZSColors.fontMain()),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (ZSPicker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    ZSPicker picker = ZSPicker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(controller.pickerData)),
        changeToFirst: false,
        textStyle: TextStyle(color: ZSColors.fontMain(),),
        selectedTextStyle: TextStyle(color: ZSColors.fontMain(), fontWeight: FontWeight.bold, fontSize: fontSize18,),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (ZSPicker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.showModal(Get.context!);
    // picker.show(Get.context!);
  }

  Widget _buildDemo3() {
    return Column(
      children: [
        CommonSectionHeader(title: '三、提示错误'),
        // 实现
        ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(120, 44),
          title: 'SHOW',
          highColor: Colors.blue,
          onTap: () => {ZSToast.showError(message: '加载失败')},
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo3Desc)},
          child: ZSLabel(
            maxLines: 30,
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
        CommonSectionHeader(title: '四、提示警告'),
        // 实现
        ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(120, 44),
          title: 'SHOW',
          highColor: Colors.blue,
          onTap: () => {
            {ZSToast.showWarming(message: '加载失败')},
          },
        ),
        // 代码
        ZSContainer(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          onTap: () => {Alert.alertTip('已复制代码'), ClipBoardUtils.copyText(text: controller.demo4Desc)},
          child: ZSLabel(
            maxLines: 30,
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
