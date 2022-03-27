class DebugFPSModel {
  /// 流畅度
  num? fps;

  /// 网络请求所在页面
  String? page;

  /// 操作时间
  DateTime dateTime = DateTime.now();

  DebugFPSModel({
    this.fps,
    this.page,
  });
}

extension DebugFPSModelExtension on DebugFPSModel {
  String get getDate {
    return 'mm:ss';
    // return MyDate.format('hh:mm:ss mmm', dateTime);
  }
}
