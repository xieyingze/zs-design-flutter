class DebugApiModel {
  /// 是否请求成功
  bool? isSuccess = true;

  /// 请求类型
  String? reqType;

  /// 请求头部
  String? reqHeader;

  /// 请求url
  String? reqUrl;

  /// 请求参数
  String? reqParams;

  /// 请求响应
  String? response;

  /// 响应时间
  num? responseTime;

  /// 网络请求所在页面
  String? page;

  DateTime? dateTime = DateTime.now();

  bool isExpand = false;

  DebugApiModel({
    this.isSuccess,
    this.reqType,
    this.reqHeader,
    this.reqUrl,
    this.reqParams,
    this.response,
    this.responseTime,
    this.page,
  });
}
