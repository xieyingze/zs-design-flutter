import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

import '../../../../main.dart';
import '../controller.dart';

class DTHomeCenterSearch extends GetView<DTHomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      color: ZSColors.card(),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 36,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Ionicons.search_outline,
                        size: 20,
                        color: ZSColors.fontNormal(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, top: 4),
                        width: 200,
                        height: 20,
                        color: ZSColors.mainRedBackground(),
                        child: TextField(
                          style: TextStyle(
                            color: ZSColors.fontMain(),
                            fontSize: fontSize14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: ZSColors.fontNormal(),
                              fontSize: fontSize14,
                            ),
                            counterText: '',
                            hintText: '输入搜索品种',
                            border: InputBorder.none,
                            // fillColor: Colors.transparent,
                            // errorMaxLines: 1,
                          ),
                          onChanged: (text) {
                            logger.d('-----------$text');
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 20,
                    alignment: Alignment.centerRight,
                    child: ZSLabel(
                      text: '搜索',
                      color: ZSColors.fontMain(),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: ZSColors.background(),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {},
            child: Container(
              margin: EdgeInsets.only(left: 32),
              width: 70,
              height: 36,
              alignment: Alignment.center,
              child: ZSLabel(
                text: '开始测试',
                color: ZSColors.white(),
              ),
              decoration: BoxDecoration(
                color: ZSColors.mainGreen(),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
