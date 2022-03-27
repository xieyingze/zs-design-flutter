import 'package:zs_design_flutter_example/common/index.dart';

class MBRowController extends BaseController {
  String demo1Desc = """
       List<MainAxisAlignment> list = [
        MainAxisAlignment.start,
        MainAxisAlignment.center,
        MainAxisAlignment.end,
        MainAxisAlignment.spaceBetween,
        MainAxisAlignment.spaceAround,
        MainAxisAlignment.spaceEvenly,
      ];
      // 实现
      Column(
        children: list
            .map(
              (element) => Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    height: 120,
                    color: KColors.card(),
                    child: Row(
                      mainAxisAlignment: element,
                      children: List.generate(
                          3,
                          (index) => Container(
                                margin: EdgeInsets.only(top: 1),
                                width: 80,
                                height: 20,
                                color: KColors.mainBlu(),
                              )),
                    ),
                  ),
                  BaseText(
                    text: '\${element.toString()}',
                    margin: EdgeInsets.all(8),
                    fontSize: fontSize10,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            )
            .toList(),
      )
      """;

  String demo2Desc = """
      List<CrossAxisAlignment> list = [
        CrossAxisAlignment.start,
        CrossAxisAlignment.center,
        CrossAxisAlignment.end,
        CrossAxisAlignment.stretch,
      ];
      // 实现
      Column(
        children: list
            .map(
              (element) => Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    height: 120,
                    color: KColors.card(),
                    child: Row(
                      // mainAxisAlignment: element,
                      crossAxisAlignment: element,
                      children: List.generate(
                          3,
                          (index) => Container(
                                margin: EdgeInsets.only(top: 1),
                                width: 80,
                                height: 20,
                                color: KColors.mainBlu(),
                              )),
                    ),
                  ),
                  BaseText(
                    text: '\${element.toString()}',
                    margin: EdgeInsets.all(8),
                    fontSize: fontSize10,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            )
            .toList(),
      )
      """;
}
