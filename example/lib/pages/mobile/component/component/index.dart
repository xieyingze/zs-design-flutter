import 'package:cupertino_listview/cupertino_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/scaffold.dart';
import 'controller.dart';

import 'controller.dart';

class MBComponentPage extends GetView<MBComponentController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MBComponentController());

    controller.initDataSource();

    return BaseScaffold(
      title: 'SMDesign组件',
      navBarColor: ZSColors.background(),
      backgroundColor: ZSColors.background(),
      child: CupertinoListView.builder(
        sectionCount: controller.models.length + 1,
        itemInSectionCount: (section) => _getItemInSectionCount(section: section),
        sectionBuilder: _buildSection,
        childBuilder: _buildItem,
        separatorBuilder: _buildSeparator,
        // controller: _scrollController,
      ),
    );
  }

  int _getItemInSectionCount({required int section}) {
    switch (section) {
      case 0:
        return 1;
      default:
        return controller.models[section - 1].list?.length ?? 0;
    }
  }

  /*
   * @description   创建组头
   * @param
   * @return
   * @author        jay
   * @time          2/21/22 7:37 PM
   */
  Widget _buildSection(BuildContext context, SectionPath index, bool isFloating) {
    switch (index.section) {
      case 0:
        return Container(height: 1);
      default:
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: ZSColors.background(),
          height: 40,
          child: ZSLabel(
            text: controller.models[index.section - 1].title ?? '',
            fontWeight: FontWeight.w600,
            color: ZSColors.fontMain(),
          ),
        );
    }
  }

  /*
   * @description   创建item
   * @param
   * @return
   * @author        jay
   * @time          2/21/22 7:37 PM
   */
  Widget _buildItem(BuildContext context, IndexPath index) {
    switch (index.section) {
      case 0:
        return Container(
          padding: EdgeInsets.all(16),
          height: 150,
          color: ZSColors.background(),
          child: Column(
            children: [
              Icon(
                Ionicons.hardware_chip_outline,
                size: 60,
              ),
              ZSLabel(
                text: '以下展示的为公共组件及业务组件。组件的样式仅供参考，开发者可根据自身的需求来自定义自定义组件的样式。',
                fontSize: fontSize12,
              )
            ],
          ),
        );
      default:
        return ZSContainer(
          onTap: () => controller.onJumpToPage(section: index.section - 1, row: index.child),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 50,
          child: ZSLabel(
            text: controller.models[index.section - 1].list?[index.child] ?? '',
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ZSColors.card(),
          ),
          onHoverDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ZSColors.card(),
            boxShadow: [BoxShadow(color: ZSColors.shadow(), offset: Offset(0, 3), blurRadius: 10)],
          ),
        );
    }
  }

  /*
   * @description   创建分割线
   * @param
   * @return
   * @author        jay
   * @time          2/21/22 7:37 PM
   */
  Widget _buildSeparator(BuildContext context, IndexPath index) {
    return Container();
  }
}
