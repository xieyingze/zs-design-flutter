import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBMarketManagerSegment extends StatelessWidget {
  final int index;
  final Function(int index) callBack;
  const MBMarketManagerSegment({Key? key, required this.index, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: ZSContainer(
              width: ZSScreen.width,
              onTap: () => callBack(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ZSLabel(
                    text: '品种管理',
                    color: index == 0 ? ZSColors.fontMain() : ZSColors.fontMedium(),
                    fontWeight: index == 0 ? FontWeight.w500 : FontWeight.normal,
                    fontSize: index == 0 ? fontSize18 : fontSize16,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(color: index == 0 ? ZSColors.main() : ZSColors.clear(), borderRadius: BorderRadius.circular(1.5)),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ZSContainer(
              onTap: () => callBack(1),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ZSLabel(
                    text: '分组管理',
                    color: index == 1 ? ZSColors.fontMain() : ZSColors.fontMedium(),
                    fontWeight: index == 1 ? FontWeight.w600 : FontWeight.normal,
                    fontSize: index == 1 ? fontSize18 : fontSize16,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(color: index == 1 ? ZSColors.main() : ZSColors.clear(), borderRadius: BorderRadius.circular(1.5)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
