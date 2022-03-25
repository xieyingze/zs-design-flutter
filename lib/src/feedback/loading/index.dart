import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../lib/easyloading/index.dart';

enum ZSLoadingStyle {
  cupertino,
  material,
}

class SMLoading {
  static Future<void> show({
    ZSLoadingStyle style = ZSLoadingStyle.cupertino,
    String? text,
    Widget? indicator,
    bool? dismissAuto,
    bool? dismissOnTap,
  }) async {
    return EasyLoading.show(
      status: text,
      indicator: Container(
        padding: text != null ? EdgeInsets.symmetric(vertical: 16, horizontal: 36) : EdgeInsets.all(16),
        child: style == ZSLoadingStyle.cupertino
            ? Theme(
                data: ThemeData(
                  cupertinoOverrideTheme: CupertinoThemeData(
                    brightness: Brightness.dark,
                  ),
                ),
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              )
            : Container(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
      ),
      dismissAuto: dismissAuto ?? true,
      dismissOnTap: dismissOnTap ?? false,
    );
  }

  static Future dismiss() async {
    return EasyLoading.dismiss();
  }
}
