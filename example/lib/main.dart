import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:zs_design_flutter_example/common/manager/theme/index.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/manager/theme/index.dart';

import 'common/config/index.dart';
import 'common/manager/http/index.dart';
import 'common/manager/route/config.dart';
import 'library/debug/index.dart';
import 'pages/desktop/root/index.dart';
import 'pages/mobile/root/index.dart';

/////////////////////////// 程序主入口 ///////////////////////////

void main() {
  Config.instance.initMyApp(app: MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

/////////////////////////// MyApp ///////////////////////////

class _MyAppState extends State<MyApp> {
  /// 移动端根页面
  final _mobileRootPage = MobileRootPage();

  /// 桌面端根页面
  final _desktopRootPage = DeskTopRootPage();

  /// 初始化数据future
  var _initFuture;

  /// 是否显示性能面板
  bool _showPerformance = false;

  @override
  void initState() {
    /// http初始化
    HttpManager.instance.initialHttpManager();

    /// 主题初始化
    ThemeManager.instance.initSystemUiOverlayStyle();

    /// 初始化数据
    _initFuture = _getConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => _buildApp(context, widget),
    );
  }

  /*
   * @description   生成app内容
   * @param
   * @return
   * @author        jay
   * @time          2/17/22 2:38 PM
   */
  _buildApp(BuildContext context, Widget? widget) {
    return FutureBuilder<void>(
      future: _initFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return ResponsiveWrapper.builder(
              _getDefaultWidget(context),
              maxWidth: TABLE_DEFINE_WIDTH,
              minWidth: MOBILE_DEFINE_WIDTH,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(MOBILE_DESIGN_WIDTH, name: MOBILE),
                const ResponsiveBreakpoint.resize(TABLE_DEFINE_WIDTH, name: TABLET),
              ],
              background: Container(color: ZSColors.card()),
            );
          default:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        }
      },
    );
  }

  /*
   * @description   获取系统配置
   * @param
   * @return
   * @author        jay
   * @time          2/24/22 11:25 AM
   */
  _getConfig() async {
    //  读取一些配置项
    return true;
  }

  /*
   * @description:    动态适配Widget
   * @param:
   * @return:
   * @author:         jay xie
   * @time:           11/26/21 7:06 AM
   */
  Widget _getDefaultWidget(BuildContext context) {
    double screenWidth = ZSScreen.getWidth(context);
    ZSScreen.instance.screenWidth = screenWidth;
    return GetMaterialApp(
      showPerformanceOverlay: _showPerformance,
      // checkerboardRasterCacheImages: _showPerformanceOverlay,
      // checkerboardOffscreenLayers: _showPerformanceOverlay,
      home: screenWidth <= MOBILE_DEFINE_WIDTH
          ? SMDebugTools(
              child: _mobileRootPage,
              onShowPerformanceCallBack: (show) => _onHandleShowPerformance(show: show),
            )
          : SMDebugTools(child: _desktopRootPage),
      getPages: RouteConfig.getMobilePages,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      builder: EasyLoading.init(),
    );
  }

  /*
   * @description   处理显示性能模式
   * @param
   * @return
   * @author        jay
   * @time          3/25/22 10:26 AM
   */
  void _onHandleShowPerformance({bool? show}) {
    setState(() {
      _showPerformance = show ?? false;
    });
  }
}

/*
 * @description   日志输入
 * @param
 * @return
 * @author        jay
 * @time          2/17/22 2:31 PM
 */
var logger = Logger(
  printer: LogfmtPrinter(),
  // printer: PrettyPrinter(),
);
