import 'package:flutter/material.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/manager/components/sectionlist_cell.dart';
import 'package:zs_design_flutter_example/pages/mobile/module/manager/components/sectionlist_title.dart';

import 'sectionlist_bottom.dart';

class MBMarketManagerSectionList extends StatelessWidget {
  const MBMarketManagerSectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MBManagerSectionListTitle(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => MBManagerSectionListCell(),
            itemCount: 100,
          ),
        ),
        MBManagerSectionListBottom(),
      ],
    );
  }
}
