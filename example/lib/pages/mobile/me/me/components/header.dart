import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/constant/images.dart';

class MBMeHeader extends StatelessWidget {
  final Function callBack;
  MBMeHeader({Key? key, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ZSColors.card(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => callBack(),
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ZSImage(
                  url: KImage.commonDefaultAvatar,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => callBack(),
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              child: ZSLabel(
                text: '立即登录',
                color: ZSColors.fontMain(),
                fontWeight: FontWeight.w500,
                fontSize: fontSize16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
