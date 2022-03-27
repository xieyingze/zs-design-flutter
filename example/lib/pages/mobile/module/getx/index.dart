import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/components/button/navbar_button.dart';

import 'components/list1.dart';
import 'components/list2.dart';
import 'controller.dart';

class MBGetXPage extends GetView<MBGetXController> {
  const MBGetXPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBGetXController());

    return BaseScaffold(
      title: 'GetX父组件-子组件更新示例',
      leftWidget: CommonNavBarButton(callBack: () => Get.back()),
      child: Obx(() => Stack(
            children: [
              Offstage(
                offstage: !(controller.index.value == 0),
                child: MBGetXList1(),
              ),
              Offstage(
                offstage: !(controller.index.value == 1),
                child: MBGetXList2(),
              ),
            ],
          )),
    );
  }
}
