import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zs_design_flutter_example/components/refresh/refresh/easy_refresh.dart';

/* 
 * @description: 自定义Footer
 * @author: Zane Zhao
 */
///
class MBCustomFooter extends Footer {
  /// Key
  final Key? key;

  /// 方位
  final AlignmentGeometry? alignment;

  /// 提示加载文字
  final String? loadText;

  /// 准备加载文字
  final String? loadReadyText;

  /// 正在加载文字
  final String? loadingText;

  /// 加载完成文字
  final String? loadedText;

  /// 加载失败文字
  final String? loadFailedText;

  /// 没有更多文字
  final String? noMoreText;

  /// 显示额外信息(默认为时间)
  final bool showInfo;

  /// 更多信息
  final String? infoText;

  /// 背景颜色
  final Color bgColor;

  /// 字体颜色
  final Color textColor;

  /// 更多信息文字颜色
  final Color infoColor;

  MBCustomFooter({
    double extent = 60.0,
    double triggerDistance = 70.0,
    bool float = false,
    Duration? completeDuration = const Duration(seconds: 1),
    bool enableInfiniteLoad = true,
    bool enableHapticFeedback = true,
    bool overScroll = false,
    bool safeArea = true,
    EdgeInsets? padding,
    this.key,
    this.alignment,
    this.loadText,
    this.loadReadyText,
    this.loadingText,
    this.loadedText,
    this.loadFailedText,
    this.noMoreText,
    this.showInfo: false,
    this.infoText,
    this.bgColor: Colors.transparent,
    this.textColor: Colors.black38,
    this.infoColor: Colors.teal,
  }) : super(
          extent: extent,
          triggerDistance: triggerDistance,
          float: float,
          completeDuration: completeDuration,
          enableInfiniteLoad: enableInfiniteLoad,
          enableHapticFeedback: enableHapticFeedback,
          overScroll: overScroll,
          safeArea: safeArea,
          padding: padding,
        );

  @override
  Widget contentBuilder(BuildContext context, LoadMode loadState, double pulledExtent, double loadTriggerPullDistance, double loadIndicatorExtent,
      AxisDirection axisDirection, bool float, Duration? completeDuration, bool enableInfiniteLoad, bool success, bool noMore) {
    return MBCustomFooterWidget(
      key: key,
      customFooter: this,
      loadState: loadState,
      pulledExtent: pulledExtent,
      loadTriggerPullDistance: loadTriggerPullDistance,
      loadIndicatorExtent: loadIndicatorExtent,
      axisDirection: axisDirection,
      float: float,
      completeDuration: completeDuration,
      enableInfiniteLoad: enableInfiniteLoad,
      success: success,
      noMore: noMore,
    );
  }
}

/// 经典Footer组件
class MBCustomFooterWidget extends StatefulWidget {
  final MBCustomFooter customFooter;
  final LoadMode loadState;
  final double pulledExtent;
  final double loadTriggerPullDistance;
  final double loadIndicatorExtent;
  final AxisDirection axisDirection;
  final bool float;
  final Duration? completeDuration;
  final bool enableInfiniteLoad;
  final bool success;
  final bool noMore;

  MBCustomFooterWidget(
      {Key? key,
      required this.loadState,
      required this.customFooter,
      required this.pulledExtent,
      required this.loadTriggerPullDistance,
      required this.loadIndicatorExtent,
      required this.axisDirection,
      required this.float,
      this.completeDuration,
      required this.enableInfiniteLoad,
      required this.success,
      required this.noMore})
      : super(key: key);

  @override
  MBCustomFooterWidgetState createState() => MBCustomFooterWidgetState();
}

class MBCustomFooterWidgetState extends State<MBCustomFooterWidget> with TickerProviderStateMixin<MBCustomFooterWidget> {
  // 是否到达触发加载距离
  bool _overTriggerDistance = false;

  bool get overTriggerDistance => _overTriggerDistance;

  set overTriggerDistance(bool over) {
    if (_overTriggerDistance != over) {
      _overTriggerDistance ? _readyController.forward() : _restoreController.forward();
    }
    _overTriggerDistance = over;
  }

  /// 文本
  String get _loadText {
    return widget.customFooter.loadText ?? '上拉加载更多';
  }

  String get _loadReadyText {
    return widget.customFooter.loadReadyText ?? '松开加载';
  }

  String get _loadingText {
    return widget.customFooter.loadingText ?? '正在加载...';
  }

  // String get _loadedText {
  //   return widget.customFooter.loadedText ?? '加载完成';
  // }

  String get _loadFailedText {
    return widget.customFooter.loadFailedText ?? '加载失败';
  }

  /// 没有更多文字
  String get _noMoreText {
    return widget.customFooter.noMoreText ?? '暂无更多内容';
  }

  String get _infoText {
    return widget.customFooter.infoText ?? '更新于 %T';
  }

  // 动画
  late AnimationController _readyController;
  late Animation<double> _readyAnimation;
  late AnimationController _restoreController;
  late Animation<double> _restoreAnimation;

  // Icon旋转度
  double _iconRotationValue = 1.0;

  // 显示文字
  String get _showText {
    if (widget.noMore) return _noMoreText;
    if (widget.enableInfiniteLoad) {
      if (widget.loadState == LoadMode.loaded || widget.loadState == LoadMode.inactive || widget.loadState == LoadMode.drag) {
        return _finishedText;
      } else {
        return _loadingText;
      }
    }
    switch (widget.loadState) {
      case LoadMode.load:
        return _loadingText;
      case LoadMode.armed:
        return _loadingText;
      case LoadMode.loaded:
        return _finishedText;
      case LoadMode.done:
        return _finishedText;
      default:
        if (overTriggerDistance) {
          return _loadReadyText;
        } else {
          return _loadText;
        }
    }
  }

