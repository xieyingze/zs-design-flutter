import 'package:zs_design_flutter_example/common/index.dart';

class MBListController extends BaseController {
  String demo1Desc = """
       ListView(
        children: List.generate(
            3,
            (index) => Container(
                  margin: EdgeInsets.only(top: 8),
                  height: 40,
                  color: KColors.mainBlu(),
                )),
      )
      """;

  String demo2Desc = """
      ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(top: 8),
          height: 40,
          color: KColors.mainBlu(),
        ),
        // itemCount: 100,
      )
      """;
}
