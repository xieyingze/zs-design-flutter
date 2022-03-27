import 'package:get/get.dart';
import 'package:zs_design_flutter_example/common/index.dart';

export 'package:get/get.dart';

class MBGetXController extends BaseController {
  var index = 0.obs;

  RxMap<String, dynamic> map = {"title": '初始值'}.obs;

  void onClick() {
    Map<String, String> newMap = Map.from(map.value);
    newMap['title'] = '改变后的值';
    map.value = newMap;
  }

  void onSwitchContainer({required int i}) {
    Map<String, String> newMap = Map.from(map.value);
    newMap['title'] = '初始值';
    map.value = newMap;
    index.value = i;
  }
}
