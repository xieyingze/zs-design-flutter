import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class CommonSectionHeader extends StatelessWidget {
  final String title;
  const CommonSectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: ZSLabel(
        text: title,
        fontSize: fontSize16,
        color: ZSColors.fontMain(),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
