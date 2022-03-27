import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

/// 自带删除的TextField
typedef BaseTextFieldCallBack = void Function(String content);

enum BaseKeyBoardType { text, multiline, number, phone, datetime, emailAddress, url, password, specialNumber, verifyCode }

// ignore: must_be_immutable
class BaseTextField extends StatefulWidget {
  /*
   *  键盘样式
   */
  final BaseKeyBoardType? keyboardType;
  /*
   * 高度是否自动适配
   */
  final bool? autoHeight;
  /*
   * 最大行数
   */
  final int? maxLines;
  /*
   * 最大长度
   */
  final int? maxLength;
  /*
   * 输入内容
   */
  final String? inputText;
  /*
   * 提示内容
   */
  final String hintText;
  /*
   * 提示内容样式
   */
  final TextStyle? hintStyle;
  /*
   *  内容样式
   */
  final TextStyle? textStyle;
  /*
   *  对齐方式
   */
  final TextAlign? textAlign;
  /*
   * 输入回调
   */
  final BaseTextFieldCallBack fieldCallBack;
  /*
   * 聚焦失焦回调
   */
  final ValueChanged<bool>? focusCallBack;

  /*
   * 密码右侧图标
   */
  final Icon? passwordIcon;
  /*
   *  输入边框
   */
  final InputBorder? inputBorder;
  /*
   * 输入框前缀图标
   */
  final Widget? prefixIcon;
  /*
   *  正则验证
   */
  final FormFieldValidator<String>? validator;
  /*
   *
   */
  final bool? obscureText;
  /*
   * 前缀文本
   */
  final String? suffixText;
  /*
   *
   */
  final FocusNode? focusNode;
  /*
   * 自动焦点
   */
  final bool? autoFocus;
  /*
   * 精度
   */
  final int? digit;
  /*
   *  是否清除内容
   */
  bool clear;

  BaseTextField({
    Key? key,
    BaseKeyBoardType keyboardType: BaseKeyBoardType.text,
    required this.hintText,
    this.autoHeight = true,
    this.maxLines = 1,
    this.maxLength,
    this.inputText,
    this.hintStyle,
    required this.fieldCallBack,
    this.passwordIcon,
    this.inputBorder,
    this.textStyle,
    this.prefixIcon,
    this.textAlign,
    this.validator,
    this.obscureText,
    this.suffixText,
    this.focusNode,
    this.autoFocus,
    this.digit = 8,
    this.clear = false,
    this.focusCallBack,
  })  : assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        keyboardType = maxLines == 1 ? keyboardType : BaseKeyBoardType.multiline,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseTextField();
}

class _BaseTextField extends State<BaseTextField> {
  bool _isNumber = false;
  bool _specialNumber = false;
  bool _isVerifyCode = false;
  // bool _isVisible = false;

  /// 控制器
  late TextEditingController _controller;

  final FocusNode _verifyNode = FocusNode();

  ///输入类型
  TextInputType _getTextInputType() {
    switch (widget.keyboardType) {
      case BaseKeyBoardType.text:
        return TextInputType.text;
      case BaseKeyBoardType.multiline:
        return TextInputType.multiline;
      case BaseKeyBoardType.number:
        _isNumber = true;
        return TextInputType.number;
      case BaseKeyBoardType.specialNumber:
        _specialNumber = true;
        return TextInputType.number;
      case BaseKeyBoardType.phone:
        _isNumber = true;
        return TextInputType.phone;
      case BaseKeyBoardType.datetime:
        return TextInputType.datetime;
      case BaseKeyBoardType.emailAddress:
        return TextInputType.emailAddress;
      case BaseKeyBoardType.url:
        return TextInputType.url;
      case BaseKeyBoardType.password:
        return TextInputType.text;
      case BaseKeyBoardType.verifyCode:
        _isVerifyCode = true;
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  /// 输入范围
  List<TextInputFormatter> _getTextInputFormatter() {
    if (_isNumber) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ];
    }

    if (_specialNumber) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
        NumberTextInputFormatter(digit: widget.digit ?? 2),
        LengthLimitingTextInputFormatter(20),
      ];
    }
    if (_isVerifyCode) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6) //限制长度
      ];
    }
    //密码只允许输入英文字母和数字以及!@#$%^&*特殊字符
    if (widget.keyboardType == BaseKeyBoardType.password) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9!@#\$%^&*]')),
        LengthLimitingTextInputFormatter(16),
      ];
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    //不是验证码并且focusnode不为空，监听聚焦失焦事件
    if (!_isVerifyCode && widget.focusNode != null) {
      widget.focusNode?.addListener(() {
        if (widget.focusCallBack != null) {
          widget.focusCallBack!(widget.focusNode?.hasFocus ?? false);
        }
      });
    }
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    _verifyNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clear) {
      _controller.clear();
      widget.clear = false;
    }

    return TextField(
      // controller: _controller,
      focusNode: _isVerifyCode ? _verifyNode : widget.focusNode,
      autofocus: widget.autoFocus ?? false,
      decoration: InputDecoration(
        hintStyle: widget.hintStyle ??
            TextStyle(
              color: ZSColors.fontTips(),
              fontSize: 14,
            ),
        counterText: '',
        hintText: widget.hintText,
        border: widget.inputBorder ?? InputBorder.none,
        fillColor: Colors.transparent,
        suffixText: widget.suffixText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: null,
        errorMaxLines: 1,
      ),
      showCursor: true,
      onChanged: (str) {
        widget.fieldCallBack(str);
      },
      keyboardType: _getTextInputType(),
      maxLengthEnforcement: widget.maxLength != null ? MaxLengthEnforcement.enforced : MaxLengthEnforcement.none,
      // maxLengthEnforced: widget.maxLength != null ? true : false,
      maxLength: widget.maxLength,
      maxLines: (widget.autoHeight ?? true) ? null : widget.maxLines,
      inputFormatters: _getTextInputFormatter(),
      style: widget.textStyle ??
          TextStyle(
            color: ZSColors.fontMain(),
            fontSize: 14,
          ),
      obscureText: widget.obscureText ?? false,
      textAlign: widget.textAlign ?? TextAlign.left,
    );
  }

  // Widget _getPasswordIcon() {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         _isVisible = !_isVisible;
  //       });
  //     },
  //     child: Icon(
  //       _isVisible ? Icons.visibility_off : Icons.visibility,
  //       color: _isVisible ? KColors.fontNormal() : KColors.main(),
  //     ),
  //   );
  // }
}

class NumberTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;

  ///允许的小数位数，-1代表不限制位数
  int digit;
  NumberTextInputFormatter({this.digit = -1});
  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  ///获取目前的小数位数
  static int getValueDigit(String value) {
    if (value.contains(".")) {
      return value.split(".")[1].length;
    } else {
      return -1;
    }
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (value == ".") {
      value = "0.";
      selectionIndex++;
    } else if (value == "-") {
      value = "-";
      selectionIndex++;
    } else if (value != "" && value != defaultDouble.toString() && strToFloat(value, defaultDouble) == defaultDouble || getValueDigit(value) > digit) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
