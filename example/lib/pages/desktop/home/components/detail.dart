import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class DTHomeDetail extends GetView {
  DTHomeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      color: ZSColors.card(),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.copy_sharp,
                size: 20,
                color: ZSColors.main(),
              ),
              ZSLabel(
                margin: EdgeInsets.only(left: 8),
                text: '请求头',
                fontSize: fontSize18,
                color: ZSColors.fontMain(),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 40),
            padding: EdgeInsets.all(8),
            width: ZSScreen.getWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ZSLabel(
                  text: '--',
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: ZSColors.background(),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // 请求参数
          Row(
            children: [
              Icon(
                Icons.copy_sharp,
                size: 20,
                color: ZSColors.main(),
              ),
              ZSLabel(
                margin: EdgeInsets.only(left: 8),
                text: '请求参数',
                fontSize: fontSize18,
                color: ZSColors.fontMain(),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 40),
            padding: EdgeInsets.all(8),
            width: ZSScreen.getWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ZSLabel(
                  text: '--',
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: ZSColors.background(),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // 响应头部
          Row(
            children: [
              Icon(
                Icons.copy_sharp,
                size: 20,
                color: ZSColors.main(),
              ),
              ZSLabel(
                margin: EdgeInsets.only(left: 8),
                text: '响应头部',
                fontSize: fontSize18,
                color: ZSColors.fontMain(),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 40),
            padding: EdgeInsets.all(8),
            width: ZSScreen.getWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ZSLabel(
                  text: '--',
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: ZSColors.background(),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // 响应body
          Row(
            children: [
              Icon(
                Icons.copy_sharp,
                size: 20,
                color: ZSColors.main(),
              ),
              ZSLabel(
                margin: EdgeInsets.only(left: 8),
                text: '响应体',
                fontSize: fontSize18,
                color: ZSColors.fontMain(),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 40),
            padding: EdgeInsets.all(8),
            width: ZSScreen.getWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ZSLabel(
                  text: '--',
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: ZSColors.background(),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
