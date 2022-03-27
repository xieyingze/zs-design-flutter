import 'package:zs_design_flutter_example/common/index.dart';

class MBModalController extends BaseController {
  // ShakeAnimationController controller = ShakeAnimationController();

  String demo1Desc = """
      SMModal.showActionSheet(
            items: ['苹果', '香蕉🍌', '橙子🍊', '西瓜🍉', '葡萄🍇'],
            cancel: '取消',
          );
      """;

  String demo2Desc = """
      SMModal.show(
          child: Container(
            width: double.infinity,
            height: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZSIcon(
                  data: Ionicons.checkmark_circle,
                  size: 80,
                  color: ZSColors.mainGreen(),
                ),
                ZSLabel(margin: EdgeInsets.only(top: 20, bottom: 80), text: '提交成功'),
              ],
            ),
            decoration: BoxDecoration(
              color: ZSColors.card(),
              borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            ),
          ),
        )
      """;
}
