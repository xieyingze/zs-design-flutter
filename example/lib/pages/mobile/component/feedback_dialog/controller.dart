import 'package:zs_design_flutter_example/common/index.dart';

class MBDialogController extends BaseController {
  String demo1Desc = """
      SMDialog.showConfirmDialog(
          content: '这是确认弹框这是确认弹框这是确认弹框',
          confirm: '确定',
          cancel: '取消',
        )
      """;

  String demo2Desc = """
      SMDialog.show(
          child: Container(
            width: 300,
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZSIcon(
                  data: Ionicons.checkmark_circle,
                  size: 80,
                  color: ZSColors.mainGreen(),
                ),
                ZSLabel(margin: EdgeInsets.only(top: 20), text: '提交成功'),
              ],
            ),
            decoration: BoxDecoration(
              color: ZSColors.card(),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        )
      """;
}
