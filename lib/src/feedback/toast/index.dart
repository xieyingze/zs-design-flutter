import 'package:flutter/cupertino.dart';

import '../../index.dart';
import '../../lib/easyloading/index.dart';

class ZSToast {
  static Future<void> showMessage({
    String? message,
    Widget? indicator,
    bool? dismissAuto,
    bool? dismissOnTap,
  }) async {
    return ZSToast.show(
      message: message,
      dismissOnTap: false,
      dismissAuto: true,
    );
  }

  static Future<void> showSuccess({
    String? message,
    Widget? indicator,
    bool? dismissAuto,
    bool? dismissOnTap,
  }) async {
    return ZSToast.show(
      message: message,
      indicator: ZSIcon(
        data: Ionicons.checkmark_outline,
        size: 40,
        color: ZSColors.white(),
      ),
      dismissOnTap: false,
      dismissAuto: true,
    );
  }

  static Future<void> showError({
    String? message,
    Widget? indicator,
    bool? dismissAuto,
    bool? dismissOnTap,
  }) async {
    return ZSToast.show(
      message: message,
      indicator: ZSIcon(
        data: Ionicons.close_outline,
        size: 40,
        color: ZSColors.white(),
      ),
      dismissOnTap: false,
      dismissAuto: true,
    );
  }

  static Future<void> showWarming({
    String? message,
    Widget? indicator,
    bool? dismissAuto,
    bool? dismissOnTap,
  }) async {
    return ZSToast.show(
      message: message,
      indicator: ZSIcon(
        data: Ionicons.alert_sharp,
        size: 40,
        color: ZSColors.white(),
      ),
      dismissOnTap: false,
      dismissAuto: true,
    );
  }

  static Future<void> show({
    String? message,
    Widget? indicator,
    bool? dismissAuto,
    bool? dismissOnTap,
  }) async {
    return EasyLoading.show(
      status: message ?? '',
      indicator: indicator != null
          ? Container(
              width: 90,
              height: 60,
              child: indicator,
            )
          : indicator,
      dismissAuto: dismissAuto ?? true,
      dismissOnTap: dismissOnTap ?? false,
    );
  }
}
