import 'package:zs_design_flutter_example/common/base/controller.dart';

class MBExpandLabelController extends BaseController {
  String demo1Desc = """
       SMExpandLabel(
            maxLines: 1,
            text: '以下展示的为公共组件及业务组件。组件的样式仅供参考，开发者可根据自身的需求来自定义自定义组件的样式。',
            color: ZSColors.main(),
            onExpanded: (val) => Alert.alertTip(val ? '展开' : '收起'),
          ),
      """;

  String demo2Desc = """
      Container(
              width: 200,
              child: SMExpandLabel(
                maxLines: 1,
                text: '以下展示的为公共组件及业务组件。组件的样式仅供参考，开发者可根据自身的需求来自定义自定义组件的样式。',
                color: ZSColors.main(),
                onExpanded: (val) => Alert.alertTip(val ? '展开' : '收起'),
              ),
            ),
      """;
}
