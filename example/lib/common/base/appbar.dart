import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

////////////////////////////// 状态栏+导航栏 //////////////////////////////

// ignore: must_be_immutable
class BaseAppbar extends StatefulWidget implements PreferredSizeWidget {
  /*
   * 标题
   */
  final Widget titleWidget;
  /*
   * 从外部指定高度
   */
  final double contentHeight;
  /*
   * 设置导航栏背景的颜色
   */
  final Color backgroundColor;
  /*
   * 左侧按钮
   */
  final Widget? leftWidget;
  /*
   * 右侧按钮
   */
  final Widget? rightWidget;
  /*
   * 是否显示阴影
   */
  final bool showShadow;
  /*
   * 状态栏样式
   */
  SystemUiOverlayStyle style;

  BaseAppbar({
    this.leftWidget,
    required this.titleWidget,
    this.contentHeight = 44,
    this.backgroundColor = Colors.white,
    this.rightWidget,
    this.showShadow = false,
    this.style = SystemUiOverlayStyle.dark,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseAppbarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(contentHeight);
}

class _BaseAppbarState extends State<BaseAppbar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: widget.style,
        child: SafeArea(
          top: true,
          child: Container(
            // decoration: UnderlineTabIndicator(
            //   borderSide: BorderSide(width: 0, color: KColors.clear),
            // ),
            height: widget.contentHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: widget.leftWidget,
                  ),
                ),
                widget.titleWidget,
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: widget.rightWidget,
                  ),
                ),
              ],
            ),
            decoration: widget.showShadow
                ? BoxDecoration(
                    color: ZSColors.mainRed(),
                    boxShadow: [
                      BoxShadow(
                        color: ZSColors.shadow(),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      )
                    ],
                  )
                : const BoxDecoration(
                    // color: Colors.green,
                    ),
          ),
        ),
      ),
    );
  }
}
