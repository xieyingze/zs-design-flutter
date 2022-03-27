import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/line.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';

import '../controller.dart';
import 'center_list.dart';
import 'center_search.dart';

class DTHomeCenter extends GetView<DTHomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      color: ZSColors.card(),
      child: Column(
        children: [
          DTHomeCenterSearch(),
          CommonLine(height: 1),
          Expanded(
            child: DTHomeCenterList(),
          ),
        ],
      ),
    );
  }
}
