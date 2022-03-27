import 'package:flutter/material.dart';
import 'package:zs_design_flutter_example/components/refresh/refresh/easy_refresh.dart';

import 'footer.dart';
import 'header.dart';

class MBRefresh extends StatelessWidget {
  final List<Widget>? slivers;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoad;
  final EasyRefreshController? refreshController;
  const MBRefresh({
    Key? key,
    this.slivers,
    this.onRefresh,
    this.onLoad,
    this.refreshController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MBCustomHeader(),
      footer: MBCustomFooter(),
      controller: refreshController,
      slivers: slivers,
      onRefresh: onRefresh,
      onLoad: onLoad,
    );
  }
}
