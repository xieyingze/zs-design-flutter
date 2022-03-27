import 'package:flutter/material.dart';

////////////////////////////// 下划线 //////////////////////////////

class BaseButton extends StatefulWidget {
  /*
   * 文字
   */
  final String text;
  /*
   * 字体颜色
   */
  final Color color;
  /*
   * 字体大小
   */
  final double fontSize;
  /*
   * 字体粗细
   */
  final FontWeight fontWeight;
  /*
   * 字体对齐方式
   */
  final TextAlign textAlign;

  /// 容器属性

  /*
   * 按钮宽度
   */
  final double? width;
  /*
   * 按钮高度
   */
  final double? height;
  /*
   * 按钮圆角
   */
  final double? radius;
  /*
   * 外边距
   */
  final EdgeInsets? margin;
  /*
   * 内边距
   */
  final EdgeInsets? padding;
  /*
   * 对齐方式
   */
  final Alignment? alignment;
  /*
   * 背景色
   */
  final Color? backgroundColor;
  /*
   * 装饰
   */
  final BoxDecoration? decoration;
  final Function? onTap;
  final Function? onDoubleTap;
  final Function? onLongPress;

  final Color? splashColor;

  /*
   * 外部接口
   */
  const BaseButton({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.width,
    this.height,
    this.radius,
    this.margin,
    this.padding,
    this.alignment,
    this.backgroundColor,
    this.decoration,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.splashColor,
  }) : super(key: key);

  @override
  createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  bool isDown = false;
  int _preTouchTime = DateTime.now().microsecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.backgroundColor ?? Colors.blue;
    Color splashColor = widget.splashColor ?? backgroundColor;

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius ?? 0),
      child: InkWell(
        splashColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          color: widget.decoration != null ? null : (isDown ? splashColor.withAlpha(99) : backgroundColor),
          margin: widget.margin,
          padding: widget.padding,
          width: widget.width,
          height: widget.height,
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
            textAlign: widget.textAlign,
          ),
          alignment: widget.alignment ?? Alignment.center,
          decoration: widget.decoration,
        ),
        onTap: () {
          int currentTime = DateTime.now().microsecondsSinceEpoch;
          int timeOffset = currentTime - _preTouchTime;
          if (timeOffset > 1500) {
            // 1.5秒 (事件防抖)
            _preTouchTime = currentTime;
            if (widget.onTap != null) {
              widget.onTap!();
            }
          }
        },
        onDoubleTap: () => widget.onDoubleTap,
        onLongPress: () => widget.onLongPress,
        onTapDown: (event) {
          setState(() {
            isDown = true;
          });
          Future.delayed(const Duration(milliseconds: 20), () {
            setState(() {
              isDown = false;
            });
          });
        },
        // onTapUp: (d) => setState(() => this.isDown = false),
      ),
    );
  }
}
