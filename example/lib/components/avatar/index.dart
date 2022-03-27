import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class BaseAvatar extends StatelessWidget {
  final double? size;
  BaseAvatar({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 36,
      height: size ?? 36,
      alignment: Alignment.center,
      child: ZSLabel(
        text: 'JX',
        color: ZSColors.white(),
        fontSize: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((size ?? 36) / 2),
        color: ZSColors.mainYellow(),
        border: Border.all(color: ZSColors.white(), width: 2),
      ),
    );
  }
}
