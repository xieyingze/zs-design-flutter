import 'package:flutter/material.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/manager/components/symbollist_title.dart';

import 'symbollist_bottom.dart';
import 'symbollist_cell.dart';
import 'symbollist_tabbar.dart';

class MBMarketManagerSymbolList extends StatelessWidget {
  final List<String> titles;
  final TabController tabController;
  const MBMarketManagerSymbolList({Key? key, required this.titles, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            MBManagerSymbolListTabBar(
              titles: ['全部', '持仓产品', '重点美股'],
              index: 0,
              controller: tabController,
              callBack: (index) => {},
            ),
            MBManagerSymbolListTitle(),
          ],
        ),
        Expanded(
          child: PageView(
            // controller: pageController,
            children: titles
                .map(
                  (obj) => ListView.builder(
                    itemBuilder: (context, index) => MBManagerSymbolListCell(),
                    itemCount: 100,
                  ),
                )
                .toList(),
          ),
        ),
        MBManagerSymbolListBottom(),
      ],
    );
  }
}
