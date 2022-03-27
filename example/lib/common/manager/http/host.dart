enum HttpHostType {
  dev,
  stg,
  uat,
  prd,
}

class HttpHostManager {
  static final HttpHostManager _singleton = HttpHostManager._();
  static HttpHostManager get instance => _singleton;
  HttpHostManager._();

  /// 网络类型
  HttpHostType hostType = HttpHostType.dev;

  String getBaseUrl() {
    switch (hostType) {
      case HttpHostType.dev:
        // return 'https://api-xgccj-dev.songmao.tech';
        return 'https://intrade-b.tcshm.com';
      case HttpHostType.stg:
        return 'https://api-xgccj-dev.songmao.tech';
      case HttpHostType.uat:
        return 'https://api-xgccj-dev.songmao.tech';
      case HttpHostType.prd:
        return 'https://api-xgccj-dev.songmao.tech';
      default:
        return 'https://api-xgccj-dev.songmao.tech';
    }
  }
}
