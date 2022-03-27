import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class BaseSegment extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final List<String> titles;
  final int currentIndex;
  final Function(int index) callBack;
  BaseSegment({
    Key? key,
    this.margin,
    this.width,
    required this.titles,
    required this.currentIndex,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: (width ?? 80) * titles.length + 4,
      padding: EdgeInsets.all(2),
      child: Row(
        children: titles
            .asMap()
            .keys
            .map(
              (index) => GestureDetector(
                onTap: () => callBack(index),
                child: Container(
                  alignment: Alignment.center,
                  width: width ?? 80,
                  child: ZSLabel(
                    text: titles[index],
                    color: currentIndex == index ? ZSColors.fontMain() : ZSColors.fontNormal(),
                  ),
                  decoration: BoxDecoration(
                    color: currentIndex == index ? ZSColors.card() : ZSColors.background(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      decoration: BoxDecoration(
        color: ZSColors.background(),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
