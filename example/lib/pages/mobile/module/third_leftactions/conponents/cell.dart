import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBLeftActionsCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 60,
                    height: 60,
                    child: ZSIcon(
                      data: Ionicons.basketball_outline,
                      size: 40,
                      color: ZSColors.white(),
                    ),
                    decoration: BoxDecoration(
                      color: ZSColors.main(),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  ZSLayout(
                    type: ZSLayoutType.column,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ZSLabel(
                        margin: EdgeInsets.only(bottom: 4),
                        text: '订阅消息',
                        color: ZSColors.fontMain(),
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize16,
                      ),
                      ZSLabel(
                        width: ZSScreen.getWidth(context) - 80,
                        text: '[22条]茂名网微茂名：不负好时光！茂名这篇绿地开始..',
                        color: ZSColors.fontNormal(),
                        maxLines: 1,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZSLabel(
                    text: '下午14：20',
                    color: ZSColors.fontNormal(),
                    fontSize: fontSize12,
                  )
                ],
              ),
            ],
          ),
        ),
        Container(margin: EdgeInsets.symmetric(horizontal: 16), color: ZSColors.line(alpha: 0.5), height: 0.5)
      ],
    );
  }
}
