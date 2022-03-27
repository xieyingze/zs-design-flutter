import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zs_design_flutter_example/common/base/controller.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/common/utils/icons.dart';

class MBIconController extends BaseController {
  List<List<String>> titles = [];
  List<List<IconData>> icons = [];

  void initData() {
    List<String> temp1 = [];
    List<IconData> temp2 = [];
    IoniconsUtils.datas.entries.forEach((element) {
      // titles.add(element.key);
      // icons.add(element.value);
      if (temp1.length == 4) {
        temp1 = [];
        temp2 = [];
        titles.add(temp1);
        icons.add(temp2);
      } else {
        temp1.add((element.key));
        temp2.add((element.value));
      }
    });
  }

  void onHandleCopy({required String text}) {
    String str = """
    ZSIcon(
        data: Ionicons.$text,
        size: 20,
      )
    """;
    Clipboard.setData(ClipboardData(text: str));
    Alert.alertTip('$text 复制成功');
  }
}
