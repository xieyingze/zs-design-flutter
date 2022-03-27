import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBManagerSymbolListTitle extends StatelessWidget {
  const MBManagerSymbolListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZSLabel(text: '品种'),
          Row(
            children: [
              ZSLabel(alignment: Alignment.centerRight, width: 80, text: '置顶'),
              ZSLabel(alignment: Alignment.centerRight, width: 80, text: '置底'),
              ZSLabel(alignment: Alignment.centerRight, width: 80, text: '排序'),
            ],
          )
        ],
      ),
    );
  }
}
