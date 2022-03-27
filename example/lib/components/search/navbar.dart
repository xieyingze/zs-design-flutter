import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zs_design_flutter_example/common/constant/images.dart';
import 'package:zs_design_flutter_example/common/index.dart';

class CommonSearchNavBar extends StatefulWidget {
  /// 提示文字
  final String? hintLabel;

  /// 回调
  final Function? callback;

  /// 点击了提交的回调
  final Function? onSubmit;

  CommonSearchNavBar({
    Key? key,
    this.hintLabel,
    this.callback,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CommonSearchNavBarState();
  }
}

class CommonSearchNavBarState extends State<CommonSearchNavBar> {
  late FocusNode _focusNode;

  ///默认不展示控件

  bool _offstage = true;

  ///监听TextField内容变化
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController.addListener(() {
      if (widget.callback != null) {
        widget.callback!(_textEditingController.text);
      }
      var isVisible = _textEditingController.text.isNotEmpty;
      _updateDelIconVisible(isVisible);
    });
  }

  _updateDelIconVisible(bool isVisible) {
    setState(() {
      _offstage = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(6)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _textEditingController,
                    autofocus: true,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: "搜索感兴趣的内容",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    onSubmitted: (text) {
                      if (widget.onSubmit != null) widget.onSubmit!(text);
                    },
                  ),
                ),
                Offstage(
                  offstage: _offstage,
                  child: GestureDetector(
                    onTap: () {
                      _textEditingController.clear();
                    },
                    child: BaseImage(
                      name: KImage.commonDel,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 8))
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _focusNode.unfocus();
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text("取消",
                style: TextStyle(
                  fontSize: 15,
                )),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }
}
