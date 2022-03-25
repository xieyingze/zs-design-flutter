import 'package:flutter/material.dart';

import '../../index.dart';
import '../../lib/animations/modal.dart';

class ZSDialog {
  /*
   * @description:    显示确认框
   * @param:
   * @return:
   * @author:         jay xie
   * @time:           3/6/22 8:45 PM
   */
  static Future<dynamic> showConfirmDialog({
    required BuildContext context,
    bool? dismissible,
    String? title,
    required String content,
    String? cancel,
    String? confirm,
    required Function(int index) onCallBack,
  }) async {
    double itemW = (ZSScreen.width - 32) / 2;
    Widget widget = Container(
      padding: EdgeInsets.only(top: 16),
      width: itemW * 2,
      height: title != null ? 180 : 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              title != null
                  ? SMLabel(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      text: title,
                      fontSize: fontSize16,
                      color: ZSColors.fontMain(),
                      fontWeight: FontWeight.w500,
                    )
                  : Container(),
              SMLabel(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(top: 16),
                maxLines: 3,
                text: content,
                color: ZSColors.fontMedium(),
              ),
            ],
          ),
          Column(
            children: [
              Container(height: 0.5, color: ZSColors.line()),
              cancel != null
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onCallBack(0);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: itemW - 0.5,
                            height: 50,
                            alignment: Alignment.center,
                            child: SMLabel(
                              text: '取消',
                              fontSize: fontSize16,
                            ),
                            decoration: BoxDecoration(
                              color: ZSColors.card(),
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                        ),
                        Container(height: 44, width: 0.5, color: ZSColors.line()),
                        GestureDetector(
                          onTap: () => {
                            onCallBack(1),
                            Navigator.pop(context),
                          },
                          child: Container(
                            width: itemW,
                            height: 50,
                            alignment: Alignment.center,
                            child: SMLabel(
                              text: '确认',
                              color: ZSColors.main(),
                              fontSize: fontSize16,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: BoxDecoration(
                              color: ZSColors.card(),
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () => {
                        onCallBack(1),
                        Navigator.pop(context),
                      },
                      child: Container(
                        width: itemW * 2,
                        height: 50,
                        alignment: Alignment.center,
                        child: SMLabel(
                          text: confirm ?? '确认',
                          color: ZSColors.main(),
                          fontSize: fontSize16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: BoxDecoration(
                          color: ZSColors.card(),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: ZSColors.card(),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
    return ZSDialog.show(
      context: context,
      dismissible: dismissible,
      child: widget,
    );
  }

  /*
   * @description:    显示弹框(基础)
   * @param:          
   * @return:         
   * @author:         jay xie
   * @time:           3/6/22 8:31 PM
   */
  static Future<dynamic> show({
    required BuildContext context,
    Alignment? alignment,
    required Widget child,
    bool? dismissible,
  }) async {
    return showModal(
        context: context,
        configuration: FadeScaleTransitionConfiguration(barrierDismissible: dismissible ?? true),
        useRootNavigator: false,
        builder: (BuildContext context) {
          return Align(
            alignment: alignment ?? Alignment.center,
            child: child,
          );
        });
  }
}
