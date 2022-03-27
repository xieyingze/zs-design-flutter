import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

import '../../../models/api.dart';

class DebugNetworkExpand extends StatefulWidget {
  final DebugApiModel? model;
  final Function onTap;
  const DebugNetworkExpand({Key? key, this.model, required this.onTap}) : super(key: key);

  @override
  _DebugNetworkExpandState createState() => _DebugNetworkExpandState();
}

class _DebugNetworkExpandState extends State<DebugNetworkExpand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZSLabel(
            margin: EdgeInsets.only(bottom: 16),
            // text: MyDate.format('yyyy-MM-dd HH:mm:ss ssss', widget.model.dateTime),
            text: '${widget.model?.dateTime.toString()}',
            color: ZSColors.fontNormal(),
            fontSize: fontSize12,
          ),
          // 请求头
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: widget.model?.reqHeader ?? ''));
                      ZSToast.show(message: '复制成功');
                    },
                    child: ZSIcon(
                      data: Ionicons.copy,
                      size: 20,
                    ),
                  ),
                  ZSLabel(
                    margin: EdgeInsets.only(left: 8),
                    text: '请求头部',
                    fontSize: fontSize12,
                    fontWeight: FontWeight.w500,
                    color: ZSColors.fontMain(),
                  ),
                ],
              ),
              ZSContainer(
                onTap: () => widget.onTap(),
                width: 36,
                height: 20,
                alignment: Alignment.center,
                child: ZSLabel(
                  text: '过滤',
                  color: ZSColors.white(),
                  fontSize: fontSize12,
                ),
                decoration: BoxDecoration(
                  color: ZSColors.fontNormal(),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          ZSLabel(
            margin: EdgeInsets.only(top: 8),
            text: widget.model?.reqHeader ?? '',
            fontSize: fontSize12,
            fontWeight: FontWeight.w300,
            color: ZSColors.fontMain(),
          ),
          Container(
            height: 0.5,
            color: ZSColors.line(),
            margin: EdgeInsets.symmetric(vertical: 16),
          ),
          // 请求参数
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.model?.reqParams ?? ''));
                  ZSToast.show(message: '复制成功');
                },
                child: ZSIcon(
                  data: Ionicons.copy,
                  size: 20,
                ),
              ),
              ZSLabel(
                margin: EdgeInsets.only(left: 8),
                text: '请求参数',
                fontSize: fontSize12,
                fontWeight: FontWeight.w500,
                color: ZSColors.fontMain(),
              ),
            ],
          ),
          ZSLabel(
            margin: EdgeInsets.only(top: 8),
            text: widget.model?.reqParams ?? '',
            fontSize: fontSize12,
            fontWeight: FontWeight.w300,
            color: ZSColors.fontMain(),
          ),
          Container(
            height: 0.5,
            color: ZSColors.line(),
            margin: EdgeInsets.symmetric(vertical: 16),
          ),
          // 请求响应体
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.model?.response));
                  ZSToast.show(message: '复制成功');
                },
                child: ZSIcon(
                  data: Ionicons.copy,
                  size: 20,
                ),
              ),
              ZSLabel(
                margin: EdgeInsets.only(left: 8),
                text: '响应体',
                fontSize: fontSize12,
                fontWeight: FontWeight.w500,
                color: ZSColors.fontMain(),
              ),
            ],
          ),
          ZSLabel(
            margin: EdgeInsets.only(top: 8),
            text: widget.model?.response ?? '',
            fontSize: fontSize12,
            fontWeight: FontWeight.w300,
            color: ZSColors.fontMain(),
          ),
        ],
      ),
    );
  }
}
