import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter_example/common/index.dart';

class MBMarketManagerController extends BaseController with SingleGetTickerProviderMixin {
  var segmentIndex = 0.obs;

  /// 品种管理的tabBar角标
  var symbolTabBarIndex = 0.obs;

  /// 品种管理的tabBar角标
  List<String> symbolTabBars = ['全部', '持仓产品', '重点美股'];

  /// 品种管理列表的tabBarController
  late TabController symbolTabController = TabController(length: 3, vsync: this);

  void onHandleSwitchSegment({required int index}) {
    segmentIndex.value = index;
  }
}
