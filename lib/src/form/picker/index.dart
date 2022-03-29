import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Dialog;
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'package:zs_design_flutter/src/feedback/modal/index.dart';

import 'adapter.dart';
import 'define.dart';
import 'delimiter.dart';
export 'adapter.dart';

/// Picker
class ZSPicker {
  static const double DefaultTextSize = 16.0;

  /// Index of currently selected items
  late List<int> selecteds;

  /// Picker adapter, Used to provide data and generate widgets
  late PickerAdapter adapter;

  /// insert separator before picker columns
  final List<PickerDelimiter>? delimiter;

  final VoidCallback? onCancel;
  final PickerSelectedCallback? onSelect;
  final PickerConfirmCallback? onConfirm;
  final PickerConfirmBeforeCallback? onConfirmBefore;

  /// When the previous level selection changes, scroll the child to the first item.
  final changeToFirst;

  /// Specify flex for each column
  final List<int>? columnFlex;

  final Widget? title;
  final Widget? cancel;
  final Widget? confirm;
  final String? cancelText;
  final String? confirmText;

  final double height;

  /// Height of list item
  final double itemExtent;

  final TextStyle? textStyle,
      cancelTextStyle,
      confirmTextStyle,
      selectedTextStyle;
  final TextAlign textAlign;
  final IconThemeData? selectedIconTheme;

  /// Text scaling factor
  final double? textScaleFactor;

  final EdgeInsetsGeometry? columnPadding;
  final Color? backgroundColor, headerColor, containerColor;

  /// Hide head
  final bool hideHeader;

  /// Show pickers in reversed order
  final bool reversedOrder;

  /// Generate a custom header， [hideHeader] = true
  final WidgetBuilder? builderHeader;

  /// List item loop
  final bool looping;

  /// Delay generation for smoother animation, This is the number of milliseconds to wait. It is recommended to > = 200
  final int smooth;

  final Widget? footer;

  /// A widget overlaid on the picker to highlight the currently selected entry.
  final Widget selectionOverlay;

  final Decoration? headerDecoration;

  final double magnification;
  final double diameterRatio;
  final double squeeze;

  Widget? _widget;
  PickerWidgetState? _state;

  ZSPicker(
      {required this.adapter,
        this.delimiter,
        List<int>? selecteds,
        this.height = 320.0,
        this.itemExtent = 28.0,
        this.columnPadding,
        this.textStyle,
        this.cancelTextStyle,
        this.confirmTextStyle,
        this.selectedTextStyle,
        this.selectedIconTheme,
        this.textAlign = TextAlign.start,
        this.textScaleFactor,
        this.title,
        this.cancel,
        this.confirm,
        this.cancelText,
        this.confirmText,
        this.backgroundColor = Colors.white,
        this.containerColor,
        this.headerColor,
        this.builderHeader,
        this.changeToFirst = false,
        this.hideHeader = false,
        this.looping = false,
        this.reversedOrder = false,
        this.headerDecoration,
        this.columnFlex,
        this.footer,
        this.smooth = 0,
        this.magnification = 1.0,
        this.diameterRatio = 1.1,
        this.squeeze = 1.45,
        this.selectionOverlay = const CupertinoPickerDefaultSelectionOverlay(),
        this.onCancel,
        this.onSelect,
        this.onConfirmBefore,
        this.onConfirm}) {
    this.selecteds = selecteds == null ? <int>[] : selecteds;
  }

  Widget? get widget => _widget;
  PickerWidgetState? get state => _state;
  int _maxLevel = 1;

  /// 生成picker控件
  /// Build picker control
  Widget makePicker([ThemeData? themeData, bool isModal = false, Key? key]) {
    _maxLevel = adapter.maxLevel;
    adapter.picker = this;
    adapter.initSelects();
    _widget = PickerWidget(
      key: key ?? ValueKey(this),
      child:
      _PickerWidget(picker: this, themeData: themeData, isModal: isModal),
      data: this,
    );
    return _widget!;
  }

  /// show picker
  void show(
      BuildContext context, {
        ThemeData? themeData,
        Color? backgroundColor,
        PickerWidgetBuilder? builder,
      }) {
    final picker = makePicker(themeData);
    ZSModal.show(context: context, child: picker);
    // state.showBottomSheet((BuildContext context) {
    //   final picker = makePicker(themeData);
    //   return builder == null ? picker : builder(context, picker);
    // }, backgroundColor: backgroundColor);
  }

