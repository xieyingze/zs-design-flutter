import 'package:flutter/cupertino.dart';

class SplitHighLightText extends StatefulWidget {
  final String textContent;
  final String searchStr;
  final TextStyle textStyle;
  final TextStyle highTextStyle;

  const SplitHighLightText(
      {Key? key,
      required this.textContent,
      required this.highTextStyle,
      required this.searchStr,
      required this.textStyle})
      : super(key: key);

  @override
  SplitHighLightTextState createState() => new SplitHighLightTextState();
}

class SplitHighLightTextState extends State<SplitHighLightText> {
  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpanList = [];
    String searchContent = widget.searchStr.toLowerCase();
    String textContent = widget.textContent;
    String tempContent = textContent.toLowerCase();

    // 搜索内容不为空并且 显示内容中存在与搜索内容相同的文字
    if (searchContent.isEmpty == false && tempContent.contains(searchContent)) {
      List<Map> _strMapList = [];
      bool _isContains = true;
      while (_isContains) {
        int startIndex = tempContent.indexOf(searchContent);
        String showStr = textContent.substring(
            startIndex, startIndex + searchContent.length);
        Map _strMap;
        if (startIndex > 0) {
          String normalStr = textContent.substring(0, startIndex);
          _strMap = Map();
          _strMap['content'] = normalStr;
          _strMap['isHighlight'] = false;
          _strMapList.add(_strMap);
        }
        _strMap = Map();
        _strMap['content'] = showStr;
        _strMap['isHighlight'] = true;
        _strMapList.add(_strMap);

        textContent = textContent.substring(
            startIndex + searchContent.length, textContent.length);
        tempContent = tempContent.substring(
            startIndex + searchContent.length, tempContent.length);

        _isContains = tempContent.contains(searchContent);
        if (!_isContains && tempContent != '') {
          _strMap = Map();
          _strMap['content'] = textContent;
          _strMap['isHighlight'] = false;
          _strMapList.add(_strMap);
        }
      }
      _strMapList.forEach((map) {
        textSpanList.add(
          TextSpan(
              text: map['content'],
              style:
                  map['isHighlight'] ? widget.highTextStyle : widget.textStyle),
        );
      });
    } else {
      ///正常显示所有文字
      textSpanList.add(TextSpan(
        text: textContent,
        style: widget.textStyle,
      ));
    }
    return RichText(
      text: TextSpan(children: textSpanList),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
