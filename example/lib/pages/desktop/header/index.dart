import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';

import 'controller.dart';

class DeskTopNetworkHeaderPage extends GetView<DTSettingController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DTSettingController());

    return BaseScaffold(
      child: Column(
        children: [
          ZSLabel(text: '请求头'),
        ],
      ),
    );
  }
}
