import 'package:flutter/services.dart';

class ClipBoardUtils {
  /*
   * @description   复制文本
   * @param
   * @return        
   * @author        jay    
   * @time          2/28/22 10:05 AM  
   */
  static copyText({required String text}) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
