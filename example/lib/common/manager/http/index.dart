import 'package:dio/dio.dart';
import 'package:zs_design_flutter_example/common/config/api.dart';
import 'package:zs_design_flutter_example/common/manager/http/transformer.dart';
import 'package:zs_design_flutter_example/main.dart';

import 'config.dart';
import 'convert.dart';
import 'dio.dart';
import 'exception.dart';
import 'host.dart';
import 'response.dart';

// json下载地址
// https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/all/boxcnHLagVfwlM4lyKA2i3XZbCf/

class HttpManager {
  static final HttpManager _singleton = HttpManager._();
  static HttpManager get instance => _singleton;
  HttpManager._();

  /// dio
  late final BaseDio dio = BaseDio(
    options: BaseOptions(),
    dioConfig: HttpConfig(),
  );

  /*
   * @description   初始化
   * @param
   * @return
   * @author        jay
   * @time          12/10/21 10:13 AM
   */
  void initialHttpManager() async {
    // BaseOptions options = BaseOptions();
    // HttpConfig config = HttpConfig();
    // dio = BaseDio(
    //   options: BaseOptions(),
    //   dioConfig: HttpConfig(),
    // );
    dio.options.baseUrl = HttpHostManager.instance.getBaseUrl();
  }

  Future<T> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    HttpTransformer? httpTransformer,
  }) async {
    try {
      Options ops = _buildOption(options);
      // var params = await _buildParams(queryParameters);
      var response = await dio.get(
        uri,
        queryParameters: {},
        options: ops,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      HttpResponse res = handleResponse<T>(response, httpTransformer: httpTransformer);
      if (res.ok) {
        return JsonConvert.fromJsonAsT<T>(json: res.data);
      } else {
        return Future.error(res.error?.message ?? '');
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<T> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    HttpTransformer? httpTransformer,
  }) async {
    try {
      Options ops = _buildOption(options);
      var params = await _buildParams(queryParameters);
      final response = await dio.post(
        uri,
        data: data,
        queryParameters: params,
        options: ops,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      HttpResponse res = handleResponse<T>(response, httpTransformer: httpTransformer);
      if (res.ok) {
        return JsonConvert.fromJsonAsT<T>(json: res.data);
      } else {
        return Future.error(res.error?.message ?? '');
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<T> patch<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    HttpTransformer? httpTransformer,
  }) async {
    assert(data != null);
    try {
      // _dio.options.baseUrl = HttpHostManager.instance.getBaseUrl();
      Options ops = _buildOption(options);
      var params = await _buildParams(queryParameters);
      var response = await dio.patch(
        uri,
        data: data,
        queryParameters: params,
        options: ops,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      HttpResponse res = handleResponse<T>(response, httpTransformer: httpTransformer);
      if (res.ok) {
        return JsonConvert.fromJsonAsT<T>(json: res.data);
      } else {
        return Future.error(res.error?.message ?? '');
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<T> delete<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    try {
      // _dio.options.baseUrl = HttpHostManager.instance.getBaseUrl();
      Options ops = _buildOption(options);
      var params = await _buildParams(queryParameters);
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: params,
        options: ops,
        cancelToken: cancelToken,
      );
      HttpResponse res = handleResponse<T>(response, httpTransformer: httpTransformer);
      if (res.ok) {
        return JsonConvert.fromJsonAsT<T>(json: res.data);
      } else {
        return Future.error(res.error?.message ?? '');
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<T> put<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    try {
      // _dio.options.baseUrl = HttpHostManager.instance.getBaseUrl();
      Options ops = _buildOption(options);
      var params = await _buildParams(queryParameters);
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: params,
        options: ops,
        cancelToken: cancelToken,
      );
      HttpResponse res = handleResponse<T>(response, httpTransformer: httpTransformer);
      if (res.ok) {
        return JsonConvert.fromJsonAsT<T>(json: res.data);
      } else {
        return Future.error(res.error?.message ?? '');
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Response> download(
    String urlPath,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    data,
    Options? options,
    HttpTransformer? httpTransformer,
  }) async {
    try {
      var params = await _buildParams(queryParameters);
      var response = await dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: params,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  /*
   * @description   处理请求成功结果
   * @param
   * @return
   * @author        jay
   * @time          12/10/21 10:00 AM
   */
  HttpResponse handleResponse<T>(Response? response, {HttpTransformer? httpTransformer}) {
    httpTransformer ??= DefaultHttpTransformer.getInstance();

    // 返回值异常
    if (response == null) {
      return HttpResponse.failureFromError();
    }

    // token失效
    if (_isTokenTimeout(response.statusCode)) {
      return HttpResponse.failureFromError(HttpException("没有权限", response.statusCode));
    }
    // 接口调用成功
    if (_isRequestSuccess(response.statusCode)) {
      return httpTransformer.parse(response);
    } else {
      logger.d("response.statusMessage：${response.statusMessage}");
      // 接口调用失败
      return HttpResponse.failure(errorMsg: response.statusMessage, errorCode: response.statusCode);
    }
  }

  /*
   * @description   处理请求异常结果
   * @param
   * @return
   * @author        jay
   * @time          12/10/21 10:00 AM
   */
  HttpResponse handleException(Exception exception) {
    HttpException parseException = HttpException.parseException(exception);
    print("parseException:$parseException");
    return HttpResponse.failureFromError(parseException);
  }

  /// 鉴权失败
  bool _isTokenTimeout(int? code) {
    return code == 401;
  }

  /// 请求成功
  bool _isRequestSuccess(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  /*
   * @description: 生成请求参数
   * @param {*}
   * @return {*}
   * @author: Zane Zhao
   */
  _buildParams(Map<String, dynamic>? queryParameters) async {
    String uuid = "";
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // if (Platform.isIOS) {
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   uuid = iosInfo.identifierForVendor ?? "";
    // } else {
    //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //   uuid = androidInfo.id ?? "";
    // }

    Map<String, dynamic> params = {...ApiConfig.commonParams};
    if (queryParameters != null) {
      params.addAll(queryParameters);
    }
    if (uuid.isNotEmpty) {
      params.addAll({"_udid": uuid});
    }
    // if (UserManager.instance.user?.uid != null) {
    //   params.addAll({"_uid": UserManager.instance.user?.uid});
    // }

    return params;
  }

  /*
   * @description: 配置请求Options（包括请求头等信息）
   * @param {*}
   * @return {*}
   * @author: Zane Zhao
   */
  Options _buildOption(Options? options) {
    Map<String, String> ops = {
      // if (UserManager.instance.user?.uauthCode != null)
      //   "Authorization": "Bearer ${UserManager.instance.user?.uauthCode ?? ""}",
      // "User-Agent": "xgc",
    };
    if (options != null) {
      options.headers?.addAll(ops);
      return options;
    } else {
      return Options(
        headers: ops,
      );
    }
  }
}
