import 'package:get/get.dart';
import 'package:zs_design_flutter_example/common/index.dart';

class MBButtonController extends BaseController {
  var isLoading = false.obs;

  String demo1Desc = """
       Wrap(
          children: [ZSButtonType.normal, ZSButtonType.info, ZSButtonType.success, ZSButtonType.danger, ZSButtonType.warming]
              .map(
                (type) => ZSButton(
                  type: type,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  size: Size(120, 50),
                  title: '确定',
                  onTap: () => {},
                ),
              )
              .toList(),
        )
      """;

  String demo2Desc = """
      ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(200, 50),
          title: '确定',
          textColor: ZSColors.mainGreen(),
          normalColor: ZSColors.card(),
          borderColor: ZSColors.mainGreen(),
          highColor: ZSColors.background(),
          onTap: () => {},
        )
      """;

  String demo3Desc = """
      ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          type: ZSButtonType.info,
          enable: false,
          size: Size(200, 50),
          title: '禁用状态',
          highColor: Colors.blue,
          onTap: () => {},
        )
      """;

  String demo4Desc = """
      ZSButton(
              margin: EdgeInsets.symmetric(vertical: 16),
              type: ZSButtonType.info,
              size: Size(200, 50),
              title: '点击加载',
              loadingText: '加载中..',
              loading: true,
              highColor: Colors.blue,
              onTap: () => {},
            )
      """;

  String demo5Desc = """
      ZSButton(
          margin: EdgeInsets.symmetric(vertical: 16),
          size: Size(200, 50),
          title: '确定',
          iconData: Ionicons.logo_twitter,
          highColor: Colors.blue,
          onTap: () => {},
        )
      """;

  void onClickButton() {
    isLoading.value = true;
    Future.delayed(Duration(milliseconds: 2000), () {
      isLoading.value = false;
    });
  }
}
