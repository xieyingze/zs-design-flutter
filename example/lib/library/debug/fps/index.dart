import 'dart:collection';
import 'dart:ui';

import 'package:flutter/scheduler.dart';

/*
 * 最大帧数
 * 100 帧足够了，对于 60 fps 来说
 */
const MAX_FRAMES = 120;

const REFRESH_RATE = 60;
const FRAME_INTERVAL = const Duration(microseconds: Duration.microsecondsPerSecond ~/ REFRESH_RATE);

typedef FPSCallBack = Function(double? fps);

class SMFPSManager {
  static final SMFPSManager _singleton = SMFPSManager._();
  static SMFPSManager get instance => _singleton;
  SMFPSManager._();

  /*
   * 最后一个时间段
   */
  final lastFrames = ListQueue<FrameTiming>(MAX_FRAMES);

  FPSCallBack? _callBack;

  /*
   * @description   开始监听
   * @param
   * @return
   * @author        jay
   * @time          7/28/21 2:44 PM
   */
  void startListenerScheduler(FPSCallBack? callback) {
    // if (Config.isDebug) return;
    _callBack = callback;
    SchedulerBinding.instance?.addTimingsCallback(_onReportTimings);
  }

  /*
   * @description   移除监听
   * @param
   * @return
   * @author        jay
   * @time          7/28/21 2:44 PM
   */
  void removerListenerScheduler() {
    SchedulerBinding.instance?.removeTimingsCallback(_onReportTimings);
  }

  /*
   * @description   处理监听帧率
   * @param
   * @return
   * @author        jay
   * @time          7/28/21 2:44 PM
   */
  void _onReportTimings(List<FrameTiming> timings) async {
    // 把 Queue 当作堆栈用
    for (FrameTiming timing in timings) {
      lastFrames.addFirst(timing);
    }

    // 只保留最大的帧数
    while (lastFrames.length > MAX_FRAMES) {
      lastFrames.removeLast();
    }

    final fps = SMFPSManager.getFPS(lastFrames: lastFrames);
    if (_callBack != null && fps > 0) {
      _callBack!(fps);
    }
  }

  /*
   * @description   计算FPS帧率
   * @param
   * @return
   * @author        jay
   * @time          7/28/21 2:39 PM
   */
  static double getFPS({required ListQueue<FrameTiming> lastFrames}) {
    var lastFramesSet = <FrameTiming>[];
    for (FrameTiming timing in lastFrames) {
      if (lastFramesSet.isEmpty) {
        lastFramesSet.add(timing);
      } else {
        var lastStart = lastFramesSet.last.timestampInMicroseconds(FramePhase.buildStart);
        if (lastStart - timing.timestampInMicroseconds(FramePhase.rasterFinish) > (FRAME_INTERVAL.inMicroseconds * 2)) {
          break;
        }
        lastFramesSet.add(timing);
      }
    }
    var framesCount = lastFramesSet.length;
    var costCount = lastFramesSet.map((t) {
      // 耗时超过 frameInterval 会导致丢帧
      return (t.totalSpan.inMicroseconds ~/ FRAME_INTERVAL.inMicroseconds) + 1;
    }).fold(0, (a, b) => int.parse(a.toString()) + b);
    return framesCount * REFRESH_RATE / costCount;
  }
}
