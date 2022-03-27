import 'package:get/get.dart';

class Alert {
  /* 
   * @description: 弹出错误提示框
   * @param {*}
   * @return {*}
   * @author: Zane Zhao
   */
  static void alertError(String? message) {
    String tip = message ?? '';
    Get.snackbar('报错', tip.length > 100 ? tip.substring(0, 100) : tip);
  }

  /* 
   * @description: 弹出提示框
   * @param {*}
   * @return {*}
   * @author: Zane Zhao
   */
  static void alertTip(String? message) {
    String tip = message ?? '';
    Get.snackbar('提示', tip.length > 100 ? tip.substring(0, 100) : tip);
  }
}
