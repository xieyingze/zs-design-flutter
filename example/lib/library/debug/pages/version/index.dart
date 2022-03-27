import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';

class DebugVersionPage extends StatefulWidget {
  @override
  _DebugPerformancePageState createState() => _DebugPerformancePageState();
}

class _DebugPerformancePageState extends State<DebugVersionPage> {
  List<String> _list = [
    '1、修复取款-无可用收款人账号时，填写取款信息输入框被隐藏',
    '2、修复数字货币提交存款“account_info”字段传参错误',
    '3、新增品种分析无数据的时候显示占位图',
    '4、修复取款时汇率获取的问题',
    '5、优化crm加密',
    '6、修复IOS版本更新问题',
    '....等',
  ];
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: '版本说明',
      // leading: NaviBackButton(),
      backgroundColor: ZSColors.card(),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZSLabel(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              text: '2.0.2 修复 bug版本, 不含2.0.3的新增内容。',
              fontSize: fontSize14,
              color: ZSColors.fontMain(),
              fontWeight: FontWeight.w500,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, row) {
                return Container(
                  margin: EdgeInsets.all(4),
                  child: ZSLabel(
                    text: _list[row],
                    fontSize: fontSize12,
                    color: ZSColors.fontMain(),
                  ),
                );
              },
              itemCount: _list.length,
            ))
          ],
        ),
      ),
    );
  }
}
