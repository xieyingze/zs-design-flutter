import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/icon.dart';

class MBManagerSectionListCell extends StatelessWidget {
  const MBManagerSectionListCell({Key? key}) : super(key: key);

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
                iconData: Icons.delete_forever,
                size: 20,
                color: ZSColors.mainRed(),
              ),
              ZSLabel(
                text: '自选一',
                color: ZSColors.fontMedium(),
                fontSize: fontSize14,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 40,
                child: CupertinoSwitch(value: false, onChanged: (val) => {}),
              ),
              Container(
                // margin: EdgeInsets.only(right: 8),
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
