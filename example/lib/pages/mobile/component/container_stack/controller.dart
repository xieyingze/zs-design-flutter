import 'package:zs_design_flutter_example/common/index.dart';

class MBStackController extends BaseController {
  String demo1Desc = """
       Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: KColors.mainGreen(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: KColors.mainRed(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 40),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: KColors.mainBlu(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            )
          ],
        )
      """;

  String demo2Desc = """
      Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: KColors.mainGreen(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: KColors.mainRed(alpha: 0.5),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 40),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: KColors.mainBlu(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
              ),
            )
          ],
        )
      """;
}
