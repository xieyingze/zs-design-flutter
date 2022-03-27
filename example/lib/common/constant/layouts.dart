// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
//
// class KLayout {
//   static final KLayout _singleton = KLayout._();
//   static KLayout get instance => _singleton;
//   KLayout._();
//
//   double screenWidth = 0.0;
//
//   /*
//    * 导航状态栏高度 (final 运行时常量)
//    */
//   static final double navBarStatus = MediaQueryData.fromWindow(window).padding.top;
//   /*
//    * 导航内容高度
//    */
//   static const double navBarContent = 44;
//   /*
//    * 导航栏高度
//    */
//   static final double navBarHeight = MediaQueryData.fromWindow(window).padding.top + 44;
//   /*
//    * 屏幕宽度
//    */
//   static final double width = MediaQueryData.fromWindow(window).size.width;
//
//   static double getWidth(BuildContext context) {
//     return MediaQuery.of(context).size.width;
//   }
//
//   /*
//    * 屏幕高度
//    */
//   static final double height = MediaQueryData.fromWindow(window).size.height;
//
//   static double getHeight(BuildContext context) {
//     return MediaQuery.of(context).size.height;
//   }
//
//   static final double contentsHeight = MediaQueryData.fromWindow(window).size.height - MediaQueryData.fromWindow(window).padding.top - 44;
//
//   /*
//    * 底部补偿
//    */
//   static final double bottomFix = MediaQueryData.fromWindow(window).padding.bottom;
//
//   /*
//    * @description:    等比例宽度
//    * @param:
//    * @return:
//    * @author:         jay xie
//    * @time:           11/14/21 12:56 AM
//    */
//   static double scalePixel(double value) {
//     return value * MediaQueryData.fromWindow(window).size.width / 375;
//   }
// }
