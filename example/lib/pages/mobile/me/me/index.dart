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
      child: Center(
        child: ZSLabel(
          text: '这是我的',
        ),
      ),
    );
  }
}
