import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/colors.dart';

/// 输入框事件回调
typedef ZSTextFieldCallBack = void Function(String content);

enum ZSKeyBoardType {
  text,
  multiline,
  number,
  phone,
  datetime,
  emailAddress,
  url,
  password,
  specialNumber,
  verifyCode,
}

enum SMClearDisplayMode {
  whileEditing, // 编辑的时候出现
  always, // 一致出现
}

// ignore: must_be_immutable
class SMTextField extends StatefulWidget {
  /// 键盘样式
  final ZSKeyBoardType? keyboardType;

  final SMClearDisplayMode? clearDisplayMode;

  final EdgeInsets? margin;

  final EdgeInsets? padding;

  final Color? backgroundColor;

  /// 高度是否自动适配
  final bool? autoHeight;

  /// 最大行数
  final int? maxLines;

  /// 最大长度
  final int? maxLength;

  /// 提示内容
  final String hintText;

  /// 提示文字颜色
  final Color? hintColor;

  /// 提示文字大小
  final double? hintFontSize;

  /// 输入内容
  final String? inputText;

  /// 内容样式
  final Color? textColor;

  /// 内容文字大小
  final double? fontSize;

  /// 内容文字字重
  final FontWeight? fontWeight;

  /// 对齐方式
  final TextAlign? textAlign;

  /// 输入框圆角
  final double? borderRadius;

  /// 输入边框颜色
  final Color? borderColor;

  /// 输入边框宽度
  final double? borderWidth;

  /// 输入框前缀图标
  final Widget? prefixIcon;

  ///
  final bool? securityInput;

  /// 前缀文本
  final Widget? suffixWidget;

  ///
  final FocusNode? focusNode;

  /// 自动焦点
  final bool? autoFocus;

  /// 精度
  final int? digit;

  /// 是否显示清除按钮
  final bool? showClear;

  /// 自定义清除按钮
  final Widget? clearWidget;

  /// 默认是否清除内容
  bool defaultClear;

  /// 正则验证
  final FormFieldValidator<String>? validator;

  /// 输入回调
  final ZSTextFieldCallBack fieldCallBack;

  /// 聚焦失焦回调
  final ValueChanged<bool>? focusCallBack;

  SMTextField({
    Key? key,
    ZSKeyBoardType keyboardType: ZSKeyBoardType.text,
    this.clearDisplayMode,
    required this.hintText,
    this.autoHeight,
    this.maxLines = 1,
    this.maxLength,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.inputText,
    this.hintColor,
    this.hintFontSize,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.prefixIcon,
    this.textAlign,
    this.validator,
    this.securityInput,
    this.suffixWidget,
    this.focusNode,
    this.autoFocus,
    this.digit = 2,
    this.showClear,
    this.clearWidget,
    this.defaultClear = false,
    required this.fieldCallBack,
    this.focusCallBack,
  })  : assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        keyboardType = maxLines == 1 ? keyboardType : ZSKeyBoardType.multiline,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SMTextFieldFieldState();
}

class _SMTextFieldFieldState extends State<SMTextField> {
  bool _isNumber = false;
  bool _specialNumber = false;
  bool _isVerifyCode = false;
  String _inputText = '';

  /// 控制器
  late TextEditingController _controller = TextEditingController();

  final FocusNode _verifyNode = FocusNode();

