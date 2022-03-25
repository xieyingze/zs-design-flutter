import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ZSScreen {
  static final ZSScreen _singleton = ZSScreen._();
  static ZSScreen get instance => _singleton;
  ZSScreen._();

  double screenWidth = 0.0;

  /// 导航状态栏高度 (final 运行时常量)
  static final double navBarStatus = MediaQueryData.fromWindow(window).padding.top;

  /// 导航内容高度
  static const double navBarContent = 44;

  /// 导航栏高度
  static final double navBarHeight = MediaQueryData.fromWindow(window).padding.top + 44;

  /// 屏幕宽度
  static final double width = MediaQueryData.fromWindow(window).size.width;

  /// 屏幕高度
  static final double height = MediaQueryData.fromWindow(window).size.height;

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static final double contentsHeight = MediaQueryData.fromWindow(window).size.height - MediaQueryData.fromWindow(window).padding.top - 44;

  /// 底部补偿
  static final double bottomFix = MediaQueryData.fromWindow(window).padding.bottom;

  /*
   * @description   根据上下文获取宽度
   * @param
   * @return
   * @author        jay
   * @time          3/3/22 11:46 AM
   */
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /*
   * @description:    等比例宽度
   * @param:
   * @return:
   * @author:         jay xie
   * @time:           11/14/21 12:56 AM
   */
  static double scalePixel(double value) {
    return value * MediaQueryData.fromWindow(window).size.width / 375;
  }
}
