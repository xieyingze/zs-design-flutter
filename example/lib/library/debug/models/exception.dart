/*
 * App异常信息模型
 */
class DebugExceptionModel {
  /// 错误日志
  String? error;

  /// 错误日志所发生所在页面
  String? page;

  /// 操作时间
  DateTime dateTime = DateTime.now();

  DebugExceptionModel({
    this.error,
    this.page,
  });
}

extension DebugErrorModelExtension on DebugExceptionModel {}
