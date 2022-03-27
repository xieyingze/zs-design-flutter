import 'package:zs_design_flutter_example/common/index.dart';

class MBTextFieldController extends BaseController {
  String demo1Desc = """
       SMTextField(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          padding: EdgeInsets.symmetric(horizontal: 16),
          hintText: '输入品种搜索',
          backgroundColor: ZSColors.card(),
          borderRadius: 4,
          fieldCallBack: (val) => {},
        )
      """;

  String demo2Desc = """
      SMTextField(
            clearDisplayMode: SMClearDisplayMode.always,
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 8),
            hintText: '输入品种搜索',
            fontSize: fontSize16,
            backgroundColor: ZSColors.card(),
            borderColor: ZSColors.line(),
            prefixIcon: Icon(Ionicons.search_outline, size: 20, color: ZSColors.fontMain()),
            suffixWidget: ZSIcon(
              data: Ionicons.eye_outline,
              size: 24,
            ),
            borderRadius: 4,
            fieldCallBack: (val) => {},
          )
      """;
}
