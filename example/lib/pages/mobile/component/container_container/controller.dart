import 'package:zs_design_flutter_example/common/index.dart';

class MBContainerController extends BaseController {
  String demo1Desc = """
      BaseContainer(
          margin: EdgeInsets.all(32),
          padding: EdgeInsets.all(32),
          onTap: () => {Alert.alertTip('点击BaseContainer')},
          child: Container(
            width: 80,
            height: 80,
            color: KColors.mainRed(),
          ),
        )
      """;

  String demo2Desc = """
      BaseContainer(
          margin: EdgeInsets.all(16),
          width: 120,
          height: 120,
          onTap: () => {Alert.alertTip('点击BaseContainer')},
          child: Icon(
            Ionicons.balloon_outline,
            size: 60,
          ),
          decoration: BoxDecoration(
            color: KColors.card(),
            border: Border.all(color: KColors.line(), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        )
      """;

  String demo3Desc = """
      BaseContainer(
          margin: EdgeInsets.all(16),
          width: 120,
          height: 120,
          onTap: () => {Alert.alertTip('点击BaseContainer')},
          child: Icon(
            Ionicons.balloon_outline,
            size: 60,
            color: KColors.white(),
          ),
          decoration: BoxDecoration(
            color: KColors.card(),
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.topRight, colors: [KColors.mainRed(), KColors.mainYellow()]),
            borderRadius: BorderRadius.circular(8),
          ),
          onHoverDecoration: BoxDecoration(
            color: KColors.card(),
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomLeft, colors: [KColors.mainRed(), KColors.mainYellow()]),
            borderRadius: BorderRadius.circular(8),
          ),
        )
        """;

  String demo4Desc = """
      BaseContainer(
              margin: EdgeInsets.all(16),
              width: 120,
              height: 120,
              onTap: () => {Alert.alertTip('点击BaseContainer')},
              child: Icon(
                Ionicons.balloon_outline,
                size: 60,
                color: KColors.white(),
              ),
              decoration: BoxDecoration(
                color: KColors.card(),
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.topRight, colors: [KColors.mainRed(), KColors.mainYellow()]),
                borderRadius: BorderRadius.circular(8),
              ),
              onHoverDecoration: BoxDecoration(
                color: KColors.card(),
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomLeft, colors: [KColors.mainRed(), KColors.mainYellow()]),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
      """;
}
