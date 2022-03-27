import 'package:get/get.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/manager/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/module/index.dart';

enum RouteName {
  /// 行情
  MBMarketPage,

  MBMarketManagerPage,
}

class RouteConfig {
  /// 别名映射页面
  static final List<GetPage> getMobilePages = [
    /// 行情首页
    GetPage(name: "/${RouteName.MBMarketPage.toString()}", page: () => MBModulePage()),

    /// 行情品种管理
    GetPage(name: "/${RouteName.MBMarketManagerPage.toString()}", page: () => MBMarketManagerPage()),
  ];
}