  /// Display modal picker
  Future<T?> showModal<T>(BuildContext context,
      {ThemeData? themeData,
        bool isScrollControlled = false,
        bool useRootNavigator = false,
        Color? backgroundColor,
        PickerWidgetBuilder? builder}) async {
    return await showModalBottomSheet<T>(
        context: context, //state.context,
        isScrollControlled: isScrollControlled,
        useRootNavigator: useRootNavigator,
        backgroundColor: backgroundColor,
        builder: (BuildContext context) {
          final picker = makePicker(themeData, true);
          return builder == null ? picker : builder(context, picker);
        });
  }

  /// show dialog picker
  Future<List<int>?> showDialog(BuildContext context,
      {bool barrierDismissible = true,
        Color? backgroundColor,
        PickerWidgetBuilder? builder,
        Key? key}) {
    return Dialog.showDialog<List<int>>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          final actions = <Widget>[];

          if (cancel == null) {
            String? _cancelText =
                cancelText ?? '取消';
            if (_cancelText != "") {
              actions.add(TextButton(
                  style: _getButtonStyle(ButtonTheme.of(context)),
                  onPressed: () {
                    Navigator.pop<List<int>>(context, null);
                    if (onCancel != null) {
                      onCancel!();
                    }
                  },
                  child: cancelTextStyle == null
                      ? Text(_cancelText)
                      : DefaultTextStyle(
                      child: Text(_cancelText), style: cancelTextStyle!)));
            }
          } else {
            actions.add(cancel!);
          }

          if (confirm == null) {
            String? _confirmText =
                confirmText ?? '确认';
            if (_confirmText != "") {
              actions.add(TextButton(
                  style: _getButtonStyle(ButtonTheme.of(context)),
                  onPressed: () async {
                    if (onConfirmBefore != null &&
                        !(await onConfirmBefore!(this, selecteds))) {
                      return; // Cancel;
                    }
                    Navigator.pop<List<int>>(context, selecteds);
                    onConfirm!(this, selecteds);
                  },
                  child: confirmTextStyle == null
                      ? Text(_confirmText)
                      : DefaultTextStyle(
                      child: Text(_confirmText),
                      style: confirmTextStyle!)));
            }
          } else {
            actions.add(confirm!);
          }
          return AlertDialog(
            key: key ?? Key('picker-dialog'),
            title: title,
            backgroundColor: backgroundColor,
            actions: actions,
            content:
            builder == null ? makePicker() : builder(context, makePicker()),
          );
        });
  }

  /// 获取当前选择的值
  /// Get the value of the current selection
  List getSelectedValues() {
    return adapter.getSelectedValues();
  }

  /*
   * @description   取消事件
   * @param
   * @return        void
   * @author        jay
   * @date:         2022/3/29 9:42 PM
  */
  void _onHandleCancel(BuildContext context) {
    Navigator.of(context).pop<List<int>>(null);
    if (onCancel != null) onCancel!();
    _widget = null;
  }

  /*
   * @description   确定事件
   * @param
   * @return        void
   * @author        jay
   * @date:         2022/3/29 9:43 PM
  */
  void _onHandleConfirm(BuildContext context) async {
    if (onConfirmBefore != null && !(await onConfirmBefore!(this, selecteds))) {
      return; // Cancel;
    }
    Navigator.of(context).pop<List<int>>(selecteds);
    if (onConfirm != null) onConfirm!(this, selecteds);
    _widget = null;
  }

  /// 弹制更新指定列的内容
  /// 当 onSelect 事件中，修改了当前列前面的列的内容时，可以调用此方法来更新显示
  void updateColumn(int index, [bool all = false]) {
    if (all) {
      _state?.update();
      return;
    }
    adapter.setColumn(index - 1);
    if (_state?._keys[index] != null) _state?._keys[index]!(() => null);
  }

  static ButtonStyle _getButtonStyle(ButtonThemeData? theme) => ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(theme?.minWidth ?? 0.0, 42)),
      padding: MaterialStateProperty.all(theme?.padding));
}

class PickerWidget<T> extends InheritedWidget {
  final ZSPicker data;
  const PickerWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant PickerWidget oldWidget) =>
      oldWidget.data != data;

  static PickerWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PickerWidget>()
    as PickerWidget;
  }
}

class _PickerWidget<T> extends StatefulWidget {
  final ZSPicker picker;
  final ThemeData? themeData;
  final bool isModal;
  _PickerWidget(
      {Key? key, required this.picker, this.themeData, required this.isModal})
      : super(key: key);

  @override
  PickerWidgetState createState() =>
      PickerWidgetState<T>(picker: this.picker, themeData: this.themeData);
}

