import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';

import 'controller.dart';

class MBMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MBMeController controller = Get.put(MBMeController());
    return BaseScaffold(
      backgroundColor: ZSColors.background(),
      title: '我的',
      child: ZSLayout(
        padding: EdgeInsets.all(16),
        type: ZSLayoutType.column,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => ZSLabel(
              text: controller.result.value,
              fontSize: fontSize16,
            ),
          ),
          ZSButton(
            margin: EdgeInsets.only(top: 20),
            size: Size(120, 44),
            title: '点击计算',
            onTap: () => controller.onSum(),
          ),
        ],
      ),
    );
  }
}
