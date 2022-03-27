import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ThemeType {
  /*
   * 浅色主题
   */
  light,

  /*
   * 深色主题
   */
  dark
}

/*
 * 主题管理单例
 */
class ThemeManager {
  static final ThemeManager _singleton = ThemeManager._();
  static ThemeManager get instance => _singleton;
  ThemeManager._();

  /*
   * 当前主题
   */
  ThemeType theme = ThemeType.light;

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
