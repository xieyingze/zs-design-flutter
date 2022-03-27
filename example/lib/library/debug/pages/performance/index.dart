import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'package:zs_design_flutter_example/library/debug/manager/index.dart';
import 'package:zs_design_flutter_example/library/debug/models/fps.dart';

class DebugPerformancePage extends StatefulWidget {
  @override
  _DebugPerformancePageState createState() => _DebugPerformancePageState();
}

class _DebugPerformancePageState extends State<DebugPerformancePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: '性能日志',
      leftWidget: ZSIcon(data: Icons.arrow_back_ios, size: 24, onTap: () => Get.back()),
      backgroundColor: ZSColors.card(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SfCartesianChart(
              plotAreaBorderWidth: 20,
              plotAreaBorderColor: ZSColors.clear(),
              title: ChartTitle(text: ''),
              legend: Legend(isVisible: false, overflowMode: LegendItemOverflowMode.wrap),
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                labelAlignment: LabelAlignment.start,
                labelStyle: TextStyle(
                  fontSize: fontSize10,
                ),
              ),
              // '\${value}%'
              primaryYAxis: NumericAxis(
                  rangePadding: ChartRangePadding.none,
                  labelFormat: '{value}',
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(color: ZSColors.clear())),
              series: _getDefaultLineSeries(),
              trackballBehavior: TrackballBehavior(
                enable: true,
                activationMode: ActivationMode.singleTap,
                tooltipSettings: InteractiveTooltip(format: 'point.x : point.y', borderWidth: 0),
                // tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                // markerSettings: TrackballMarkerSettings(borderColor: KColors.mainGreen, width: 60, height: 160, shape: DataMarkerType.none),
                lineWidth: 0.5,
                // builder: (context, detail) {
                //   AnalysisChartGainTrendSubModel m = widget.model.data[detail.groupingModeInfo.currentPointIndices.first];
                //   _date = '(${m.getYearMonthDay})';
                //   _rate = '${(m.gain * 100).toString().formatterDigital()} %';
                //   _rateColor = m.gain >= 0 ? KColors.mainGreenColor() : KColors.mainRedColor();
                //   _numberItemModel = ProfitRateChartNumberItemModel(rate: _rate, rateColor: _rateColor, date: _date);
                //   eventBusInstance.emit(ProfitRateChartNumberEvent(_numberItemModel));
                //   return Container(
                //     width: 10,
                //     height: 10,
                //     color: KColors.clear,
                //   );
                // },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ZSColors.mainGreen, ZSColors.mainYellow(), ZSColors.mainRed()]
                  .asMap()
                  .keys
                  .map((index) => Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: [ZSColors.mainGreen(), ZSColors.mainYellow(), ZSColors.mainRed()][index],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            ZSLabel(
                              margin: EdgeInsets.only(left: 4),
                              text: ['流畅:55~60 fps | 良好: 30~54 fps', '轻微卡顿:15~29 fps', '卡顿:小于15fps'][index],
                              fontSize: fontSize12,
                              color: ZSColors.fontMain(),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  List<LineSeries<ProfitRateChartData, String>> _getDefaultLineSeries() {
    final List<ProfitRateChartData> chartData = [];

    if (SMDebugManager.instance.fpsModels.length > 0) {
      SMDebugManager.instance.fpsModels.forEach((element) {
        chartData.add(ProfitRateChartData(x: element.getDate, y1: element.fps?.toInt()));
      });
    }

    return <LineSeries<ProfitRateChartData, String>>[
      LineSeries<ProfitRateChartData, String>(
        // color: _getFpsColor(fps: sales.y1),
        pointColorMapper: (ProfitRateChartData sales, _) => _getFpsColor(fps: sales.y1 ?? 0),
        dataSource: chartData,
        xValueMapper: (ProfitRateChartData sales, _) => sales.x,
        yValueMapper: (ProfitRateChartData sales, _) => sales.y1,
      ),
    ];
  }

  Color _getFpsColor({required num fps}) {
    /**
     * 流畅：55~60 fps
     * 良好: 30~54 fps
     * 轻微卡顿: 15~29 fps
     * 卡顿: 小于15fps
     */
    if (fps >= 30) {
      return ZSColors.mainGreen();
    } else if (fps >= 15) {
      return ZSColors.mainYellow();
    } else {
      return ZSColors.mainRed();
    }
  }
}

class ProfitRateChartData {
  ProfitRateChartData({this.x, this.y1, this.y2});

  String? x;
  num? y1;
  num? y2;
}
