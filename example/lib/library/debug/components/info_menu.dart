import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/library/debug/plugin/pluggable.dart';

import 'info_menu_item.dart';

class SMDebugMenu extends StatefulWidget {
  final SMMenuItemCallBack callBack;
  final List<SMDebugPluggable?> plugs;
  const SMDebugMenu({Key? key, required this.plugs, required this.callBack}) : super(key: key);

  @override
  _SMDebugMenuState createState() => _SMDebugMenuState();
}

class _SMDebugMenuState extends State<SMDebugMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ZSScreen.bottomFix + 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.plugs
            .asMap()
            .keys
            .map((index) => SMMenuItem(
                  pluginData: widget.plugs[index],
                  callBack: (pluggable) => widget.callBack(pluggable),
                ))
            .toList(),
      ),
    );
  }
}
