import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBManagerSectionListBottom extends StatelessWidget {
  const MBManagerSectionListBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.add,
            size: 20,
          ),
          ZSLabel(text: '添加分组'),
        ]),
        decoration: BoxDecoration(
          border: Border.all(color: ZSColors.line(), width: 0.5),
        ),
      ),
    );
  }
}
