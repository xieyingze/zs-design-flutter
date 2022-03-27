// import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

// abstract class BaseState<T extends StatefulWidget> extends State<StatefulWidget> with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     WidgetsBinding.instance?.removeObserver(this);
//   }
//
//   /*
//    * Android返回按钮
//    */
//   @override
//   Future<bool> didPopRoute() {
//     Get.back();
//   }
// }

enum WidgetState {
  normal,
  success,
  busy,
  empty,
  error,
  unAuthorized,
}

class BaseState {
  /// 是否被销毁，防止页面销毁后，异步任务才完成，导致报错
  bool disposed = false;

  /// 状态
  WidgetState _state = WidgetState.normal;

  BaseState({WidgetState? state}) : _state = state ?? WidgetState.normal {
    debugPrint('BaseState error $_state');
  }

  /// 获取状态
  WidgetState get state => _state;

  /// 更新状态
  void updateState(WidgetState state) {
    _state = state;
  }

  void reqDatas() {
    _state = WidgetState.busy;
  }
}
