import 'package:dio/dio.dart';

import 'instance.dart';

int get _timestamp => DateTime.now().millisecondsSinceEpoch;

const String DIO_EXTRA_START_TIME = 'sm_start_time';
const String DIO_EXTRA_END_TIME = 'sm_end_time';

//////////////////////////// 请求拦截器 ////////////////////////////
class SMDioInspector extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[DIO_EXTRA_START_TIME] = _timestamp;
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    response.requestOptions.extra[DIO_EXTRA_END_TIME] = _timestamp;
    SMInspectorInstance.pageNotifier.addRequest(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    err.response ??= Response<dynamic>(requestOptions: err.requestOptions);
    err.response!.requestOptions.extra[DIO_EXTRA_END_TIME] = _timestamp;
    SMInspectorInstance.pageNotifier.addRequest(err.response!);
    handler.next(err);
  }
}
