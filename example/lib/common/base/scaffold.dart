import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

import 'appbar.dart';

class BaseScaffold extends StatefulWidget {
  /*
   * AppBar
   */
  final PreferredSizeWidget? appBar;
  /*
   * 标题
   */
  final String? title;
  /*
   * 标题组件
   */
  final Widget? titleWidget;
  /*
   * 阴影
   */
  final bool? showShadow;
  /*
   * 颜色
   */
  final Color? color;
  /*
   * 字体大小
   */
  final double? fontSize;
  /*
   * 字体粗细
   */
  final FontWeight? fontWeight;
  /*
   * 导航栏颜色
   */
  final Color? navBarColor;
  /*
   * 背景色
   */
  final Color? backgroundColor;
  /*
   * 左侧子组件
   */
  final Widget? leftWidget;
  /*
   * 右侧子组件
   */
  final Widget? rightWidget;
  /*
   * 子组件
   */
  final Widget child;
  /*
   * 状态栏样式
   */
  final SystemUiOverlayStyle? style;
  /*
   * 导航栏内容高度
   */
  final double? contentHeight;
  /*
   * 标题
   */
  final BuildContext? context;

  final Widget? bottomNavigationBar;

  const BaseScaffold({
    Key? key,
    this.appBar,
    this.title,
    this.titleWidget,
    required this.child,
    this.showShadow = false,
    this.color = Colors.white,
    this.fontSize = 17.0,
    this.fontWeight = FontWeight.bold,
    this.backgroundColor,
    this.navBarColor,
    this.leftWidget,
    this.rightWidget,
    this.style,
    this.contentHeight = 64,
    this.context,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBarWidget(),
      body: widget.child,
      bottomNavigationBar: widget.bottomNavigationBar,
      backgroundColor: widget.backgroundColor ?? ZSColors.background(),
      //设置键盘弹起不顶起下方组件
      resizeToAvoidBottomInset: false,
    );
  }

  PreferredSizeWidget? _getAppBarWidget() {
    if (widget.appBar != null) {
      return widget.appBar;
    } else {
      if (widget.titleWidget != null || widget.titleWidget != null) {}
      return (widget.titleWidget == null && widget.title == null)
          ? null
          : BaseAppbar(
              titleWidget: widget.titleWidget ??
                  Text(
                    widget.title ?? '',
                    style: TextStyle(
                      fontSize: 17,
                      color: ZSColors.fontMain(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              showShadow: widget.showShadow ?? false,
              style: SystemUiOverlayStyle.dark,
              leftWidget: widget.leftWidget,
              rightWidget: widget.rightWidget,
              contentHeight: widget.contentHeight ?? 64,
              backgroundColor: widget.navBarColor ?? ZSColors.card(),
            );
    }
  }
}
