import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class SMDebugUtils {
  /*
   * @description   根据fps获取对应区间的颜色值
   * @param         
   * @return        
   * @author        jay    
   * @time          3/23/22 5:25 PM  
   */
  static Color getFpsColor({required double fps}) {
    /**
     * 流畅：55~60 fps
     * 良好: 30~54 fps
     * 轻微卡顿: 15~29 fps
     * 卡顿: 小于15fps
     */
    if (fps >= 30) {
      return ZSColors.mainGreen();
    } else if (fps >= 15) {
      return ZSColors.mainYellow();
    } else {
      return ZSColors.mainRed();
    }
  }
}
