import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';
import 'package:zs_design_flutter_example/common/base/line.dart';
import 'package:zs_design_flutter_example/common/base/state.dart';

import '../controller.dart';

class DTHomeCenterList extends GetView<DTHomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DTHomeController());

    return Container(
      color: ZSColors.card(),
      child: ListView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () => {},
              child: Container(
                padding: EdgeInsets.all(16),
                color: ZSColors.background(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZSLabel(
                          text: '--',
                          color: ZSColors.fontMedium(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          width: 60,
                          height: 20,
                          alignment: Alignment.center,
                          child: ZSLabel(
                            text: '--',
                            color: ZSColors.white(),
                            fontSize: fontSize12,
                          ),
                          decoration: BoxDecoration(
                            color: ZSColors.mainGreen(),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        _getStatusWidget(state: WidgetState.success),
                        ZSLabel(
                          margin: const EdgeInsets.only(left: 8),
                          textAlign: TextAlign.right,
                          width: 60,
                          text: '--' + 'ms',
                          color: ZSColors.fontMedium(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            CommonLine(height: 1),
          ],
        ),
        itemCount: 1,
      ),
    );
  }

  Widget _getStatusWidget({required WidgetState state}) {
    switch (state) {
      case WidgetState.busy:
        return Container(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ZSColors.fontNormal()),
          ),
        );
      case WidgetState.error:
        return Icon(
          Icons.error,
          size: 20,
          color: ZSColors.mainRed(),
        );
      case WidgetState.success:
        return Icon(
          Icons.check_circle,
          size: 20,
          color: ZSColors.mainGreen(),
        );
      default:
        return Container();
    }
  }
}
