import 'package:flutter/material.dart';

import '../basic/label.dart';
import '../constant/colors.dart';

enum ZSButtonType {
  normal,
  info,
  success,
  danger,
  warming,
}

class ZSButton extends StatefulWidget {
  /// 按钮类型
  final ZSButtonType? type;

  /// 按钮是否可以点击
  final bool? enable;

  /// 加载中颜色
  final Color? loadingColor;

  /// 加载中文字
  final String? loadingText;

  /// 是否加载中
  final bool? loading;

  /// 按钮的外边距
  final EdgeInsets? margin;

  /// 按钮的大小
  final Size? size;

  /// 按钮文字
  final String? title;

  /// 按钮文字颜色
  final Color? textColor;

  /// 按钮文字大小
  final double? fontSize;

  /// 按钮字重
  final FontWeight? fontWeight;

  /// 按钮普通颜色
  final Color? normalColor;

  /// 按钮高亮颜色
  final Color? highColor;

  /// 按钮圆角
  final double? borderRadius;

  /// 按钮边框颜色
  final Color? borderColor;

  /// icon
  final IconData? iconData;

  /// icon颜色
  final Color? iconColor;

  /// 按钮点击事件
  final Function onTap;

  ZSButton({
    Key? key,
    this.type,
    this.enable,
    this.loading,
    this.loadingColor,
    this.loadingText,
    this.margin,
    this.size,
    this.title,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.normalColor,
    this.highColor,
    this.borderRadius,
    this.borderColor,
    this.iconData,
    this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  _ZSButtonState createState() => _ZSButtonState();
}

class _ZSButtonState extends State<ZSButton> {
  bool _isHighStatus = false;

  @override
  Widget build(BuildContext context) {
    ZSButtonType type = widget.type ?? ZSButtonType.normal;
    double fontSize = widget.fontSize ?? 16;
    bool enable = widget.enable ?? true;
    // 是否可以点击
    int enableAlpha = enable ? 255 : 180;

    bool loading = widget.loading ?? false;

    return Container(
      margin: widget.margin,
      width: widget.size?.width,
      height: widget.size?.height ?? 44,
      child: MaterialButton(
        splashColor: enable ? _getButtonBackgroundColor(type: type) : _getButtonBackgroundColor(type: type).withAlpha(enableAlpha),
        color: enable ? _getButtonBackgroundColor(type: type) : _getButtonBackgroundColor(type: type).withAlpha(enableAlpha),
        textColor: _getTextColor(type: type),
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 2),
        ),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(_getLoadingColor(type: type)),
                    ),
                  ),
                  widget.loadingText != null
                      ? SMLabel(
                          margin: EdgeInsets.only(left: 8),
                          text: widget.loadingText ?? '',
                          color: _getLoadingColor(type: type),
                        )
                      : Container(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.iconData != null
                      ? Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            widget.iconData,
                            size: (fontSize + 4),
                            color: _getTextColor(type: type).withAlpha(enableAlpha),
                          ),
                        )
                      : Container(),
                  SMLabel(
                    text: widget.title ?? '',
                    color: _getTextColor(type: type).withAlpha(enableAlpha),
                    fontSize: widget.fontSize ?? 16,
                    fontWeight: widget.fontWeight ?? FontWeight.w500,
                  ),
                ],
              ),
        onPressed: () => onTap(),
      ),
      decoration: BoxDecoration(
        color: enable ? _getButtonBackgroundColor(type: type) : _getButtonBackgroundColor(type: type).withAlpha(enableAlpha),
        // borderRadius: BorderRadius.circular(widget.borderRadius ?? 2),
        border: Border.all(color: _getBorderColor(type: type), width: 0.5),
      ),
    );

    return GestureDetector(
      onLongPressStart: (event) => onLongPressStart(),
      onLongPressEnd: (event) => onLongPressEnd(),
      onTapDown: (event) => onTapDown(),
      onTapUp: (event) => onTapUp(),
      onTapCancel: () => onTapCancel(),
      onTap: () => onTap(),
      child: Container(
        margin: widget.margin,
        width: widget.size?.width,
        height: widget.size?.height ?? 44,
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(_getLoadingColor(type: type)),
                    ),
                  ),
                  widget.loadingText != null
                      ? SMLabel(
                          margin: EdgeInsets.only(left: 8),
                          text: widget.loadingText ?? '',
                          color: _getLoadingColor(type: type),
                        )
                      : Container(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.iconData != null
                      ? Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            widget.iconData,
                            size: (fontSize + 4),
                            color: _getTextColor(type: type).withAlpha(enableAlpha),
                          ),
                        )
                      : Container(),
                  SMLabel(
                    text: widget.title ?? '',
                    color: _getTextColor(type: type).withAlpha(enableAlpha),
                    fontSize: widget.fontSize ?? 16,
                    fontWeight: widget.fontWeight ?? FontWeight.w500,
                  ),
                ],
              ),
        decoration: BoxDecoration(
          color: enable ? _getButtonBackgroundColor(type: type) : _getButtonBackgroundColor(type: type).withAlpha(enableAlpha),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 2),
          border: Border.all(color: _getBorderColor(type: type), width: 0.5),
        ),
      ),
    );
  }

  void onTap() {
    if ((widget.enable ?? true) == false) return;
    widget.onTap();
  }

  void onTapDown() {
    if ((widget.enable ?? true) == false) return;
    setState(() {
      _isHighStatus = true;
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _isHighStatus = false;
      });
    });
  }

  void onTapUp() {
    if ((widget.enable ?? true) == false) return;
    setState(() {
      _isHighStatus = false;
    });
  }

  void onTapCancel() {
    if ((widget.enable ?? true) == false) return;
    setState(() {
      _isHighStatus = false;
    });
    widget.onTap();
  }

  void onLongPressStart() {
    if ((widget.enable ?? true) == false) return;
    setState(() {
      _isHighStatus = true;
    });
  }

  void onLongPressEnd() {
    if ((widget.enable ?? true) == false) return;
    setState(() {
      _isHighStatus = false;
    });
  }

  /*
   * @description   获取按钮文字颜色
   * @param         
   * @return        
   * @author        jay    
   * @time          3/8/22 3:05 PM  
   */
  Color _getTextColor({required ZSButtonType type}) {
    switch (type) {
      case ZSButtonType.normal:
        // 白色底
        return widget.textColor ?? (_isHighStatus ? ZSColors.fontMain() : ZSColors.fontMain());
      default:
        return widget.textColor ?? (_isHighStatus ? ZSColors.white(alpha: 0.8) : ZSColors.white());
    }
  }

  /*
   * @description   获取按钮背景色
   * @param         
   * @return        
   * @author        jay    
   * @time          3/8/22 3:04 PM  
   */
  Color _getButtonBackgroundColor({required ZSButtonType type}) {
    switch (type) {
      case ZSButtonType.normal:
        // 普通
        return _isHighStatus ? (widget.highColor ?? ZSColors.line()) : (widget.normalColor ?? ZSColors.white());
      case ZSButtonType.info:
        // 信息
        return _isHighStatus ? (widget.highColor ?? ZSColors.main()) : (widget.normalColor ?? ZSColors.main(alpha: 1));
      case ZSButtonType.success:
        // 成功
        return _isHighStatus ? (widget.highColor ?? ZSColors.mainGreen()) : (widget.normalColor ?? ZSColors.mainGreen(alpha: 1));
      case ZSButtonType.danger:
        // 危险
        return _isHighStatus ? (widget.highColor ?? ZSColors.mainRed()) : (widget.normalColor ?? ZSColors.mainRed(alpha: 1));
      case ZSButtonType.warming:
        // 警告
        return _isHighStatus ? (widget.highColor ?? ZSColors.mainYellow()) : (widget.normalColor ?? ZSColors.mainYellow(alpha: 1));
      default:
        return widget.normalColor ?? (_isHighStatus ? ZSColors.background() : ZSColors.white());
    }
  }

  /*
   * @description   获取边框颜色
   * @param         
   * @return        
   * @author        jay    
   * @time          3/8/22 3:04 PM  
   */
  Color _getBorderColor({required ZSButtonType type}) {
    switch (type) {
      case ZSButtonType.normal:
        // 白色底
        return widget.borderColor ?? ZSColors.line();
      default:
        return widget.borderColor ?? ZSColors.clear();
    }
  }

  /*
   * @description   获取按钮文字颜色
   * @param
   * @return
   * @author        jay
   * @time          3/8/22 3:05 PM
   */
  Color _getLoadingColor({required ZSButtonType type}) {
    switch (type) {
      case ZSButtonType.normal:
        // 白色底
        return widget.loadingColor ?? ZSColors.fontMain();
      default:
        return widget.loadingColor ?? ZSColors.white();
    }
  }
}
