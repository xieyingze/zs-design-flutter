import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:worker_manager/worker_manager.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/manager/http/index.dart';
import 'package:zs_design_flutter_example/library/debug/plugin/index.dart';
import 'package:zs_design_flutter_example/library/debug/plugin/interceptor/index.dart';
import 'package:zs_design_flutter_example/models/common/api.dart';

import '../../main.dart';

// import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
// import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
// import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
// import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
// import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
// import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
// import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart'; // Dio 网络请求调试工具

export 'api.dart';

// 手机屏幕定义宽度 (在这个区间就使用手机显示模式)
const double MOBILE_DEFINE_WIDTH = 600;
// 移动端设计稿宽度
const double MOBILE_DESIGN_WIDTH = 540;
// 平板屏幕宽度
const double TABLE_DEFINE_WIDTH = 1800;
// 桌面屏幕宽度
const double DESKTOP_DEFINE_WIDTH = 2800;

/////////////////////////// App 配置文件 ///////////////////////////

class Config {
  static final Config _singleton = Config._();
  static Config get instance => _singleton;
  Config._();

  /// 当前是否是debug模式
  static bool isDebug = Foundation.kDebugMode;

  /// 所有公共api
  late CommonApiModel commonApi;

  /*
   * @description   初始化api
   * @param
   * @return
   * @author        jay
   * @time          3/25/22 10:55 AM
   */
  void initApi(CommonApiModel common) {
    this.commonApi = common;
  }

  /*
   * @description   初始化App
   * @param
   * @return
   * @author        jay
   * @time          3/25/22 10:35 AM
   */
  void initMyApp({required Widget app}) async {
    // 设置错误页面
    setCustomErrorPage();

    await Executor().warmUp(log: true);

    SMPluginManager.instance
      ..register(
        CustomPlugin(dio: HttpManager.instance.dio),
      );

    runApp(app);

    // PluginManager.instance // 注册插件
    //   ..register(WidgetInfoInspector())
    //   ..register(WidgetDetailInspector())
    //   ..register(ColorSucker())
    //   ..register(AlignRuler())
    //   ..register(ColorPicker()) // 新插件
    //   ..register(TouchIndicator()) // 新插件
    //   ..register(Performance())
    //   ..register(ShowCode())
    //   ..register(MemoryInfoPage())
    //   ..register(CpuInfoPage())
    //   ..register(DeviceInfoPanel())
    //   ..register(Console())
    //   ..register(DioInspector(dio: HttpManager.instance.dio)); // 传入你的 Dio 实例
    // // flutter_ume 0.3.0 版本之后
    // runApp(UMEWidget(child: app, enable: true));
  }

  /*
 * @description   自定义错误页面
 * @param
 * @return
 * @author        jay
 * @time          11/22/21 10:31 AM
 */
  void setCustomErrorPage() {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      logger.e('${flutterErrorDetails.toString()}');
      return Center(
        child: ZSLabel(
          text: '${flutterErrorDetails.toString()}',
          color: ZSColors.fontTips(),
          fontSize: fontSize14,
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      );
    };
  }
}
