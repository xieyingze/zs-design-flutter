import 'package:zs_design_flutter_example/common/index.dart';

class MBLabelController extends BaseController {
  String demo1Desc = """
       ZSLabel(
          padding: EdgeInsets.all(16),
          maxLines: 2,
          text: '以下展示的为公共组件及业务组件。组件的样式仅供参考，开发者可根据自身的需求来自定义自定义组件的样式。',
          color: ZSColors.main(),
          fontSize: fontSize16,
        )
      """;

  String demo2Desc = """
      ZSLabel(
          width: 300,
          height: 40,
          text: '以下展示的为公共组件及业务组件。组件的样式仅供参考，开发者可根据自身的需求来自定义自定义组件的样式。',
          color: ZSColors.main(),
          fontSize: fontSize16,
        )
      """;
}
