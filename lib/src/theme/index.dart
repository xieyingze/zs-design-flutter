import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum SMThemeType {
  /// 浅色主题
  light,

  /// 深色主题
  dark
}

/*
 * 主题管理单例
 */
class ZSThemeManager {
  static final ZSThemeManager _singleton = ZSThemeManager._();
  static ZSThemeManager get instance => _singleton;
  ZSThemeManager._();

  /// 当前主题
  SMThemeType theme = SMThemeType.light;

  /*
   * @description   初始化主题状态栏颜色
   * @param
   * @return
   * @author        jay
   * @time          1/8/22 2:39 PM
   */
  void initSystemUiOverlayStyle() {
    //修改状态栏颜色
    SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
