import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

import '../../../models/api.dart';

enum DebugNetworkCellEvent {
  expand,
  filter,
}

typedef DebugNetworkCellCallBack = Function(DebugNetworkCellEvent event, DebugApiModel? model);

class DebugNetworkCell extends StatefulWidget {
  final DebugApiModel? model;
  final DebugNetworkCellCallBack callBack;
  const DebugNetworkCell({Key? key, this.model, required this.callBack}) : super(key: key);

  @override
  _DebugNetworkCellState createState() => _DebugNetworkCellState();
}

class _DebugNetworkCellState extends State<DebugNetworkCell> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        ZSContainer(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          onTap: () => widget.callBack(DebugNetworkCellEvent.expand, widget.model),
          color: ZSColors.card(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: ZSColors.card(),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 20,
                          alignment: Alignment.center,
                          child: ZSLabel(
                            color: ZSColors.white(),
                            text: 'reqType',
                            fontSize: fontSize10,
                          ),
                          decoration: BoxDecoration(
                            color: ZSColors.mainGreen(),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        ZSLabel(
                          margin: EdgeInsets.only(left: 8),
                          width: ZSScreen.scalePixel(200),
                          text: '请求地址：${widget.model?.reqUrl ?? ''}',
                          fontWeight: FontWeight.w500,
                          color: ZSColors.fontMain(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // onTap: () => widget.callBack(DebugNetworkCellEvent.filter, widget.model),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    height: 20,
                    alignment: Alignment.center,
                    child: ZSLabel(
                      text: (widget.model?.responseTime ?? 0).toString() + 'ms',
                      color: _getNetworkResponseTimeColor(),
                      fontSize: fontSize14,
                    ),
                  )
                ],
              ),
              ZSLabel(
                text: '当前页面: ${widget.model?.page}',
                fontSize: fontSize10,
                color: ZSColors.fontNormal(),
                margin: EdgeInsets.only(top: 8),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: 0.5,
          color: ZSColors.line(),
        )
      ],
    );
  }

  Color _getNetworkResponseTimeColor() {
    num responseTime = widget.model?.responseTime ?? 0;
    if (responseTime > 3000) {
      return ZSColors.mainRed();
    } else if (responseTime > 1000) {
      return ZSColors.mainYellow();
    } else {
      return ZSColors.mainGreen();
    }
  }
}
