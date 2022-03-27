// import 'package:flutter/material.dart';
// import 'package:sm_mobile_design/common/manager/theme/flutter_easyloading.dart';
//
// class KColors {
//   /*
//    * @description:    十六进制颜色
//    * @param:          hex 十六进制值，例如：0xffffff,
//    * @param:          alpha, 透明度 [0.0,1.0]
//    * @return:
//    * @author:         jay xie
//    * @time:           11/14/21 12:42 AM
//    */
//   static Color hexColor(int hex, {double alpha = 1}) {
//     if (alpha < 0) {
//       alpha = 0;
//     } else if (alpha > 1) {
//       alpha = 1;
//     }
//     return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8, (hex & 0x0000FF) >> 0, alpha);
//   }
//
//   /*
//    * @description: hex字符串转color
//    * @param {*}
//    * @return {*}
//    * @author: Zane Zhao
//    */
//   static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
//     return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
//   }
//
//   /// 主题颜色
//   static Color main({double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x3FA9F5, alpha: alpha);
//       case ThemeType.dark:
//         return hexColor(0xee0a24, alpha: alpha);
//       default:
//         return hexColor(0xee0a24, alpha: alpha);
//     }
//   }
//
//   /// 主绿色颜色
//   static Color mainGreen({double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x00B01B, alpha: alpha);
//       case ThemeType.dark:
//         return hexColor(0x10da81, alpha: alpha);
//       default:
//         return hexColor(0x11b17c, alpha: alpha);
//     }
//   }
//
//   /// 主蓝色颜色
//   static Color mainBlu({double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x2f86f6, alpha: alpha);
//       case ThemeType.dark:
//         return hexColor(0x2f86f6, alpha: alpha);
//       default:
//         return hexColor(0x2f86f6, alpha: alpha);
//     }
//   }
//
//   /// 主红色颜色
//   static Color mainRed({double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xFB4747, alpha: alpha);
//       case ThemeType.dark:
//         return hexColor(0xe5353e, alpha: alpha);
//       default:
//         return hexColor(0xe5353e, alpha: alpha);
//     }
//   }
//
//   /// 主黄色
//   static Color mainYellow() {
//     ThemeType type = ThemeManager.instance.theme;
//     switch (type) {
//       case ThemeType.light:
//         return hexColor(0xf8aa37);
//       case ThemeType.dark:
//         return hexColor(0xf7b500);
//       default:
//         return hexColor(0xf7b500);
//     }
//   }
//
//   /// 主绿色背景颜色
//   static Color mainGreenBackground() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x00B01B).withAlpha(20);
//       case ThemeType.dark:
//         return hexColor(0x11b17c).withAlpha(310);
//       default:
//         return hexColor(0x11b17c).withAlpha(310);
//     }
//   }
//
//   /// 主红色背景颜色
//   static Color mainRedBackground() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xFB4747).withAlpha(20);
//       case ThemeType.dark:
//         return hexColor(0xd40000).withAlpha(310);
//       default:
//         return hexColor(0xd40000).withAlpha(310);
//     }
//   }
//
//   /// 下划线颜色
//   static Color line({bool isLight = false, double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return isLight ? hexColor(0xf5f5f5, alpha: alpha) : hexColor(0xcccccc, alpha: alpha);
//       case ThemeType.dark:
//         return isLight ? hexColor(0x2B2F3B, alpha: alpha) : hexColor(0x2B2F3B, alpha: alpha);
//       default:
//         return isLight ? hexColor(0xf5f5f5, alpha: alpha) : hexColor(0xcccccc, alpha: alpha);
//     }
//   }
//
//   /// 背景色
//   static Color background() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xf7f7f7);
//       case ThemeType.dark:
//         return hexColor(0x131721);
//       default:
//         return hexColor(0xf5f5f5);
//     }
//   }
//
//   /// 背景色
//   static Color darkBackground() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xf7f7f7);
//       case ThemeType.dark:
//         return hexColor(0x131721);
//       default:
//         return hexColor(0xf7f7f7);
//     }
//   }
//
//   /// 阴影色
//   static Color shadow() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x000000).withAlpha(10);
//       case ThemeType.dark:
//         return hexColor(0x000000).withAlpha(800);
//       default:
//         return hexColor(0xeaeaea).withAlpha(150);
//     }
//   }
//
//   /// 阴影色
//   static Color darkShadow() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x000000).withAlpha(20);
//       case ThemeType.dark:
//         return hexColor(0x000000).withAlpha(800);
//       default:
//         return hexColor(0x000000).withAlpha(100);
//     }
//   }
//
//   /// 卡片颜色
//   static Color card() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xffffff);
//       case ThemeType.dark:
//         return hexColor(0x1B1E26);
//       default:
//         return hexColor(0xffffff);
//     }
//   }
//
//   /// 普通按钮颜色
//   static Color normalButton() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xffffff);
//       case ThemeType.dark:
//         return hexColor(0x232838);
//       default:
//         return hexColor(0xffffff);
//     }
//   }
//
//   /// 选中按钮颜色
//   static Color selectedButton() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x3a4152);
//       case ThemeType.dark:
//         return hexColor(0x3a4152);
//       default:
//         return hexColor(0xffffff);
//     }
//   }
//
//   /// 按钮不可用颜色
//   static Color disableButton() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xD8D8D8);
//       case ThemeType.dark:
//         return hexColor(0x3a4152);
//       default:
//         return hexColor(0xD8D8D8);
//     }
//   }
//
//   /// 导航栏颜色
//   static Color navBar() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x131721);
//       case ThemeType.dark:
//         return hexColor(0x131721);
//       default:
//         return hexColor(0xffffff);
//     }
//   }
//
//   ///搜索框背景和
//   static Color searchInput() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xF3F3F3);
//       case ThemeType.dark:
//         return hexColor(0xF3F3F3);
//       default:
//         return hexColor(0xF3F3F3);
//     }
//   }
//
//   /// 1级字体颜色
//   static Color fontMain() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x3B3B3B);
//       case ThemeType.dark:
//         return hexColor(0xefefef);
//       default:
//         return hexColor(0x3B3B3B);
//     }
//   }
//
//   /// 2级字体颜色
//   static Color fontMedium() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x666666);
//       case ThemeType.dark:
//         return hexColor(0xaaaaaa);
//       default:
//         return hexColor(0xffffff);
//     }
//   }
//
//   /// 3级字体颜色
//   static Color fontNormal() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xababab);
//       case ThemeType.dark:
//         return hexColor(0x777777);
//       default:
//         return hexColor(0xAbAbAb);
//     }
//   }
//
//   /// 4级字体颜色
//   static Color fontTips({double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xABABAB, alpha: alpha);
//       case ThemeType.dark:
//         return hexColor(0x777777, alpha: alpha);
//       default:
//         return hexColor(0xC2C2C2, alpha: alpha);
//     }
//   }
//
//   /// 协议字体颜色
//   static Color lincense({double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0x989898, alpha: alpha);
//       case ThemeType.dark:
//         return hexColor(0x989898, alpha: alpha);
//       default:
//         return hexColor(0x989898, alpha: alpha);
//     }
//   }
//
//   /// placeholder字体颜色
//   static Color placeholder({double alpha = 1}) {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xC2C2C2, alpha: alpha);
//       case ThemeType.dark:
//         return hexColor(0xC2C2C2, alpha: alpha);
//       default:
//         return hexColor(0xC2C2C2, alpha: alpha);
//     }
//   }
//
//   /// 时间轴颜色
//   static Color timeLine() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xe6e6e6);
//       case ThemeType.dark:
//         return hexColor(0xe6e6e6);
//       default:
//         return hexColor(0xe6e6e6);
//     }
//   }
//
//   /// 文本框下划线颜色
//   static Color textLine() {
//     switch (ThemeManager.instance.theme) {
//       case ThemeType.light:
//         return hexColor(0xF7F7F7);
//       case ThemeType.dark:
//         return hexColor(0xF7F7F7);
//       default:
//         return hexColor(0xF7F7F7);
//     }
//   }
//
//   /// 白色
//   static Color white({double alpha = 1}) {
//     return hexColor(0xffffff, alpha: alpha);
//   }
//
//   /// 黑色
//   static Color black({double alpha = 1}) {
//     return hexColor(0x000000, alpha: alpha);
//   }
//
//   /// 透明色
//   static Color clear() {
//     return hexColor(0xffffff, alpha: 0);
//   }
// }
