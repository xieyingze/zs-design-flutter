import 'package:flutter/material.dart';

import '../plugin/pluggable.dart';

typedef SMMenuItemCallBack = void Function(SMDebugPluggable?);

class SMMenuItem extends StatelessWidget {
  final SMDebugPluggable? pluginData;
  final SMMenuItemCallBack? callBack;
  const SMMenuItem({Key? key, this.pluginData, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callBack != null) {
          callBack!(pluginData);
        }
      },
      child: Container(
        width: 80,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Icon(
                  pluginData!.iconData,
                  size: 40,
                ),
                height: 40,
                width: 40),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(pluginData!.displayName, style: const TextStyle(fontSize: 12, color: Colors.black)),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26, width: 0.5),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

class IconCache {
  // 优化性能考虑
  static Map<String, Widget> _icons = Map();
  static Widget? icon({
    required SMDebugPluggable pluggableInfo,
  }) {
    if (!_icons.containsKey(pluggableInfo.name) && pluggableInfo.iconImageProvider != null) {
      final i = Image(image: pluggableInfo.iconImageProvider);
      _icons.putIfAbsent(pluggableInfo.name, () => i);
    } else if (!_icons.containsKey(pluggableInfo.name)) {
      return Container();
    }
    return _icons[pluggableInfo.name];
  }
}
