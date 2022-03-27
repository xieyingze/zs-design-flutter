import 'package:zs_design_flutter_example/common/constant/images.dart';
import 'package:zs_design_flutter_example/common/index.dart';

class MBMeController extends BaseController {
  List<List<dynamic>> list = [
    [
      {'icon': KImage.meLike, 'title': '收藏与历史'},
      {'icon': KImage.meFeedback, 'title': '意见与反馈'}
    ],
    [
      {'icon': KImage.meClear, 'title': '清除缓存'},
      {'icon': KImage.meAgreement, 'title': '用户协议'},
      {'icon': KImage.mePrivate, 'title': '隐私政策'}
    ],
    [
      {'icon': KImage.meSetting, 'title': '账号设置'}
    ]
  ];
}
