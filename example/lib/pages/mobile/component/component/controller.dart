import 'package:get/get.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/basic_button/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/basic_expandlabel/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/basic_icon/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/basic_image/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/basic_label/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/basic_progress/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/business_imagepicker/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_column/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_container/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_display/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_expand/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_list/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_row/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/container_stack/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/feedback_dialog/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/feedback_loading/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/feedback_modal/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/feedback_notify/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/feedback_toast/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/form_rate/index.dart';
import 'package:zs_design_flutter_example/pages/mobile/component/form_textfield/index.dart';

class MBComponentController extends GetxController {
  //////////////////////////// 属性 ////////////////////////////
  // List<Map<String, dynamic>>
  RxList<MBComponentModel> models = [MBComponentModel()].obs;

  String text = """
      return BaseScaffold(
        title: 'SMDesign组件',
        navBarColor: KColors.background(),
        backgroundColor: KColors.background(),
        child: CupertinoListView.builder(
          sectionCount: controller.models.value.length + 1,
          itemInSectionCount: (section) => _getItemInSectionCount(section: section),
          sectionBuilder: _buildSection,
          childBuilder: _buildItem,
          separatorBuilder: _buildSeparator,
          // controller: _scrollController,
        ),
    );
    """;

  //////////////////////////// 方法 ////////////////////////////

  void initDataSource() {
    var list = [
      {
        "title": '视图容器',
        "isExpand": true,
        // "list": ['ZSContainer', 'SMDisPlay', 'Column (系统)', 'Row (系统)', 'List (系统)', 'Expand (系统)', 'Stack (系统)'],
        "list": ['ZSContainer容器', 'ZSLayout布局'],
      },
      {
        "title": '基础组件',
        "isExpand": true,
        "list": ['ZSLabel标签', 'SMExpandLabel可展开标签', 'ZSIcon图标', 'ZSImage图片', 'ZSButton按钮', 'Progress进度条'],
      },
      {
        "title": '表单组件',
        "isExpand": true,
        "list": ['SMTextField输入框', 'Picker选择器', 'Rate评分', 'Search搜索'],
      },
      {
        "title": '反馈组件',
        "isExpand": true,
        "list": ['Modal', 'Dialog', 'Loading加载', 'Notify消息通知', 'Toast轻提示'],
      },
      {
        "title": 'Scaffold 导航',
        "isExpand": true,
        "list": ['Scaffold', 'Navigator'],
      },
      {
        "title": '业务组件',
        "isExpand": true,
        "list": ['K线图表', '图片选择'],
      }
    ];
    List<MBComponentModel> mds = list.map((value) => MBComponentModel.fromJson(json: value)).toList();
    models.value = mds;
  }

  @override
  void onInit() {
    super.onInit();
  }

  /*
   * @description   跳转到对应的页面
   * @param
   * @return
   * @author        jay
   * @time          2/24/22 5:54 PM
   */
  void onJumpToPage({required int section, required int row}) {
    switch (section) {
      case 0:
        if (row == 0) Get.to(MBContainerPage());
        if (row == 1) Get.to(MBDisplayPage());
        if (row == 2) Get.to(MBColumnPage());
        if (row == 3) Get.to(MBRowPage());
        if (row == 4) Get.to(MBListPage());
        if (row == 5) Get.to(MBExpandPage());
        if (row == 6) Get.to(MBStackPage());
        break;
      case 1:
        if (row == 0) Get.to(MBLabelPage());
        if (row == 1) Get.to(MBMBExpandLabelPage());
        if (row == 2) Get.to(MBIconPage());
        if (row == 3) Get.to(MBImagePage());
        if (row == 4) Get.to(MBButtonPage());
        if (row == 5) Get.to(MBProgressPage());
        break;
      case 2:
        if (row == 0) Get.to(MBTextFieldPage());
        if (row == 2) Get.to(MBRatePage());
        break;
      case 3:
        if (row == 0) Get.to(MBModalPage());
        if (row == 1) Get.to(MBDialogPage());
        if (row == 2) Get.to(MBLoadingPage());
        if (row == 3) Get.to(MBNotifyPage());
        if (row == 4) Get.to(MBToastPage());
        break;
      case 5:
        if (row == 1) Get.to(MBImagePickerPage());
        break;
      default:
        break;
    }
  }
}

class MBComponentModel {
  String? title;
  bool? isExpand;
  List<String>? list;
  MBComponentModel({this.title, this.isExpand, this.list});

  static MBComponentModel fromJson({required dynamic json}) {
    MBComponentModel model = MBComponentModel();
    model.title = json['title'];
    model.isExpand = json['isExpand'];
    model.list = json['list'];
    return model;
  }
}
