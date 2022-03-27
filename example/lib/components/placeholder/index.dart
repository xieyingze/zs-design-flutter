import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/image.dart';
import 'package:zs_design_flutter_example/common/constant/images.dart';

enum CommonPlaceHolderStatus {
  nodata,
}

class CommonPlaceHolder extends StatelessWidget {
  final CommonPlaceHolderStatus status;
  final String? desc;
  final Widget? button;
  const CommonPlaceHolder({Key? key, this.status = CommonPlaceHolderStatus.nodata, this.desc, this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ZSScreen.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseImage(
            name: KImage.commonStatusNoData,
            width: 100,
          ),
          ZSLabel(
            margin: EdgeInsets.only(top: 16),
            text: _getStatusDesc(),
            fontSize: 13,
            color: ZSColors.fontNormal(),
          ),
          button ?? Container(),
        ],
      ),
    );
  }

  String _getStatusDesc() {
    switch (status) {
      case CommonPlaceHolderStatus.nodata:
        return desc ?? '暂无自选数据';
      default:
        return desc ?? '暂无自选数据';
    }
  }
}
