import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/common/manager/eventbus/index.dart';

import '../../manager/index.dart';
import '../../models/api.dart';
import '../../utils/event.dart';
import 'components/cell.dart';
import 'components/expand.dart';

class DebugNetworkPage extends StatefulWidget {
  @override
  _DebugPerformancePageState createState() => _DebugPerformancePageState();
}

class _DebugPerformancePageState extends State<DebugNetworkPage> {
  List<String> _filters = [];
  List<DebugApiModel> _models = [];
  List<DebugApiModel> _originModels = [];
  int _segmentIndex = 0;

  String _max = '-';
  String _min = '-';
  String _average = '-';

  bool _isCalculating = false;

  var _eventBus;

  @override
  void initState() {
    super.initState();

    if (_models.length == 0) {
      _models = SMDebugManager.instance.networkModels.reversed.toList();
      // 统计
      _onHandleCalculate(arr: _models);
      setState(() {});
    }

    _eventBus = eventBusInstance.on<DebugLogToolsEvent>((event) {
      if (_isCalculating) return;
      _originModels = event.models.reversed.toList();
      List<DebugApiModel> arr = [];
      if (_filters.length > 0) {
        event.models.reversed.toList().forEach((element) {
          if (_filters.contains(element.reqUrl) == false) {
            if (_segmentIndex == 1) {
              if (element.reqType == 'Intrade') {
                arr.add(element);
              }
            } else if (_segmentIndex == 2) {
              if (element.reqType == 'CRM') {
                arr.add(element);
              }
            } else {
              arr.add(element);
            }
          }
        });
      } else {
        // arr = event.models.reversed.toList();
        event.models.reversed.toList().forEach((element) {
          if (_segmentIndex == 1) {
            if (element.reqType == 'Intrade') {
              arr.add(element);
            }
          } else if (_segmentIndex == 2) {
            if (element.reqType == 'CRM') {
              arr.add(element);
            }
          } else {
            arr.add(element);
          }
        });
      }

      // 统计
      _onHandleCalculate(arr: arr);

      setState(() {
        _models = arr;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _eventBus?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: '网络耗时',
      leftWidget: ZSIcon(data: Icons.arrow_back_ios, size: 24, onTap: () => Get.back()),
      backgroundColor: ZSColors.card(),
      rightWidget: Row(
        children: [
          ZSContainer(
            margin: EdgeInsets.only(right: 8),
            onTap: () {
              SMDebugManager.instance.networkModels = [];
              _models = [];
              setState(() {});
            },
            child: Icon(
              Icons.delete_outline,
              size: 24,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZSLabel(
                  text: '最高耗时：$_max',
                  color: ZSColors.fontMain(),
                  fontSize: fontSize12,
                ),
                ZSLabel(
                  text: '最低耗时：$_min',
                  color: ZSColors.fontMain(),
                  fontSize: fontSize12,
                ),
                ZSLabel(
                  text: '平均耗时：$_average',
                  color: ZSColors.fontMain(),
                  fontSize: fontSize12,
                ),
              ],
            ),
          ),
          // CommonSegment(
          //   currentIndex: _segmentIndex,
          //   titles: ['全部', 'Intrade', 'CRM'],
          //   onTap: (index) {
          //     _isCalculating = true;
          //     List<DebugNetworkModel> arr = [];
          //     _originModels.forEach((element) {
          //       if (index == 1) {
          //         if (element.reqType == 'Intrade') {
          //           arr.add(element);
          //         }
          //       } else if (index == 2) {
          //         if (element.reqType == 'CRM') {
          //           arr.add(element);
          //         }
          //       } else {
          //         arr.add(element);
          //       }
          //     });
          //
          //     // 统计
          //     _onHandleCalculate(arr: arr);
          //
          //     setState(() {
          //       _models = arr;
          //       _segmentIndex = index;
          //     });
          //     _isCalculating = false;
          //   },
          // ),
          Expanded(
            child: ListView(
              children: _models
                  .map(
                    (model) => Column(
                      children: [
                        DebugNetworkCell(
                          model: model,
                          callBack: (event, model) => _onHandleCellEvent(event: event, model: model),
                        ),
                        model.isExpand
                            ? DebugNetworkExpand(
                                model: model,
                                onTap: () => _onHandleCellEvent(event: DebugNetworkCellEvent.filter, model: model),
                              )
                            : Container(),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _onHandleCellEvent({required DebugNetworkCellEvent event, DebugApiModel? model}) {
    switch (event) {
      case DebugNetworkCellEvent.expand:
        {
          model?.isExpand = !model.isExpand;
          setState(() {});
        }
        break;
      case DebugNetworkCellEvent.filter:
        if (_filters.contains(model?.reqUrl ?? '') == false) {
          _filters.add(model?.reqUrl ?? '');
        }
        List<DebugApiModel> arr = [];
        if (_filters.length > 0) {
          _models.forEach((element) {
            if (_filters.contains(element.reqUrl) == false) {
              arr.add(element);
            }
          });
        }
        setState(() {
          _models = arr;
        });
        break;
      default:
        break;
    }
  }

  void _onHandleCalculate({required List<DebugApiModel> arr}) {
    num total = 0;
    num? max = arr.length > 0 ? arr.first.responseTime : 0;
    num? min = arr.length > 0 ? arr.first.responseTime : 0;
    num count = 0;
    arr.forEach((element) {
      if (element.reqUrl?.contains('user/auth/status') == false) {
        // 不统计
        total += element.responseTime ?? 0;
        count += 1;
        max = (max ?? 1) < (element.responseTime ?? 0) ? element.responseTime : max;
        min = (min ?? 0) > (element.responseTime ?? 0) ? element.responseTime : min;
      }
    });
    _max = max.toString() + 'ms';
    _min = min.toString() + 'ms';
    _average = (total / count).toString() + 'ms';
  }
}
