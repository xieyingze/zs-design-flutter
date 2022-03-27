import 'package:zs_design_flutter_example/common/index.dart';

class MBExpandController extends BaseController {
  String demo1Desc = """
       Container(
          height: 80,
          child: Row(
            children: [
              Container(
                width: 100,
                color: KColors.mainRed(),
              ),
              Expanded(
                child: Container(
                  height: 80,
                  color: KColors.mainGreen(),
                ),
              ),
            ],
          ),
        )
      """;

  String demo2Desc = """
      Container(
          height: 80,
          child: Row(
            children: [
              Container(
                width: 100,
                color: KColors.mainRed(),
              ),
              Expanded(
                child: BaseText(
                  padding: EdgeInsets.all(8),
                  backgroundColor: KColors.card(),
                  text: '这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本这是文本',
                ),
              ),
            ],
          ),
        )
      """;
}
