import 'package:zs_design_flutter_example/models/common/api.dart';

class JsonConvert<T> {
  static M fromJsonAsT<M>({dynamic json}) {
    return _transformModel<M>(json: json);
  }

  static _transformModel<M>({dynamic json}) {
    switch (M) {

      /// 公共api
      case CommonApiModel:
        return CommonApiModel.fromJson(json);

      default:
        return null;
    }
  }

  static dynamic fromJsonError<M>({dynamic json}) {
    // 错误信息处理
    switch (M) {

      /// 公共api
      case CommonApiModel:
        return CommonApiModel.fromJson(json);

      default:
        return null;
    }
  }
}
