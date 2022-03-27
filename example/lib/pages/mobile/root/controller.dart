import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/component/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/kraken/kraken/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/me/me/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/module/index.dart';

class MBRootController extends GetxController {
  List<Map<String, dynamic>> tabBarConfig = [
    {'text': '组件'},
    {'text': '模板'},
    {'text': 'Kraken'},
    {'text': '我的'}
  ];

  MBComponentPage informationPage = MBComponentPage();

  MBModulePage marketPage = MBModulePage();

  MBKrakenPage collegePage = MBKrakenPage();

  MBMePage mePage = MBMePage();

  /// tabBar item选中的颜色
  var selectedColor = ZSColors.main().obs;

  /// tabBar item选中的颜色
  var unSelectedColor = ZSColors.fontNormal().obs;

  /*
   * @description   测试PriceCloudClientSDK
   * @param
   * @return
   * @author        jay
   * @time          1/24/22 9:52 AM
   */
  void initPriceCloudClientSDK() async {}
}
