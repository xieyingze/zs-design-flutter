import 'package:flutter/material.dart';

import '../theme/index.dart';

class ZSColors {
  /*
   * @description:    十六进制颜色
   * @param:          hex 十六进制值，例如：0xffffff,
   * @param:          alpha, 透明度 [0.0,1.0]
   * @return:
   * @author:         jay xie
   * @time:           11/14/21 12:42 AM
   */
  static Color hexColor(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8, (hex & 0x0000FF) >> 0, alpha);
  }

  /*
   * @description   hex字符串转color
   * @param
   * @return
   * @author        jay
   * @time          3/2/22 2:49 PM
   */
  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  /// 主题颜色
  static Color main({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x3FA9F5, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0xee0a24, alpha: alpha);
      default:
        return hexColor(0xee0a24, alpha: alpha);
    }
  }

  /// 主绿色颜色
  static Color mainGreen({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x00B01B, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0x10da81, alpha: alpha);
      default:
        return hexColor(0x11b17c, alpha: alpha);
    }
  }

  /// 主蓝色颜色
  static Color mainBlu({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x2f86f6, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0x2f86f6, alpha: alpha);
      default:
        return hexColor(0x2f86f6, alpha: alpha);
    }
  }

  /// 主红色颜色
  static Color mainRed({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xFB4747, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0xe5353e, alpha: alpha);
      default:
        return hexColor(0xe5353e, alpha: alpha);
    }
  }

  /// 主黄色
  static Color mainYellow({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xf8aa37, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0xf7b500, alpha: alpha);
      default:
        return hexColor(0xf7b500, alpha: alpha);
    }
  }

  /// 主绿色背景颜色
  static Color mainGreenBackground({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x00B01B, alpha: alpha).withAlpha(20);
      case SMThemeType.dark:
        return hexColor(0x11b17c, alpha: alpha).withAlpha(310);
      default:
        return hexColor(0x11b17c, alpha: alpha).withAlpha(310);
    }
  }

  /// 主红色背景颜色
  static Color mainRedBackground({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xFB4747, alpha: alpha).withAlpha(20);
      case SMThemeType.dark:
        return hexColor(0xd40000, alpha: alpha).withAlpha(310);
      default:
        return hexColor(0xd40000, alpha: alpha).withAlpha(310);
    }
  }

  /// 下划线颜色
  static Color line({bool isLight = false, double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return isLight ? hexColor(0xf5f5f5, alpha: alpha) : hexColor(0xcccccc, alpha: alpha);
      case SMThemeType.dark:
        return isLight ? hexColor(0x2B2F3B, alpha: alpha) : hexColor(0x2B2F3B, alpha: alpha);
      default:
        return isLight ? hexColor(0xf5f5f5, alpha: alpha) : hexColor(0xcccccc, alpha: alpha);
    }
  }

  /// 背景色
  static Color background({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xf7f7f7, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0x131721, alpha: alpha);
      default:
        return hexColor(0xf5f5f5, alpha: alpha);
    }
  }

  /// 背景色
  static Color darkBackground({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xf7f7f7, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0x131721, alpha: alpha);
      default:
        return hexColor(0xf7f7f7, alpha: alpha);
    }
  }

  /// 阴影色
  static Color shadow({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x000000, alpha: alpha).withAlpha(20);
      case SMThemeType.dark:
        return hexColor(0x000000, alpha: alpha).withAlpha(800);
      default:
        return hexColor(0xeaeaea, alpha: alpha).withAlpha(150);
    }
  }

  /// 阴影色
  static Color darkShadow({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x000000, alpha: alpha).withAlpha(50);
      case SMThemeType.dark:
        return hexColor(0x000000, alpha: alpha).withAlpha(800);
      default:
        return hexColor(0x000000, alpha: alpha).withAlpha(100);
    }
  }

  /// 卡片颜色
  static Color card({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xffffff, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0x1B1E26, alpha: alpha);
      default:
        return hexColor(0xffffff, alpha: alpha);
    }
  }

  /// 1级字体颜色
  static Color fontMain({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x3B3B3B, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0xefefef, alpha: alpha);
      default:
        return hexColor(0x3B3B3B, alpha: alpha);
    }
  }

  /// 2级字体颜色
  static Color fontMedium({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0x666666, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0xaaaaaa, alpha: alpha);
      default:
        return hexColor(0xffffff, alpha: alpha);
    }
  }

  /// 3级字体颜色
  static Color fontNormal({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xababab, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0x777777, alpha: alpha);
      default:
        return hexColor(0xAbAbAb, alpha: alpha);
    }
  }

  /// 4级字体颜色
  static Color fontTips({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xABABAB, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0x777777, alpha: alpha);
      default:
        return hexColor(0xC2C2C2, alpha: alpha);
    }
  }

  /// placeholder字体颜色
  static Color placeholder({double alpha = 1}) {
    switch (ZSThemeManager.instance.theme) {
      case SMThemeType.light:
        return hexColor(0xC2C2C2, alpha: alpha);
      case SMThemeType.dark:
        return hexColor(0xC2C2C2, alpha: alpha);
      default:
        return hexColor(0xC2C2C2, alpha: alpha);
    }
  }

  /// 白色
  static Color white({double alpha = 1}) {
    return hexColor(0xffffff, alpha: alpha);
  }

  /// 黑色
  static Color black({double alpha = 1}) {
    return hexColor(0x000000, alpha: alpha);
  }

  /// 透明色
  static Color clear() {
    return hexColor(0xffffff, alpha: 0);
  }
}
