import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:zs_design_flutter_example/common/manager/eventbus/index.dart';

import '../models/api.dart';
import '../models/exception.dart';
import '../models/fps.dart';
import '../utils/event.dart';

enum LogLevel {
  /// debug日志
  DEBUG,

  /// 信息日志
  INFO,

  /// 警告日志
  WARN,

  /// 错误日志
  ERROR,
}

enum PlatformType {
  // CRM
  CRM,

  /// Intrade
  INTRADE,
}

/*
 * Debug管理
 */
class SMDebugManager {
  static final SMDebugManager _singleton = SMDebugManager._();
  static SMDebugManager get instance => _singleton;
  SMDebugManager._();

  /// 是否在记录FPS
  bool isRecordingFps = false;

  /// 当前所在的页面
  String currentPageName = '/marketPage';

  /// 日志模型数组
  List<DebugApiModel> networkModels = [];

  /// 错误日志数组
  List<DebugExceptionModel> errorModels = [];

  /// fps数组
  List<DebugFPSModel> fpsModels = [];

  /// id地址
  String ipAddress = '';

  /*
   * @description   添加CRM/Intrade日志
   * @param
   * @return
   * @author        jay
   * @time          8/11/21 7:49 PM
   */
  addRequestLog({
    required PlatformType platform,
    required Map<String, dynamic> result,
    required String method,
    Map<String, dynamic>? reqHeader,
    String? reqUrl,
    dynamic reqParams,
    Response? response,
    num? responseTime,
    required Function onReportErrorCallBack,
  }) {
    // 是否成功
    bool isSuccess = result['code'] == 0 ? true : false;
    // api耗时时间
    num lastTime = responseTime ?? 0;
    num offsetTime = DateTime.now().millisecondsSinceEpoch - lastTime;
    // 获取响应体值
    String responseBody = '';
    if (result['code'] == 0) {
      responseBody = convert.jsonEncode(response?.data ?? {}).replaceAll('\\', '');
    } else if (result['code'] == -1) {
      responseBody = result['responseBody'];
    } else {
      responseBody = result['message'];
    }

    // 判断添加日志到调试工具
    // if (GlobalManager.instance.setting.isDebugMode == false) return;

    DebugApiModel model = DebugApiModel(
      reqType: platform.toString().replaceAll('PlatformType.', ''),
      isSuccess: isSuccess,
      reqHeader: convert.jsonEncode(reqHeader),
      reqUrl: reqUrl,
      reqParams: reqParams.toString(),
      response: responseBody,
      responseTime: offsetTime,
      page: SMDebugManager.instance.currentPageName,
    );
    networkModels.add(model);
    eventBusInstance.emit(DebugLogToolsEvent(models: networkModels));

    // 如果是PostAPIKey，那么就过滤掉
    //if (reqUrl == CrmNetworkApi.commonPostApiKey && isSuccess == false) return;
    // 如果是日志上报接口报错，那么就过滤掉(会出现死循环)
    // if (reqUrl == IntNetworkApi.appLogCollection) return;
    // 日志上报
    reportError(
      level: getLogLevel(isSuccess: isSuccess, offsetTime: offsetTime),
      platform: platform,
      method: method,
      reqHeader: reqHeader,
      url: reqUrl,
      requestData: reqParams.toString(),
      responseHeader: response == null ? '' : response.headers.toString(),
      responseBody: responseBody,
      responseTime: offsetTime,
      onReportErrorCallBack: onReportErrorCallBack,
    );
  }

  /*
   * @description   添加FPS流畅度日志
   * @param
   * @return
   * @author        jay
   * @time          8/11/21 7:49 PM
   */
  addFPSLog({num? fps}) {
    DebugFPSModel model = DebugFPSModel(fps: fps, page: SMDebugManager.instance.currentPageName);
    fpsModels.add(model);
  }

  /*
   * @description   添加错误日志
   * @param
   * @return
   * @author        jay
   * @time          8/11/21 7:49 PM
   */
  addErrorLog({String? error}) {
    // if (GlobalManager.instance.setting.isDebugMode == false) return;
    DebugExceptionModel model = DebugExceptionModel(
      error: error,
      page: SMDebugManager.instance.currentPageName,
    );
    errorModels.add(model);
  }

  /*
   * @description   上报错误日志
   * @param
   * @return
   * @author        jay
   * @time          8/27/21 3:28 PM
   */
  void reportError({
    required LogLevel level,
    required PlatformType platform,
    String? method,
    Map<String, dynamic>? reqHeader,
    String? url,
    String? requestData,
    String? responseHeader,
    String? responseBody,
    required num responseTime,
    required Function onReportErrorCallBack,
  }) async {
    if (ipAddress.length == 0) {
      ipAddress = '192.168.10';
    }

    // if (url == IntNetworkApi.appLogCollection) return;
    Map<String, dynamic> param = {
      'level': level.toString().replaceAll('LogLevel.', ''),
      'trace_id': reqHeader?['x-trace-id'] ?? '',
      'platform': platform.toString().replaceAll('PlatformType.', ''),
      'timestamp': DateTime.now().subtract(DateTime.now().timeZoneOffset).millisecondsSinceEpoch,
      'url': url,
      'method': method.toString().replaceAll('NetworkMethod.', ''),
      'request_head': convert.jsonEncode(reqHeader),
      'request_body': requestData,
      'response_head': responseHeader,
      'response_body': level == LogLevel.ERROR ? responseBody : '',
      "duration": responseTime,
      "ip": ipAddress,
      // "account_id": login,
      // "device_id": BaseDeviceInfo.getDeviceUUID(),
      // "device_type": Platform.isAndroid ? 'android' : 'ios',
      // "request_data": requestDta,
      // "response_data": responseData,
      // "app_version": GlobalManager.instance.setting.appVersionNumber,
    };
    Map<String, dynamic> params = {
      'data': [param]
    };
    // 日志上报
    onReportErrorCallBack();
  }

  /*
   * @description   根据条件获取日志上报的登记
   * @param         
   * @return        
   * @author        jay    
   * @time          1/27/22 9:27 AM  
   */
  LogLevel getLogLevel({bool? isSuccess, num? offsetTime}) {
    if (isSuccess == false) {
      return LogLevel.ERROR;
    } else {
      if ((offsetTime ?? 0) > 2000) {
        return LogLevel.WARN;
      } else {
        return LogLevel.INFO;
      }
    }
  }
}
