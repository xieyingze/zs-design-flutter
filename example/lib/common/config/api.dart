import 'package:zs_design_flutter_example/common/manager/http/host.dart';

final String baseUrl = HttpHostManager.instance.getBaseUrl();

class ApiConfig {
  /// 公共请求参数
  static final Map<String, dynamic> commonParams = {
    "_app_id": "ak6vocpu871a20d8",
    "_secret": "N",
    "_systype": "iphone",
    "_v": "2.0.0",
    "_version": "1.0",
    "api_v": "2",
  };

  /// 获取公共api接口
  static final String commonApi = baseUrl + '/base/common_api';
}
