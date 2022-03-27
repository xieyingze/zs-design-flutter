import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

import '../controller.dart';

class MBGetXList1 extends StatelessWidget {
  const MBGetXList1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBGetXController controller = Get.find<MBGetXController>();

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Obx(() => ZSLabel(
                margin: EdgeInsets.only(top: 20),
                text: controller.map.value['title'] ?? '',
              )),
          ZSContainer(
            margin: EdgeInsets.only(top: 20),
            width: 120,
            height: 40,
            child: ZSLabel(
              alignment: Alignment.center,
              text: '点击',
              color: ZSColors.white(),
            ),
            onTap: () => controller.onClick(),
            decoration: BoxDecoration(
              color: ZSColors.fontMain(),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          ZSContainer(
            margin: EdgeInsets.only(top: 20),
            width: 120,
            height: 40,
            child: ZSLabel(
              alignment: Alignment.center,
              text: '切换容器2',
              color: ZSColors.white(),
            ),
            onTap: () => controller.onSwitchContainer(i: 1),
            decoration: BoxDecoration(
              color: ZSColors.fontMain(),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
