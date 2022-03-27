import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBManagerSymbolListBottom extends StatelessWidget {
  const MBManagerSymbolListBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  size: 20,
                ),
                ZSLabel(text: '全部'),
              ],
            ),
            Row(
              children: [
                ZSLabel(margin: EdgeInsets.only(right: 32), text: '添加到'),
                ZSLabel(text: '删除'),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ZSColors.line(), width: 0.5),
        ),
      ),
    );
  }
}
