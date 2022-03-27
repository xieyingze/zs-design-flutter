import 'package:zs_design_flutter_example/common/index.dart';

class MBProgressController extends BaseController {
  String demo1Desc = """
       SMLinearProgress(
            alignment: MainAxisAlignment.center,
            percent: 0.6,
            lineHeight: 10,
            backgroundColor: ZSColors.line(),
            progressColor: ZSColors.main(),
            barRadius: Radius.circular(5),
            animation: true,
            widgetIndicator: ZSLabel(
              text: '60%',
              fontSize: 10,
              color: ZSColors.fontMain(),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
      """;

  String demo2Desc = """
      SMCircularProgress(
          radius: 80,
          percent: 0.6,
          animation: true,
          lineWidth: 10,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: ZSColors.line(),
          progressColor: ZSColors.main(),
        )
      """;
}
