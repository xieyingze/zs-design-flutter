import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBMeCell extends StatelessWidget {
  final String title;
  final String icon;
  final Function callBack;
  MBMeCell({
    Key? key,
    required this.title,
    required this.icon,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => callBack(),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: ZSColors.card(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ZSImage(url: icon),
                    ZSLabel(
                      margin: const EdgeInsets.only(left: 12),
                      text: title,
                      color: ZSColors.fontMain(),
                      fontSize: fontSize14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ZSColors.fontTips(),
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
