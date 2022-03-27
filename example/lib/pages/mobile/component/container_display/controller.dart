import 'package:get/get.dart';
import 'package:zs_design_flutter_example/common/index.dart';
import 'package:zs_design_flutter_example/common/utils/alert.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_column/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_list/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_row/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_stack/index.dart';

class MBDisplayController extends BaseController {
  List<String> list = ['Column', 'Row', 'Wrap', 'Stack', 'ListView'];

  String demo1Desc = """
       SMDisplay(
          type: SMDisplayType.column,
          children: [KColors.mainGreen(alpha: 0.5), KColors.mainRed(alpha: 0.5), KColors.mainBlu(alpha: 0.5)]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 20,
                  color: color,
                ),
              )
              .toList(),
        )
      """;

  String demo2Desc = """
     SMDisplay(
          type: SMDisplayType.row,
          children: [KColors.mainGreen(alpha: 0.5), KColors.mainRed(alpha: 0.5), KColors.mainBlu(alpha: 0.5)]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 20,
                  color: color,
                ),
              )
              .toList(),
        )
      """;

  String demo3Desc = """
     SMDisplay(
          type: SMDisplayType.wrap,
          children: [
            KColors.mainGreen(alpha: 0.5),
            KColors.mainRed(alpha: 0.5),
            KColors.mainBlu(alpha: 0.5),
            KColors.mainGreen(alpha: 0.5),
            KColors.mainRed(alpha: 0.5),
            KColors.mainBlu(alpha: 0.5),
            KColors.mainGreen(alpha: 0.5),
            KColors.mainRed(alpha: 0.5),
            KColors.mainBlu(alpha: 0.5),
          ]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 20,
                  color: color,
                ),
              )
              .toList(),
        )
      """;

  String demo4Desc = """
     SMDisplay(
          type: SMDisplayType.stack,
          children: [
            KColors.mainGreen(alpha: 0.5),
            KColors.mainRed(alpha: 0.5),
            KColors.mainBlu(alpha: 0.5),
          ]
              .asMap()
              .keys
              .map(
                (index) => Container(
                  margin: EdgeInsets.only(top: (30 * double.parse(index.toString()))),
                  width: 80,
                  height: 40,
                  color: [
                    KColors.mainGreen(alpha: 0.5),
                    KColors.mainRed(alpha: 0.5),
                    KColors.mainBlu(alpha: 0.5),
                  ][index],
                ),
              )
              .toList(),
        )
      """;

  String demo5Desc = """
     SMDisplay(
          type: SMDisplayType.list,
          listWidth: double.infinity,
          listHeight: 200,
          children: [
            KColors.mainGreen(alpha: 0.5),
            KColors.mainRed(alpha: 0.5),
            KColors.mainBlu(alpha: 0.5),
            KColors.mainGreen(alpha: 0.5),
            KColors.mainRed(alpha: 0.5),
            KColors.mainBlu(alpha: 0.5),
            KColors.mainGreen(alpha: 0.5),
            KColors.mainRed(alpha: 0.5),
            KColors.mainBlu(alpha: 0.5),
          ]
              .map(
                (color) => Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 80,
                  height: 30,
                  color: color,
                ),
              )
              .toList(),
        )
      """;

  void onJumpToNextPage({required int index}) {
    if (index == 0) Get.to(MBColumnPage());
    if (index == 1) Get.to(MBRowPage());
    if (index == 2) Alert.alertError('尚未开发');
    if (index == 3) Get.to(MBStackPage());
    if (index == 4) Get.to(MBListPage());
  }
}
