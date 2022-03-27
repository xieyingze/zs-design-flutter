import 'package:flutter/material.dart';

class BaseIcon extends StatelessWidget {
  /// 图标
  final IconData iconData;

  /// 外边距
  final EdgeInsets? margin;

  /// 内边距
  final EdgeInsets? padding;

  /// 大小
  final double? size;

  /// 颜色
  final Color? color;

  /// 事件
  final Function? onTap;

  /// 初始化
  const BaseIcon({
    Key? key,
    required this.iconData,
    this.margin,
    this.padding,
    this.size,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return GestureDetector(
        onTap: () => onTap!(),
        child: Container(
          margin: margin,
          padding: padding,
          child: Icon(
            iconData,
            size: size,
            color: color,
          ),
        ),
      );
    } else {
      return Container(
        margin: margin,
        padding: padding,
        child: Icon(
          iconData,
          size: size,
          color: color,
        ),
      );
    }
  }
}
