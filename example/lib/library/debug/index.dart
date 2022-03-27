import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

import 'components/button.dart';
import 'components/info.dart';

//////////////////////////// 悬浮按钮 ////////////////////////////

class SMDebugTools extends StatefulWidget {
  final Widget child;
  final Function(bool showPerformance)? onShowPerformanceCallBack;
  SMDebugTools({required this.child, this.onShowPerformanceCallBack});

  @override
  _SMDebugToolsState createState() => _SMDebugToolsState();
}

class _SMDebugToolsState extends State<SMDebugTools> {
  /// 是否拽动
  bool draggable = false;

  /// 静止状态下的offset
  Offset idleOffset = Offset(0, 0);

  /// 本次移动的offset
  Offset moveOffset = Offset(0, 0);

  /// 最后一次down事件的offset
  Offset lastStartOffset = Offset(0, 0);

  /// 是否显示信息面板
  bool _isShowModalInfo = false;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _insertOverlay(context));

    return LayoutBuilder(
      builder: (context, constraints) {
        return widget.child;
      },
    );
  }

  /*
   * @description   悬浮按钮，可以拖拽（可自定义样式）
   * @param         
   * @return        
   * @author        jay    
   * @time          3/23/22 5:40 PM  
   */
  void _insertOverlay(BuildContext context) {
    return Overlay.of(context)?.insert(
      OverlayEntry(builder: (context) {
        final size = MediaQuery.of(context).size;
        return Positioned(
          top: draggable ? moveOffset.dy : size.height,
          left: draggable ? moveOffset.dx : size.width,
          child: GestureDetector(
            // 移动开始
            onPanStart: (DragStartDetails details) {
              setState(() {
                lastStartOffset = details.globalPosition;
                draggable = true;
              });
              if (count <= 1) {
                count++;
              }
            },
            // 移动中
            onPanUpdate: (DragUpdateDetails details) {
              moveOffset = details.globalPosition - lastStartOffset + idleOffset;
              if (count > 1) {
                moveOffset = Offset(max(0, moveOffset.dx), moveOffset.dy);
              } else {
                moveOffset = Offset(max(0, moveOffset.dx + (size.width)), moveOffset.dy + (size.height));
              }
              setState(() {});
            },
            // 移动结束
            onPanEnd: (DragEndDetails detail) {
              if (moveOffset.dx > 56 && moveOffset.dx < (ZSScreen.width / 2)) {
                moveOffset = Offset(0, moveOffset.dy);
              }
              if (moveOffset.dx > ZSScreen.width / 2 && moveOffset.dx < (ZSScreen.width)) {
                moveOffset = Offset(ZSScreen.width, moveOffset.dy);
              }
              setState(() {
                idleOffset = moveOffset * 1;
              });
            },
            child: _isShowModalInfo
                ? Container()
                : SMDebugButton(
                    onPress: () {
                      _onShowModalInfo();
                    },
                    onOpenPerformanceCallBack: (isOpen) => _onHandleOpenDebugLogInfoCallBack(isOpen: isOpen),
                  ),
          ),
        );
      }),
    );
  }

  /*
   * @description   显示信息面板
   * @param
   * @return
   * @author        jay
   * @time          3/23/22 5:42 PM
   */
  void _onShowModalInfo() async {
    setState(() {
      _isShowModalInfo = true;
    });
    await showModalBottomSheet(
      context: context,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return SMDebugLogInfo(
          callBack: (plug) => Get.back(),
        );
      },
    );
    setState(() {
      _isShowModalInfo = false;
    });
  }

  /*
   * @description   处理是否显示性能模式
   * @param         
   * @return        
   * @author        jay    
   * @time          3/25/22 10:26 AM
   */
  void _onHandleOpenDebugLogInfoCallBack({required bool isOpen}) {
    if (widget.onShowPerformanceCallBack != null) {
      widget.onShowPerformanceCallBack!(isOpen);
    }
  }
}
