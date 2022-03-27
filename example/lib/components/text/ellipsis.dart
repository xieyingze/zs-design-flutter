import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/* 
 * @description: 带省略号,全文,可点击的文本
 * @author: Zane Zhao
 */
class MBEllipsisText extends StatefulWidget {
  /// 文本
  final String text;

  /// 省略号后面的文字
  final String allText;

  /// 文本style
  final TextStyle textStyle;

  /// 省略号后面的文字样式
  final TextStyle allTextStyle;

  /// 最大行数
  final int maxLines;

  /// 点击事件
  final VoidCallback? onAllClick;

  MBEllipsisText(
    this.text,
    this.allText,
    this.maxLines, {
    Key? key,
    this.textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 17,
    ),
    this.allTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 17,
    ),
    this.onAllClick,
  }) : super(key: key);

  @override
  State<MBEllipsisText> createState() => _MBEllipsisTextState();
}

class _MBEllipsisTextState extends State<MBEllipsisText> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        if (widget.onAllClick != null) widget.onAllClick!();
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final linkSpan = TextSpan(
      text: '\u2026',
      style: widget.textStyle,
      children: <TextSpan>[
        TextSpan(
          text: widget.allText,
          style: widget.allTextStyle,
          recognizer: _tapGestureRecognizer,
        )
      ],
    );
    final linkTp = TextPainter(
        text: linkSpan,
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr);
    linkTp.layout(maxWidth: MediaQuery.of(context).size.width);
    final linkWidth = linkTp.width;

    final span = TextSpan(text: widget.text, style: widget.textStyle);
    final tp = TextPainter(
        text: span,
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr);
    tp.layout(maxWidth: MediaQuery.of(context).size.width);

    final textSize = tp.size;
    final position = tp.getPositionForOffset(Offset(
      textSize.width - linkWidth,
      textSize.height,
    ));
    final endOffset = tp.getOffsetBefore(position.offset);

    return tp.didExceedMaxLines
        ? Container(
            padding: const EdgeInsets.only(top: 9),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: widget.text.substring(0, endOffset),
                      style: widget.textStyle),
                  linkSpan
                ],
              ),
              style: widget.textStyle,
              maxLines: widget.maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          )
        : Container(
            padding: const EdgeInsets.only(top: 9),
            child: Text(
              widget.text,
              style: widget.textStyle,
              maxLines: widget.maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          );
  }
}