  // 加载结束文字
  String get _finishedText {
    if (!widget.success) return _loadFailedText;
    if (widget.noMore) return _noMoreText;
    return _loadText; //_loadedText;
  }

  // 加载结束图标
  IconData get _finishedIcon {
    if (!widget.success) return Icons.error_outline;
    if (widget.noMore) return Icons.hourglass_empty;
    return Icons.done;
  }

  // 更新时间
  late DateTime _dateTime;

  // 获取更多信息
  String get _infoTextStr {
    if (widget.loadState == LoadMode.loaded) {
      _dateTime = DateTime.now();
    }
    String fillChar = _dateTime.minute < 10 ? "0" : "";
    return _infoText.replaceAll("%T", "${_dateTime.hour}:$fillChar${_dateTime.minute}");
  }

  @override
  void initState() {
    super.initState();
    // 初始化时间
    _dateTime = DateTime.now();
    // 初始化动画
    _readyController = new AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _readyAnimation = new Tween(begin: 0.5, end: 1.0).animate(_readyController)
      ..addListener(() {
        setState(() {
          if (_readyAnimation.status != AnimationStatus.dismissed) {
            _iconRotationValue = _readyAnimation.value;
          }
        });
      });
    _readyAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _readyController.reset();
      }
    });
    _restoreController = new AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _restoreAnimation = new Tween(begin: 1.0, end: 0.5).animate(_restoreController)
      ..addListener(() {
        setState(() {
          if (_restoreAnimation.status != AnimationStatus.dismissed) {
            _iconRotationValue = _restoreAnimation.value;
          }
        });
      });
    _restoreAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _restoreController.reset();
      }
    });
  }

  @override
  void dispose() {
    _readyController.dispose();
    _restoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 是否为垂直方向
    bool isVertical = widget.axisDirection == AxisDirection.down || widget.axisDirection == AxisDirection.up;
    // 是否反向
    bool isReverse = widget.axisDirection == AxisDirection.up || widget.axisDirection == AxisDirection.left;
    // 是否到达触发加载距离
    overTriggerDistance = widget.loadState != LoadMode.inactive && widget.pulledExtent >= widget.loadTriggerPullDistance;
    return Stack(
      children: <Widget>[
        Positioned(
          top: !isVertical
              ? 0.0
              : !isReverse
                  ? 0.0
                  : null,
          bottom: !isVertical
              ? 0.0
              : isReverse
                  ? 0.0
                  : null,
          left: isVertical
              ? 0.0
              : !isReverse
                  ? 0.0
                  : null,
          right: isVertical
              ? 0.0
              : isReverse
                  ? 0.0
                  : null,
          child: Container(
            alignment: widget.customFooter.alignment ??
                (isVertical
                    ? !isReverse
                        ? Alignment.topCenter
                        : Alignment.bottomCenter
                    : isReverse
                        ? Alignment.centerRight
                        : Alignment.centerLeft),
            width: !isVertical
                ? widget.loadIndicatorExtent > widget.pulledExtent
                    ? widget.loadIndicatorExtent
                    : widget.pulledExtent
                : double.infinity,
            height: isVertical
                ? widget.loadIndicatorExtent > widget.pulledExtent
                    ? widget.loadIndicatorExtent
                    : widget.pulledExtent
                : double.infinity,
            color: widget.customFooter.bgColor,
            child: SizedBox(
              height: isVertical ? widget.loadIndicatorExtent : double.infinity,
              width: !isVertical ? widget.loadIndicatorExtent : double.infinity,
              child: isVertical
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(isVertical, isReverse),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(isVertical, isReverse),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  // 构建显示内容
  List<Widget> _buildContent(bool isVertical, bool isReverse) {
    return isVertical
        ? <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                  right: 15.0,
                ),
                child: (widget.loadState == LoadMode.load || widget.loadState == LoadMode.armed) && !widget.noMore
                    ? Container(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation(
                            widget.customFooter.textColor,
                          ),
                        ),
                      )
                    : widget.loadState == LoadMode.loaded ||
                            widget.loadState == LoadMode.done ||
                            (widget.enableInfiniteLoad && widget.loadState != LoadMode.loaded) ||
                            widget.noMore
                        ? null
                        : Transform.rotate(
                            child: Icon(
                              !isReverse ? Icons.arrow_upward : Icons.arrow_downward,
                              color: widget.customFooter.textColor,
                            ),
                            angle: 2 * pi * _iconRotationValue,
                          ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _showText,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: widget.customFooter.textColor,
                  ),
                ),
                widget.customFooter.showInfo
                    ? Container(
                        margin: EdgeInsets.only(
                          top: 2.0,
                        ),
                        child: Text(
                          _infoTextStr,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: widget.customFooter.infoColor,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
          ]
        : <Widget>[
            Container(
              child: widget.loadState == LoadMode.load || widget.loadState == LoadMode.armed
                  ? Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation(
                          widget.customFooter.textColor,
                        ),
                      ),
                    )
                  : widget.loadState == LoadMode.loaded ||
                          widget.loadState == LoadMode.done ||
                          (widget.enableInfiniteLoad && widget.loadState != LoadMode.loaded) ||
                          widget.noMore
                      ? Icon(
                          _finishedIcon,
                          color: widget.customFooter.textColor,
                        )
                      : Transform.rotate(
                          child: Icon(
                            !isReverse ? Icons.arrow_back : Icons.arrow_forward,
                            color: widget.customFooter.textColor,
                          ),
                          angle: 2 * pi * _iconRotationValue,
                        ),
            ),
          ];
  }
}
