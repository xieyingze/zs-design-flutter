import 'package:get/get.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/component/controller.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/getx/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/keybord/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/third_animatedo/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/third_carousel/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/third_leftactions/index.dart';

class MBModuleController extends GetxController {
  //////////////////////////// 属性 ////////////////////////////
  RxList<MBComponentModel> models = [MBComponentModel()].obs;

  //////////////////////////// 方法 ////////////////////////////
  void initDataSource() {
    var list = [
      {
        "title": '状态管理',
        "isExpand": true,
        "list": ['GetX'],
      },
      {
        "title": '键盘处理',
        "isExpand": true,
        "list": ['处理键盘遮挡', '处理点击空白键盘消失'],
      },
      {
        "title": '第三方库',
        "isExpand": true,
        "list": [
          'flutter_staggered_grid_view',
          'flutter_slidable',
          'left_scroll_actions',
          'smooth_page_indicator',
          'carousel_slider',
          'animate_do',
          'simple_animations',
          'spring',
          'photo_view',
        ],
      },
    ];
    List<MBComponentModel> mds = list.map((value) => MBComponentModel.fromJson(json: value)).toList();
    models.value = mds;
  }

  @override
  void onInit() {
    super.onInit();
  }

  /*
   * @description   跳转到对应的页面\
   *
   *
   * @param
   * @return
   * @author        jay
   * @time          2/24/22 5:54 PM
   */
  void onJumpToPage({required int section, required int row}) {
    switch (section) {
      case 0:
        if (row == 0) Get.to(MBGetXPage());
        break;
      case 1:
        if (row == 0) Get.to(MBKeyBoardPage());
        break;
      case 2:
        if (row == 0) Get.to(MBLeftActionsPage());
        if (row == 1) Get.to(MBCarouselSliderPage());
        if (row == 2) Get.to(MBAnimationDoPage());

        break;
      default:
        break;
    }
  }
}
