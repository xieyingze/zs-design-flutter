import 'package:get/get.dart';

enum ViewModelState {
  normal,
  busy,
  empty,
  error,
  unAuthorized,
}

class BaseController extends GetxController {
  /// 是否被销毁，防止页面销毁后，异步任务才完成，导致报错
  bool disposed = false;

  /// 状态
  ViewModelState _state = ViewModelState.normal;

  BaseController({ViewModelState? state})
      : _state = state ?? ViewModelState.normal;

  /// 获取状态
  ViewModelState get state => _state;

  /// 更新状态
  void updateState(ViewModelState state) {
    _state = state;
  }

  @override
  void onClose() {
    disposed = true;
    super.onClose();
  }
}
