import 'package:flutter/material.dart';

import '../../../../../main.dart';

class MBKrakenAnimation extends StatefulWidget {
  @override
  _MBKrakenAnimationState createState() => _MBKrakenAnimationState();
}

class _MBKrakenAnimationState extends State<MBKrakenAnimation> with TickerProviderStateMixin {
  var w = 100.0;
  var h = 80.0;

  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    // 创建一个插值器，关联 AnimationController，返回一个新的 Animation 对象
    _animation1 = Tween<double>(begin: w, end: w * 2.0).animate(_animationController);
    _animation2 = Tween<double>(begin: h, end: h * 3.0).animate(_animationController);

    _animationController.addListener(() {
      // 当动画更新时会调用
      // 需要在这个函数中，调用 setState() 来触发视图刷新
      logger.d('------------ ${_animation1.value}  ------${_animation1.value}');
      setState(() {});
    });
    // 开始播放动画
    _animationController.forward();
  }

  @override
  void dispose() {
    // 动画使用完成后必需要销毁
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // 获取插值器计算出的 value
      // 作为属性值
      width: _animation1.value,
      height: _animation2.value,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
