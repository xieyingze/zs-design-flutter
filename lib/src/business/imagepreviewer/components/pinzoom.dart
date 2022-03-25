import 'package:flutter/material.dart';

class PinchZoom extends StatefulWidget {
  /// 最大缩放的倍数
  final double? maxScale;

  /// 重置的动画时长
  final Duration? resetDuration;

  /// 是否允许缩放
  final bool zoomEnabled;

  /// 需要缩放的子组件
  final Widget child;

  /// 事件
  final Function? onZoomStart;
  final Function? onZoomEnd;
  final Function? onTap;

  PinchZoom({
    required this.child,
    this.resetDuration = const Duration(milliseconds: 100),
    this.maxScale = 3.0,
    this.zoomEnabled = true,
    this.onZoomStart,
    this.onZoomEnd,
    this.onTap,
  });

  @override
  _PinchZoomState createState() => _PinchZoomState();
}

class _PinchZoomState extends State<PinchZoom> with SingleTickerProviderStateMixin {
  final TransformationController _transformationController = TransformationController();

  late Animation<Matrix4> _animationReset;
  late AnimationController _controllerReset;

  late TapDownDetails _doubleTapDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: InteractiveViewer(
        child: GestureDetector(
          onTap: () => _onHandleSingleTap(),
          onDoubleTap: () => _onHandleDoubleTap(),
          onDoubleTapDown: _handleDoubleTapDown,
          child: widget.child,
        ),
        scaleEnabled: widget.zoomEnabled,
        maxScale: widget.maxScale ?? 3,
        panEnabled: true,
        onInteractionStart: widget.zoomEnabled
            ? (_) {
                if (_controllerReset.status == AnimationStatus.forward) {
                  _animateResetStop();
                } else {
                  if (widget.onZoomStart != null) {
                    widget.onZoomStart!();
                  }
                }
              }
            : null,
        // onInteractionEnd: (_) => _animateResetInitialize(),
        onInteractionEnd: (_) => {},

        transformationController: _transformationController,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      duration: widget.resetDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  /*
   * @description   重置缩放
   * @param
   * @return
   * @author        jay
   * @time          3/11/22 9:32 AM
   */
  void _onAnimateReset() {
    _transformationController.value = _animationReset.value;
    if (!_controllerReset.isAnimating) {
      _animationReset.removeListener(_onAnimateReset);
      _animationReset = Matrix4Tween().animate(_controllerReset);
      _controllerReset.reset();
      if (widget.onZoomEnd != null) {
        widget.onZoomEnd!();
      }
    }
  }

  /*
   * @description
   * @param
   * @return
   * @author        jay
   * @time          3/11/22 9:33 AM
   */
  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

  /// Stop the reset animation
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset.removeListener(_onAnimateReset);
    _animationReset = Matrix4Tween().animate(_controllerReset);
    _controllerReset.reset();
  }

  /*
   * @description   双击事件
   * @param
   * @return
   * @author        jay
   * @time          3/11/22 9:33 AM
   */
  void _onHandleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      // 如果不是默认的显示倍数
      _transformationController.value = Matrix4.identity();
    } else {
      // 如果是默认显示的倍数
      final position = _doubleTapDetails.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(widget.maxScale);
    }
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  /*
   * @description   点击图片事件
   * @param         
   * @return        
   * @author        jay    
   * @time          3/11/22 2:44 PM  
   */
  void _onHandleSingleTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }
}