  /*
   * @description   获取输入框类型
   * @param         
   * @return        
   * @author        jay    
   * @time          3/10/22 3:54 PM  
   */
  TextInputType _getTextInputType() {
    switch (widget.keyboardType) {
      case ZSKeyBoardType.text:
        return TextInputType.text;
      case ZSKeyBoardType.multiline:
        return TextInputType.multiline;
      case ZSKeyBoardType.number:
        _isNumber = true;
        return TextInputType.number;
      case ZSKeyBoardType.specialNumber:
        _specialNumber = true;
        return TextInputType.number;
      case ZSKeyBoardType.phone:
        _isNumber = true;
        return TextInputType.phone;
      case ZSKeyBoardType.datetime:
        return TextInputType.datetime;
      case ZSKeyBoardType.emailAddress:
        return TextInputType.emailAddress;
      case ZSKeyBoardType.url:
        return TextInputType.url;
      case ZSKeyBoardType.password:
        return TextInputType.text;
      case ZSKeyBoardType.verifyCode:
        _isVerifyCode = true;
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  /*
   * @description   校验输入框输入格式
   * @param         
   * @return        
   * @author        jay    
   * @time          3/10/22 3:54 PM  
   */
  List<TextInputFormatter> _onVerifyTextFieldFormatter() {
    if (_isNumber) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ];
    }

    if (_specialNumber) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
        NumberTextFieldFormatter(digit: widget.digit ?? 2),
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
    if (widget.keyboardType == ZSKeyBoardType.password) {
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
    // 不是验证码并且focusNode不为空，监听聚焦失焦事件
    if (!_isVerifyCode && widget.focusNode != null) {
      widget.focusNode?.addListener(() {
        if (widget.focusCallBack != null) {
          widget.focusCallBack!(widget.focusNode?.hasFocus ?? false);
        }
      });
    }
    if (widget.inputText != null) {
      _inputText = widget.inputText ?? '';
    }
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    _verifyNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.defaultClear) {
      _controller.clear();
      _inputText = '';
      widget.defaultClear = false;
    }

    /// 隐私输入
    bool securityInput = widget.securityInput ?? false;

    /// 自动高度
    bool autoHeight = widget.autoHeight ?? false;

    SMClearDisplayMode clearDisplayMode = widget.clearDisplayMode ?? SMClearDisplayMode.whileEditing;

    bool showClear = widget.showClear ?? true;

    Widget clearButton = _getClearButton(
      clearDisplayMode: clearDisplayMode,
      clearWidget: widget.clearWidget,
      showClear: showClear,
    );

    Widget suffixWidget = widget.suffixWidget != null ? Container(margin: EdgeInsets.only(left: showClear ? 8 : 0), child: widget.suffixWidget) : Container();

    double suffixWidth = 0;
    if (showClear) {
      suffixWidth += 32;
    }
    if (widget.suffixWidget != null) {
      suffixWidth += showClear ? 38 : 30;
    }

    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: TextField(
        controller: _controller,
        focusNode: _isVerifyCode ? _verifyNode : widget.focusNode,
        autofocus: widget.autoFocus ?? false,
        decoration: InputDecoration(
          // labelText: _inputText,
          hintStyle: TextStyle(
            color: widget.hintColor ?? ZSColors.fontTips(),
            fontSize: widget.hintFontSize ?? 14,
          ),
          counterText: '',
          hintText: widget.hintText,
          border: InputBorder.none,
          fillColor: Colors.transparent,
          prefixIcon: widget.prefixIcon,
          suffixIcon: Container(
            padding: widget.padding,
            width: suffixWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => _onHandleClearTextField(),
                  child: clearButton,
                ),
                suffixWidget,
              ],
            ),
          ),
          errorMaxLines: 1,
        ),
        showCursor: true,
        onChanged: (str) {
          setState(() {
            _inputText = str;
          });
          widget.fieldCallBack(str);
        },
        keyboardType: _getTextInputType(),
        maxLengthEnforcement: widget.maxLength != null ? MaxLengthEnforcement.enforced : MaxLengthEnforcement.none,
        maxLength: widget.maxLength ?? 30,
        maxLines: autoHeight ? (securityInput ? 1 : null) : (securityInput ? 1 : widget.maxLines),
        inputFormatters: _onVerifyTextFieldFormatter(),
        style: TextStyle(
          color: widget.textColor ?? ZSColors.fontMain(),
          fontSize: widget.fontSize ?? 14,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
        ),
        obscureText: securityInput,
        textAlign: widget.textAlign ?? TextAlign.left,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        border: Border.all(color: widget.borderColor ?? Colors.transparent, width: widget.borderWidth ?? 0.5),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      ),
    );
  }

  /*
   * @description   清除输入框文本
   * @param
   * @return
   * @author        jay
   * @time          3/10/22 6:02 PM
   */
  void _onHandleClearTextField() {
    _controller.clear();
    setState(() {
      _inputText = '';
    });
  }

  /*
   * @description   获取清除按钮
   * @param         
   * @return        
   * @author        jay    
   * @time          3/10/22 6:21 PM  
   */
  Widget _getClearButton({required SMClearDisplayMode clearDisplayMode, Widget? clearWidget, required bool showClear}) {
    Widget widget;
    switch (clearDisplayMode) {
      case SMClearDisplayMode.whileEditing:
        if (showClear) {
          widget = _inputText.length > 0
              ? (clearWidget ??
                  Container(
                    width: 16,
                    height: 16,
                    alignment: Alignment.center,
                    child: Icon(Icons.close_outlined, color: Colors.white, size: 12),
                    decoration: BoxDecoration(color: ZSColors.line(), borderRadius: BorderRadius.circular(8)),
                  ))
              : Container();
        } else {
          widget = Container();
        }
        return widget;
      case SMClearDisplayMode.always:
        if (showClear) {
          widget = (clearWidget ??
              Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                child: Icon(Icons.close_outlined, color: Colors.white, size: 12),
                decoration: BoxDecoration(color: ZSColors.line(), borderRadius: BorderRadius.circular(8)),
              ));
        } else {
          widget = Container();
        }
        return widget;
      default:
        return Container();
    }
  }
}

class NumberTextFieldFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;

  /// 允许的小数位数，-1代表不限制位数
  int digit;
  NumberTextFieldFormatter({this.digit = -1});
  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  /// 获取目前的小数位数
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
