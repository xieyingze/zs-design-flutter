import '../models/api.dart';

/*
 * debug日志事件
 */
class DebugLogToolsEvent {
  List<DebugApiModel> models = [];
  DebugLogToolsEvent({required this.models});
}

/*
 * 系统 FPS
 */
class SMSystemFPSEvent {
  double fps;
  SMSystemFPSEvent(this.fps);
}
