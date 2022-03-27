import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/controller.dart';

abstract class BaseWidget<T extends BaseController> extends GetView {
  @override
  Widget build(BuildContext context) {
    initialDatas(context);
    return GetBuilder(builder: (T viewModel) {
      return setupWidget(context, viewModel);
    });
  }

  Widget setupWidget(BuildContext context, T? viewModel);

  void initialDatas(BuildContext context);

  T get ctr => controller;
}

////////////////////////////// 基类Widget //////////////////////////////

// class BaseWidget extends StatefulWidget {
//   /*
//    * 内边距
//    */
//   final EdgeInsets padding;
//   /*
//    * 外边距
//    */
//   final EdgeInsets margin;
//   /*
//    * 子组件
//    */
//   final Widget child;
//   /*
//    * 点击事件
//    */
//   final Function onTap;
//
//   const BaseWidget({
//     Key? key,
//     this.padding = EdgeInsets.zero,
//     this.margin = EdgeInsets.zero,
//     required this.child,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   State<BaseWidget> createState() => _BaseWidgetState();
// }
//
// class _BaseWidgetState extends State<BaseWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: widget.padding,
//       margin: widget.margin,
//       child: widget.child,
//     );
//   }
// }
