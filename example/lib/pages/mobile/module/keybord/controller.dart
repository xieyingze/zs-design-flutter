import 'package:zs_design_flutter_example/common/index.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/manager/http/index.dart';

class MBKeyBoardController extends BaseController {
  void reqData() async {
    HttpManager.instance.get('/v1/finance/calendar/list');
  }
}