class PickerWidgetState<T> extends State<_PickerWidget> {
  final ZSPicker picker;
  final ThemeData? themeData;
  PickerWidgetState({required this.picker, this.themeData});

  ThemeData? theme;
  final List<FixedExtentScrollController> scrollController = [];
  final List<StateSetter?> _keys = [];

  @override
  void initState() {
    super.initState();
    picker._state = this;
    picker.adapter.doShow();

    if (scrollController.length == 0) {
      for (int i = 0; i < picker._maxLevel; i++) {
        scrollController
            .add(FixedExtentScrollController(initialItem: picker.selecteds[i]));
        _keys.add(null);
      }
    }
  }

  void update() {
    setState(() {});
  }

  // var ref = 0;
  @override
  Widget build(BuildContext context) {
    // print("picker build ${ref++}");
    theme = themeData ?? Theme.of(context);

    if (_wait && picker.smooth > 0) {
      Future.delayed(Duration(milliseconds: picker.smooth), () {
        if (!_wait) return;
        setState(() {
          _wait = false;
        });
      });
    } else
      _wait = false;

    final _body = <Widget>[];
    if (!picker.hideHeader) {
      if (picker.builderHeader != null) {
        _body.add(picker.headerDecoration == null
            ? picker.builderHeader!(context)
            : DecoratedBox(
            child: picker.builderHeader!(context),
            decoration: picker.headerDecoration!));
      } else {
        _body.add(DecoratedBox(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: _buildHeaderViews(context),
            ),
          ),
          decoration: picker.headerDecoration ??
              BoxDecoration(
                border: Border(
                  top: BorderSide(color: theme!.dividerColor, width: 0.5),
                  bottom: BorderSide(color: theme!.dividerColor, width: 0.5),
                ),
                color: picker.headerColor == null
                    ? (theme!.bottomAppBarColor)
                    : picker.headerColor,
              ),
        ));
      }
    }
    _body.add(_wait
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildViews(),
    )
        : AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildViews(),
      ),
    ));

    if (picker.footer != null) _body.add(picker.footer!);
    Widget v = ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8),),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _body,
      ),
    );
    if (widget.isModal) {
      return GestureDetector(
        onTap: () {},
        child: v,
      );
    }
    return v;
  }

  List<Widget>? _headerItems;

  /*
   * @description   创建头部按钮
   * @param
   * @return        void
   * @author        jay
   * @date:         2022/3/29 1:03 AM
  */
  Widget _buildHeaderButton(BuildContext context,
      {required String text,
        required VoidCallback onPressed,
        TextStyle? style}) {
    return TextButton(
        style: ZSPicker._getButtonStyle(ButtonTheme.of(context)),
        onPressed: onPressed,
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            style: style ??
                theme!.textTheme.button!.copyWith(
                    color: theme!.colorScheme.secondary,
                    fontSize: ZSPicker.DefaultTextSize)));
  }

  List<Widget> _buildHeaderViews(BuildContext context) {
    if (_headerItems != null) return _headerItems!;
    if (theme == null) theme = Theme.of(context);
    List<Widget> items = [];

    if (picker.cancel != null) {
      items.add(DefaultTextStyle(
          style: picker.cancelTextStyle ??
              theme!.textTheme.button!.copyWith(
                  color: theme!.colorScheme.secondary,
                  fontSize: ZSPicker.DefaultTextSize),
          child: picker.cancel!));
    } else {
      String? _cancelText =
          picker.cancelText ?? '取消';
      if (_cancelText != "") {
        items.add(_buildHeaderButton(context,
            text: _cancelText, style: picker.cancelTextStyle, onPressed: () {
              picker._onHandleCancel(context);
            }));
      }
    }

    items.add(Expanded(
        child: Center(
          child: picker.title == null
              ? picker.title
              : DefaultTextStyle(
              style: theme!.textTheme.headline6!.copyWith(
                fontSize: ZSPicker.DefaultTextSize,
              ),
              child: picker.title!),
        )));

    if (picker.confirm != null) {
      items.add(DefaultTextStyle(
          style: picker.confirmTextStyle ??
              theme!.textTheme.button!.copyWith(
                  color: theme!.colorScheme.secondary,
                  fontSize: ZSPicker.DefaultTextSize),
          child: picker.confirm!));
    } else {
      String? _confirmText =
          picker.confirmText ?? '确认';
      if (_confirmText != "") {
        items.add(_buildHeaderButton(context,
            text: _confirmText, style: picker.confirmTextStyle, onPressed: () {
              picker._onHandleConfirm(context);
            }));
      }
    }

    _headerItems = items;
    return items;
  }

  bool _changing = false;
  bool _wait = true;
  final Map<int, int> lastData = {};

  List<Widget> _buildViews() {
    // if (__printDebug) print("_buildViews");
    if (theme == null) theme = Theme.of(context);

    List<Widget> items = [];

    PickerAdapter? adapter = picker.adapter;
    adapter.setColumn(-1);

    if (adapter.length > 0) {
      var _decoration = BoxDecoration(
        color: picker.containerColor == null
            ? theme!.dialogBackgroundColor
            : picker.containerColor,
      );

      for (int i = 0; i < picker._maxLevel; i++) {
        Widget view = Expanded(
          flex: adapter.getColumnFlex(i),
          child: Container(
            padding: picker.columnPadding,
            height: picker.height,
            decoration: _decoration,
            child: _wait
                ? null
                : StatefulBuilder(
              builder: (context, state) {
                _keys[i] = state;
                adapter.setColumn(i - 1);

                // 上一次是空列表
                final _lastIsEmpty = scrollController[i].hasClients &&
                    !scrollController[i].position.hasContentDimensions;

                final _length = adapter.length;
                var _view = CupertinoPicker.builder(
                  key: _lastIsEmpty ? ValueKey(_length) : null,
                  backgroundColor: picker.backgroundColor,
                  scrollController: scrollController[i],
                  itemExtent: picker.itemExtent,
                  // looping: picker.looping,
                  magnification: picker.magnification,
                  diameterRatio: picker.diameterRatio,
                  squeeze: picker.squeeze,
                  selectionOverlay: picker.selectionOverlay,
                  onSelectedItemChanged: (int _index) {
                    // if (__printDebug) print("onSelectedItemChanged");
                    if (_length <= 0) return;
                    var index = _index % _length;
                    picker.selecteds[i] = index;
                    updateScrollController(i);
                    adapter.doSelect(i, index);
                    if (picker.changeToFirst) {
                      for (int j = i + 1;
                      j < picker.selecteds.length;
                      j++) {
                        picker.selecteds[j] = 0;
                        scrollController[j].jumpTo(0.0);
                      }
                    }
                    if (picker.onSelect != null)
                      picker.onSelect!(picker, i, picker.selecteds);

                    if (adapter.needUpdatePrev(i))
                      setState(() {});
                    else {
                      if (_keys[i] != null) _keys[i]!(() => null);
                      if (adapter.isLinkage) {
                        for (int j = i + 1;
                        j < picker.selecteds.length;
                        j++) {
                          if (j == i) continue;
                          adapter.setColumn(j - 1);
                          if (_keys[j] != null) _keys[j]!(() => null);
                        }
                      }
                    }
                  },
                  itemBuilder: (context, index) {
                    adapter.setColumn(i - 1);
                    return adapter.buildItem(context, index % _length);
                  },
                  childCount: picker.looping ? null : _length,
                );

                if (_lastIsEmpty ||
                    (!picker.changeToFirst &&
                        picker.selecteds[i] >= _length)) {
                  Timer(Duration(milliseconds: 100), () {
                    if (!this.mounted) return;
                    // if (__printDebug) print("timer last");
                    var _len = adapter.length;
                    var _index = (_len < _length ? _len : _length) - 1;
                    if (scrollController[i]
                        .position
                        .hasContentDimensions) {
                      scrollController[i].jumpToItem(_index);
                    } else {
                      scrollController[i] = FixedExtentScrollController(
                          initialItem: _index);
                      state(() => null);
                    }
                  });
                }

                return _view;
              },
            ),
          ),
        );
        items.add(view);
      }
    }

    if (picker.delimiter != null && !_wait) {
      for (int i = 0; i < picker.delimiter!.length; i++) {
        var o = picker.delimiter![i];
        if (o.child == null) continue;
        var item = Container(child: o.child, height: picker.height);
        if (o.column < 0)
          items.insert(0, item);
        else if (o.column >= items.length)
          items.add(item);
        else
          items.insert(o.column, item);
      }
    }

    if (picker.reversedOrder) return items.reversed.toList();

    return items;
  }

  void updateScrollController(int i) {
    if (_changing || !(picker.adapter.isLinkage)) return;
    _changing = true;
    for (int j = 0; j < picker.selecteds.length; j++) {
      if (j != i) {
        if (scrollController[j].hasClients &&
            scrollController[j].position.hasContentDimensions)
          scrollController[j].position.notifyListeners();
      }
    }
    _changing = false;
  }

  @override
  void debugFillProperties(properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('_changing', _changing));
    properties.add(DiagnosticsProperty<bool>('_changing', _changing));
  }
}


