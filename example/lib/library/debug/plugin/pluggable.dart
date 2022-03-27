import 'package:flutter/material.dart';

abstract class SMDebugPluggable {
  /// 插件名称
  String get name;

  /// 显示名称
  String get displayName;

  /// 点击事件
  void onTriggerEvent();

  /// Widget
  Widget buildWidget(BuildContext? context);

  ///
  ImageProvider get iconImageProvider;

  /// 图标
  IconData get iconData;

  /// 是否跳转到下一级页面
  bool get isPushNextPage;
}

typedef StreamFilter = bool Function(dynamic);

abstract class PluggableWithStream extends SMDebugPluggable {
  Stream get stream;
  StreamFilter get streamFilter;
}

abstract class PluggableWithNestedWidget extends SMDebugPluggable {
  Widget buildNestedWidget(Widget child);
}
