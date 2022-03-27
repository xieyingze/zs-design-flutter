import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class MBManagerSymbolListTabBar extends StatelessWidget {
  final int index;
  final List<String> titles;
  final TabController controller;
  final Function(int index) callBack;

  MBManagerSymbolListTabBar({
    Key? key,
    required this.index,
    required this.titles,
    required this.controller,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: _getTabBarWidget()),
        ],
      ),
    );
  }

  Widget _getTabBarWidget() {
    return GestureDetector(
      child: Container(
        height: 44,
        child: TabBar(
          labelPadding: EdgeInsets.only(left: 12, right: 18),
          indicatorWeight: 3,
          indicatorColor: ZSColors.background(),
          // indicatorPadding: EdgeInsets.only(top: 40.5, left: 20 + 2, right: 28 + 2),
          indicator: BoxDecoration(
            color: ZSColors.main(),
            borderRadius: BorderRadius.circular(1),
          ),
          isScrollable: true,
          controller: controller,
          tabs: titles
              .asMap()
              .keys
              .map(
                (i) => GestureDetector(
                  onTap: () => callBack(i),
                  child: Container(
                    child: index == i ? _getSelectedTabBar(title: titles[i]) : _getNormalTab(title: titles[i]),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _getSelectedTabBar({required String title}) {
    return Tab(
      child: ZSLabel(
        text: title,
        color: ZSColors.fontMain(),
        fontWeight: FontWeight.w600,
        fontSize: fontSize16,
      ),
    );
  }

  Widget _getNormalTab({required String title}) {
    return Tab(
      child: ZSLabel(
        text: title,
        color: ZSColors.fontNormal(),
        fontSize: fontSize16,
      ),
    );
  }
}
