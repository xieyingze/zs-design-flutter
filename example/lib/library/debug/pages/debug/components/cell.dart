import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/library/debug/models/exception.dart';

class DebugErrorCell extends StatefulWidget {
  final int? index;
  final DebugExceptionModel? model;
  const DebugErrorCell({
    Key? key,
    this.index,
    this.model,
  }) : super(key: key);

  @override
  _DebugErrorCellState createState() => _DebugErrorCellState();
}

class _DebugErrorCellState extends State<DebugErrorCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: ((widget.index ?? 0) % 2 == 1) ? ZSColors.card() : ZSColors.background(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZSLabel(
                text: '当前页面: ${widget.model?.page ?? ''}',
                fontSize: fontSize12,
                color: ZSColors.fontMain(),
              ),
              ZSLabel(
                text: (widget.model?.dateTime ?? '').toString(),
                fontSize: fontSize12,
                color: ZSColors.fontMain(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: widget.model?.error ?? ''));
              ZSToast.show(message: '复制成功');
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: ZSIcon(
                data: Ionicons.copy,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: ZSLabel(
              maxLines: 100,
              text: widget.model?.error ?? '',
              color: ZSColors.main(),
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
