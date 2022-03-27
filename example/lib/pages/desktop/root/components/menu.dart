import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/components/avatar/index.dart';

class DTRootMenu extends StatefulWidget {
  final int menuIndex;
  final Function(int index) callBack;
  DTRootMenu({Key? key, required this.menuIndex, required this.callBack}) : super(key: key);

  @override
  _DTRootMenuState createState() => _DTRootMenuState();
}

class _DTRootMenuState extends State<DTRootMenu> {
  List<Map<String, dynamic>> _menuList = [
    {'icon': Ionicons.earth},
    {'icon': Ionicons.settings_outline},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: 60,
      color: ZSColors.fontMain(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BaseAvatar(
                size: 36,
              ),
              _getMenuListWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getMenuListWidget() {
    return ZSLayout(
      margin: EdgeInsets.only(top: 40),
      type: ZSLayoutType.column,
      children: _menuList
          .asMap()
          .keys
          .map((index) => GestureDetector(
                onTap: () => widget.callBack(index),
                child: Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Icon(
                    _menuList[index]['icon'],
                    size: 28,
                    color: ZSColors.white(alpha: widget.menuIndex == index ? 1 : 0.5),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
