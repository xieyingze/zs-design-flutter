// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:sm_mobile_design/common/base/text.dart';
// import 'package:sm_mobile_design/common/constant/colors.dart';
//
// ///点击事件
// typedef void OnClickCallBack();
// typedef void OnCompleteCallBack();
//
// // ignore: must_be_immutable
// class CountDownButton extends StatefulWidget {
//   final double fontSize;
//   final FontWeight? fontWeight;
//   final OnClickCallBack? onClickCallBack;
//   final OnCompleteCallBack? onCompleteCallBack;
//   bool enable;
//   final bool matchRegex; // 是否匹配正则表达式
//   bool startTimer;
//
//   CountDownButton({
//     Key? key,
//     this.fontSize = 17,
//     this.fontWeight,
//     this.onClickCallBack,
//     this.enable = true,
//     this.matchRegex = true,
//     this.startTimer = false,
//     this.onCompleteCallBack,
//   }) : super(key: key);
//
//   @override
//   _CountDownButtonState createState() => _CountDownButtonState();
// }
//
// class _CountDownButtonState extends State<CountDownButton> {
//   int _countTime = 60;
//
//   // 定时器
//   Timer? _timer;
//
//   // 倒计时描述
//   String _countingText = "获取验证码";
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _timer = null;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.startTimer && _timer == null) {
//       _countingText = '59 s';
//       _startTimer();
//     }
//     return GestureDetector(
//       onTap: (widget.enable && !widget.startTimer)
//           ? () {
//               widget.enable = false;
//               widget.startTimer = true;
//               if (widget.onClickCallBack != null) widget.onClickCallBack!();
//             }
//           : null,
//       child: Container(
//         height: 35,
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         decoration: BoxDecoration(
//           color: KColors.main().withAlpha(50),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: BaseText(
//           text: _countingText,
//           color: widget.startTimer ? KColors.main(alpha: 400) : (widget.enable ? KColors.main() : KColors.main(alpha: 400)),
//           fontSize: widget.fontSize,
//           fontWeight: widget.fontWeight ?? FontWeight.normal,
//         ),
//       ),
//     );
//   }
//
//   void _startTimer() {
//     if (!widget.enable) {
//       return;
//     }
//     if (!widget.matchRegex) {
//       return;
//     }
//     widget.enable = false;
//
//     _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
//       setState(() {
//         _countTime -= 1;
//         if (_countTime == 0) {
//           _countTime = 60;
//           widget.enable = true;
//           widget.startTimer = false;
//           _countingText = "获取验证码";
//           if (widget.onCompleteCallBack != null) widget.onCompleteCallBack!();
//           _cancelTimer();
//         } else {
//           widget.enable = false;
//           _countingText = '$_countTime s';
//         }
//       });
//     });
//   }
//
//   void _cancelTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }
// }
