import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/icon.dart';

class MBManagerSymbolListCell extends StatelessWidget {
  const MBManagerSymbolListCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              BaseIcon(
                margin: EdgeInsets.only(right: 8),
                iconData: Icons.check_box_outline_blank,
                size: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZSLabel(
                    text: '小米集团',
                    color: ZSColors.fontMain(),
                    fontSize: fontSize16,
                    fontWeight: FontWeight.w500,
                  ),
                  ZSLabel(
                    text: '801010',
                    color: ZSColors.fontMedium(),
                    fontSize: fontSize14,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 80,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.vertical_align_top,
                  size: 20,
                ),
              ),
              Container(
                width: 80,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.vertical_align_bottom,
                  size: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                width: 80,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.menu,
                  size: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
