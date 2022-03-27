import 'package:flutter/material.dart';

import '../../basic/label.dart';
import '../../constant/colors.dart';
import '../../index.dart';

class ZSModal {
  static Future<dynamic> showActionSheet({
    required BuildContext context,
    required List<String> items,
    bool? dismissible,
    String? title,
    String? cancel,
    required Function(int index) onCallBack,
  }) {
    // List<String> titles = ['选项11', '选项2', '选项3', '选项4', '选项5'];
    double height = items.length * 50;
    if (title != null) {
      height += 51;
    }
    if (cancel != null) {
      height += 58;
    }

    Widget child = Container(
      width: double.infinity,
      height: height,
      child: Column(
        children: [
          title != null
              ? Column(
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: ZSLabel(
                        text: title,
                        color: ZSColors.fontMain(),
                        fontSize: fontSize16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(height: 0.5, color: ZSColors.background()),
                  ],
                )
              : Container(),
          Column(
            children: items
                .asMap()
                .keys
                .map(
                  (index) => GestureDetector(
                    onTap: () {
                      onCallBack(index);
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      child: ZSLabel(
                        color: ZSColors.fontMain(),
                        text: items[index],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          cancel != null
              ? Column(
                  children: [
                    Container(height: 8, color: ZSColors.background(alpha: 0.5)),
                    GestureDetector(
                      onTap: () {
                        onCallBack(-1);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: ZSLabel(
                          text: cancel,
                          color: ZSColors.fontNormal(),
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        ],
      ),
      decoration: BoxDecoration(
        color: ZSColors.card(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
    );
    return ZSModal.show(
      context: context,
      dismissible: dismissible,
      child: child,
    );
  }

  /*
   * @description:    显示 (基础)
   * @param:
   * @return:
   * @author:         jay xie
   * @time:           3/6/22 8:31 PM
   */
  static Future<dynamic> show({
    required BuildContext context,
    bool? dismissible,
    required Widget child,
  }) async {
    return showModalBottomSheet(
        backgroundColor: ZSColors.clear(),
        context: context,
        isDismissible: dismissible ?? true,
        builder: (BuildContext context) {
          return child;
        });
  }
}
