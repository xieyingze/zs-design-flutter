import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/manager/eventbus/index.dart';
import 'package:zs_design_flutter_example/library/debug/plugin/index.dart';
import 'package:zs_design_flutter_example/library/debug/plugin/pluggable.dart';

import '../manager/index.dart';
import '../utils/event.dart';
import '../utils/index.dart';
import 'info_menu.dart';
import 'info_message.dart';

/*
 * Debug日志面板
 */
typedef DebugLogInfoCallBack = Function(SMDebugPluggable? pluggable);

class SMDebugLogInfo extends StatefulWidget {
  final DebugLogInfoCallBack callBack;
  const SMDebugLogInfo({Key? key, required this.callBack}) : super(key: key);

  @override
  _SMDebugLogInfoState createState() => _SMDebugLogInfoState();
}

class _SMDebugLogInfoState extends State<SMDebugLogInfo> {
  // List<IconData> _menuImages = [
  //   Icons.bug_report,
  //   Icons.bug_report,
  //   Icons.bug_report,
  //   Icons.bug_report,
  //   Icons.bug_report,
  // ];
  // List<String> _menuTitles = [
  //   '性能日志',
  //   '页面渲染',
  //   '网络耗时',
  //   '崩溃日志',
  //   '运行报告',
  // ];
  // List<int> _environments = [0, 1, 2, 3];

  /// fps事件
  var _fpsEventBus;

  /// 是否显示切换环境
  bool _showSwitchEnv = false;

  /// 流畅度
  double _fps = 0;

  /// 数据源
  List<SMDebugPluggable?> _dataList = [];

  @override
  void initState() {
    super.initState();

    _handleData();

    _fpsEventBus = eventBusInstance.on<SMSystemFPSEvent>((event) {
      setState(() {
        _fps = event.fps;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _fpsEventBus?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    int networkErrorLength = 0;
    SMDebugManager.instance.networkModels.forEach((element) {
      if (element.isSuccess == false) {
        networkErrorLength += 1;
      }
    });
    double w = (ZSScreen.width - 32) / 4;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: 70,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SMDebugInfoMessage(widgets: []),
            ],
          ),
          SMDebugMenu(
            plugs: _dataList,
            callBack: (plug) => _onHandleMenuCallBack(pluggable: plug),
          )
        ],
      ),
    );
  }

  /*
   * @description:    点击底部菜单的事件
   * @param:          
   * @return:         
   * @author:         jay xie
   * @time:           3/25/22 12:12 AM
   */
  void _onHandleMenuCallBack({SMDebugPluggable? pluggable}) async {
    pluggable?.onTriggerEvent();
    if (pluggable?.isPushNextPage ?? false) {
      await Get.to(pluggable, transition: Transition.downToUp);
      widget.callBack(pluggable);
    }
  }

  /*
   * @description   处理数据
   * @param
   * @return
   * @author        jay
   * @time          3/24/22 5:56 PM
   */
  void _handleData() async {
    List<SMDebugPluggable?> dataList = [];
    dataList = SMPluginManager.instance.pluginsMap.values.toList();
    setState(() {
      _dataList = dataList;
    });
  }

  /*
   * @description   日志面板事件
   * @param
   * @return
   * @author        jay
   * @time          8/23/21 4:02 PM
   */
  // void _onHandleDebugLogInfoEvent({DebugLogInfoEvent? event}) {
  //   switch (event) {
  //     case DebugLogInfoEvent.debugPerformance:
  //       // RouteManager.push(context: context, path: '/debugPerformancePage');
  //       break;
  //     case DebugLogInfoEvent.debugPage:
  //       break;
  //     case DebugLogInfoEvent.debugNetwork:
  //       // RouteManager.push(context: context, path: '/debugNetworkPage');
  //       break;
  //     case DebugLogInfoEvent.debugDebug:
  //       // RouteManager.push(context: context, path: '/debugErrorPage');
  //       break;
  //     case DebugLogInfoEvent.debugReport:
  //       //
  //       break;
  //     case DebugLogInfoEvent.switchEnvironment:
  //       break;
  //     default:
  //       break;
  //   }
  // }

  /*
   * @description   切换网络环境
   * @param
   * @return
   * @author        jay
   * @time          8/23/21 4:04 PM
   */
  // Widget _getSwitchEnvironment() {
  //   return _showSwitchEnv
  //       ? Column(
  //           children: [
  //             Container(
  //               margin: EdgeInsets.only(top: 10),
  //               padding: EdgeInsets.all(8),
  //               height: 70,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: _environments
  //                     .asMap()
  //                     .keys
  //                     .map(
  //                       (index) => GestureDetector(
  //                         onTap: () {
  //                           switch (index) {
  //                             case 0:
  //                               // NetworkHost.instance.hostType = NetworkHostType.dev;
  //                               break;
  //                             case 1:
  //                               // NetworkHost.instance.hostType = NetworkHostType.stg;
  //                               break;
  //                             case 2:
  //                               // NetworkHost.instance.hostType = NetworkHostType.uat;
  //                               break;
  //                             case 3:
  //                               // NetworkHost.instance.hostType = NetworkHostType.prd;
  //                               break;
  //                             default:
  //                               break;
  //                           }
  //                           setState(() {
  //                             _showSwitchEnv = false;
  //                           });
  //                         },
  //                         child: Container(
  //                           width: (ZSScreen.width - 32 - 20 - 30) / 4,
  //                           height: 48,
  //                           alignment: Alignment.center,
  //                           child: ZSLabel(
  //                             text: 'dev',
  //                             fontSize: fontSize16,
  //                             fontWeight: FontWeight.w600,
  //                             color: ZSColors.fontMedium(),
  //                           ),
  //                           decoration: BoxDecoration(
  //                             color: ZSColors.card(),
  //                             borderRadius: BorderRadius.circular(4),
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                     .toList(),
  //               ),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(8),
  //                 color: ZSColors.card(),
  //                 boxShadow: [
  //                   BoxShadow(color: ZSColors.darkShadow(), offset: Offset(0, 2), blurRadius: 6),
  //                 ],
  //               ),
  //             ),
  //             ZSLabel(
  //               text: '切换环境请杀掉app进程重进',
  //               color: ZSColors.fontMedium(),
  //               fontSize: fontSize12,
  //               margin: EdgeInsets.only(top: 16),
  //             ),
  //           ],
  //         )
  //       : Container();
  // }
}
