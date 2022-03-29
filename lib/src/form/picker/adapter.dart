import 'package:flutter/material.dart';

import 'define.dart';
import 'index.dart';
import 'item.dart';

/// 选择器数据适配器
abstract class PickerAdapter<T> {
  ZSPicker? picker;

  int getLength();
  int getMaxLevel();
  void setColumn(int index);
  void initSelects();
  Widget buildItem(BuildContext context, int index);

  /// 是否需要更新前面的列
  /// Need to update previous columns
  bool needUpdatePrev(int curIndex) {
    return false;
  }

  Widget makeText(Widget? child, String? text, bool isSel) {
    return Center(
        child: DefaultTextStyle(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: picker!.textAlign,
            style: picker!.textStyle ??
                TextStyle(
                    color: Colors.black87,
                    fontFamily: picker?.state?.context != null
                        ? Theme.of(picker!.state!.context)
                        .textTheme
                        .headline6!
                        .fontFamily
                        : "",
                    fontSize: ZSPicker.DefaultTextSize),
            child: child != null
                ? (isSel && picker!.selectedIconTheme != null
                ? IconTheme(
              data: picker!.selectedIconTheme!,
              child: child,
            )
                : child)
                : Text(text ?? "",
                textScaleFactor: picker!.textScaleFactor,
                style: (isSel ? picker!.selectedTextStyle : null))));
  }

  Widget makeTextEx(
      Widget? child, String text, Widget? postfix, Widget? suffix, bool isSel) {
    List<Widget> items = [];
    if (postfix != null) items.add(postfix);
    items.add(
        child ?? Text(text, style: (isSel ? picker!.selectedTextStyle : null)));
    if (suffix != null) items.add(suffix);

    Color? _txtColor = Colors.black87;
    double? _txtSize = ZSPicker.DefaultTextSize;
    if (isSel && picker!.selectedTextStyle != null) {
      if (picker!.selectedTextStyle!.color != null)
        _txtColor = picker!.selectedTextStyle!.color;
      if (picker!.selectedTextStyle!.fontSize != null)
        _txtSize = picker!.selectedTextStyle!.fontSize;
    }

    return new Center(
      //alignment: Alignment.center,
      child: DefaultTextStyle(
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: picker!.textAlign,
        style: picker!.textStyle ??
            TextStyle(color: _txtColor, fontSize: _txtSize),
        child: Wrap(
          children: items,
        ),),);
  }

  String getText() {
    return getSelectedValues().toString();
  }

  List<T> getSelectedValues() {
    return [];
  }

  void doShow() {}
  void doSelect(int column, int index) {}

  int getColumnFlex(int column) {
    if (picker!.columnFlex != null && column < picker!.columnFlex!.length)
      return picker!.columnFlex![column];
    return 1;
  }

  int get maxLevel => getMaxLevel();

  /// Content length of current column
  int get length => getLength();

  String get text => getText();

  // 是否联动，即后面的列受前面列数据影响
  bool get isLinkage => getIsLinkage();

  @override
  String toString() {
    return getText();
  }

  bool getIsLinkage() {
    return true;
  }

  /// 通知适配器数据改变
  void notifyDataChanged() {
    if (picker?.state != null) {
      picker!.adapter.doShow();
      picker!.adapter.initSelects();
      for (int j = 0; j < picker!.selecteds.length; j++) {
        picker!.state!.scrollController[j].jumpToItem(picker!.selecteds[j]);
      }
    }
  }
}

/// 数据适配器
class PickerDataAdapter<T> extends PickerAdapter<T> {
  late List<PickerItem<T>> data;
  List<PickerItem<dynamic>>? _datas;
  int _maxLevel = -1;
  int _col = 0;
  final bool isArray;

  PickerDataAdapter(
      {List? pickerdata, List<PickerItem<T>>? data, this.isArray = false}) {
    this.data = data ?? <PickerItem<T>>[];
    _parseData(pickerdata);
  }

  @override
  bool getIsLinkage() {
    return !isArray;
  }

  void _parseData(List? pickerData) {
    if (pickerData != null && pickerData.length > 0 && (data.length == 0)) {
      if (isArray) {
        _parseArrayPickerDataItem(pickerData, data);
      } else {
        _parsePickerDataItem(pickerData, data);
      }
    }
  }

  _parseArrayPickerDataItem(List? pickerData, List<PickerItem> data) {
    if (pickerData == null) return;
    var len = pickerData.length;
    for (int i = 0; i < len; i++) {
      var v = pickerData[i];
      if (!(v is List)) continue;
      List lv = v;
      if (lv.length == 0) continue;

      PickerItem item = PickerItem<T>(children: <PickerItem<T>>[]);
      data.add(item);

      for (int j = 0; j < lv.length; j++) {
        var o = lv[j];
        if (o is T) {
          item.children!.add(PickerItem<T>(value: o));
        } else if (T == String) {
          String _v = o.toString();
          item.children!.add(PickerItem<T>(value: _v as T));
        }
      }
    }
    // if (__printDebug) print("data.length: ${data.length}");
  }

  _parsePickerDataItem(List? pickerData, List<PickerItem> data) {
    if (pickerData == null) return;
    var len = pickerData.length;
    for (int i = 0; i < len; i++) {
      var item = pickerData[i];
      if (item is T) {
        data.add(new PickerItem<T>(value: item));
      } else if (item is Map) {
        final Map map = item;
        if (map.length == 0) continue;

        List<T> _mapList = map.keys.toList().cast();
        for (int j = 0; j < _mapList.length; j++) {
          var _o = map[_mapList[j]];
          if (_o is List && _o.length > 0) {
            List<PickerItem<T>> _children = <PickerItem<T>>[];
            //print('add: ${data.runtimeType.toString()}');
            data.add(PickerItem<T>(value: _mapList[j], children: _children));
            _parsePickerDataItem(_o, _children);
          }
        }
      } else if (T == String && !(item is List)) {
        String _v = item.toString();
        //print('add: $_v');
        data.add(PickerItem<T>(value: _v as T));
      }
    }
  }

  void setColumn(int index) {
    if (_datas != null && _col == index + 1) return;
    _col = index + 1;
    if (isArray) {
      // if (__printDebug) print("index: $index");
      if (_col < data.length)
        _datas = data[_col].children;
      else
        _datas = null;
      return;
    }
    if (index < 0) {
      _datas = data;
    } else {
      _datas = data;
      // 列数过多会有性能问题
      for (int i = 0; i <= index; i++) {
        var j = picker!.selecteds[i];
        if (_datas != null && _datas!.length > j)
          _datas = _datas![j].children;
        else {
          _datas = null;
          break;
        }
      }
    }
  }

  @override
  int getLength() => _datas?.length ?? 0;

  @override
  getMaxLevel() {
    if (_maxLevel == -1) _checkPickerDataLevel(data, 1);
    return _maxLevel;
  }

  @override
  Widget buildItem(BuildContext context, int index) {
    final PickerItem item = _datas![index];
    final isSel = index == picker!.selecteds[_col];
    if (item.text != null) {
      return isSel && picker!.selectedTextStyle != null
          ? DefaultTextStyle(
          style: picker!.selectedTextStyle!,
          child: picker!.selectedIconTheme != null
              ? IconTheme(
            data: picker!.selectedIconTheme!,
            child: item.text!,
          )
              : item.text!)
          : item.text!;
    }
    return makeText(
        item.text, item.text != null ? null : item.value.toString(), isSel);
  }

  @override
  void initSelects() {
    // ignore: unnecessary_null_comparison
    if (picker!.selecteds == null) picker!.selecteds = <int>[];
    if (picker!.selecteds.length == 0) {
      for (int i = 0; i < _maxLevel; i++) picker!.selecteds.add(0);
    }
  }

  @override
  List<T> getSelectedValues() {
    List<T> _items = [];
    var _sLen = picker!.selecteds.length;
    if (isArray) {
      for (int i = 0; i < _sLen; i++) {
        int j = picker!.selecteds[i];
        if (j < 0 || data[i].children == null || j >= data[i].children!.length)
          break;
        _items.add(data[i].children![j].value!);
      }
    } else {
      List<PickerItem<dynamic>>? datas = data;
      for (int i = 0; i < _sLen; i++) {
        int j = picker!.selecteds[i];
        if (j < 0 || j >= datas!.length) break;
        _items.add(datas[j].value);
        datas = datas[j].children;
        if (datas == null || datas.length == 0) break;
      }
    }
    return _items;
  }

  _checkPickerDataLevel(List<PickerItem>? data, int level) {
    if (data == null) return;
    if (isArray) {
      _maxLevel = data.length;
      return;
    }
    for (int i = 0; i < data.length; i++) {
      if (data[i].children != null && data[i].children!.length > 0)
        _checkPickerDataLevel(data[i].children, level + 1);
    }
    if (_maxLevel < level) _maxLevel = level;
  }
}

class NumberPickerColumn {
  final List<int>? items;
  final int begin;
  final int end;
  final int? initValue;
  final int columnFlex;
  final int jump;
  final Widget? postfix, suffix;
  final PickerValueFormat<int>? onFormatValue;

  const NumberPickerColumn({
    this.begin = 0,
    this.end = 9,
    this.items,
    this.initValue,
    this.jump = 1,
    this.columnFlex = 1,
    this.postfix,
    this.suffix,
    this.onFormatValue,
  });

  int indexOf(int? value) {
    if (value == null) return -1;
    if (items != null) return items!.indexOf(value);
    if (value < begin || value > end) return -1;
    return (value - begin) ~/ (this.jump == 0 ? 1 : this.jump);
  }

  int valueOf(int index) {
    if (items != null) {
      return items![index];
    }
    return begin + index * (this.jump == 0 ? 1 : this.jump);
  }

  String getValueText(int index) {
    return onFormatValue == null
        ? "${valueOf(index)}"
        : onFormatValue!(valueOf(index));
  }

  int count() {
    var v = (end - begin) ~/ (this.jump == 0 ? 1 : this.jump) + 1;
    if (v < 1) return 0;
    return v;
  }
}

class NumberPickerAdapter extends PickerAdapter<int> {
  NumberPickerAdapter({required this.data});

  final List<NumberPickerColumn> data;
  NumberPickerColumn? cur;
  int _col = 0;

  @override
  int getLength() {
    if (cur == null) return 0;
    if (cur!.items != null) return cur!.items!.length;
    return cur!.count();
  }

  @override
  int getMaxLevel() => data.length;

  @override
  bool getIsLinkage() {
    return false;
  }

  @override
  void setColumn(int index) {
    if (index != -1 && _col == index + 1) return;
    _col = index + 1;
    if (_col >= data.length) {
      cur = null;
    } else {
      cur = data[_col];
    }
  }

  @override
  void initSelects() {
    int _maxLevel = getMaxLevel();
    // ignore: unnecessary_null_comparison
    if (picker!.selecteds == null) picker!.selecteds = <int>[];
    if (picker!.selecteds.length == 0) {
      for (int i = 0; i < _maxLevel; i++) {
        int v = data[i].indexOf(data[i].initValue);
        if (v < 0) v = 0;
        picker!.selecteds.add(v);
      }
    }
  }

  @override
  Widget buildItem(BuildContext context, int index) {
    if (cur!.postfix == null && cur!.suffix == null)
      return makeText(
          null, cur!.getValueText(index), index == picker!.selecteds[_col]);
    else
      return makeTextEx(null, cur!.getValueText(index), cur!.postfix,
          cur!.suffix, index == picker!.selecteds[_col]);
  }

  @override
  int getColumnFlex(int column) {
    return data[column].columnFlex;
  }

  @override
  List<int> getSelectedValues() {
    List<int> _items = [];
    for (int i = 0; i < picker!.selecteds.length; i++) {
      int j = picker!.selecteds[i];
      int v = data[i].valueOf(j);
      _items.add(v);
    }
    return _items;
  }
}

class DateTimePickerAdapter extends PickerAdapter<DateTime> {
  /// display type, ref: columnType
  final int type;

  /// Whether to display the month in numerical form.If true, months is not used.
  final bool isNumberMonth;

  /// custom months strings
  final List<String>? months;

  /// Custom AM, PM strings
  final List<String>? strAMPM;

  /// year begin...end.
  final int? yearBegin, yearEnd;

  /// hour min ... max, min >= 0, max <= 23, max > min
  final int? minHour, maxHour;

  /// minimum datetime
  final DateTime? minValue, maxValue;

  /// jump minutes, user could select time in intervals of 30min, 5mins, etc....
  final int? minuteInterval;

  /// Year, month, day suffix
  final String? yearSuffix,
      monthSuffix,
      daySuffix,
      hourSuffix,
      minuteSuffix,
      secondSuffix;

  /// use two-digit year, 2019, displayed as 19
  final bool twoDigitYear;

  /// year 0, month 1, day 2, hour 3, minute 4, sec 5, am/pm 6, hour-ap: 7
  final List<int>? customColumnType;

  static const List<String> MonthsList_EN = const [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  static const List<String> MonthsList_EN_L = const [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  DateTimePickerAdapter({
    ZSPicker? picker,
    this.type = 0,
    this.isNumberMonth = false,
    this.months = MonthsList_EN,
    this.strAMPM,
    this.yearBegin = 1900,
    this.yearEnd = 2100,
    this.value,
    this.minValue,
    this.maxValue,
    this.minHour,
    this.maxHour,
    this.secondSuffix,
    this.minuteSuffix,
    this.hourSuffix,
    this.yearSuffix,
    this.monthSuffix,
    this.daySuffix,
    this.minuteInterval,
    this.customColumnType,
    this.twoDigitYear = false,
  }) : assert(minuteInterval == null ||
      (minuteInterval >= 1 &&
          minuteInterval <= 30 &&
          (60 % minuteInterval == 0))) {
    super.picker = picker;
    _yearBegin = yearBegin ?? 0;
    if (minValue != null && minValue!.year > _yearBegin) {
      _yearBegin = minValue!.year;
    }
    // Judge whether the day is in front of the month
    // If in the front, set "needUpdatePrev" = true
    List<int> _columnType;
    if (customColumnType != null)
      _columnType = customColumnType!;
    else
      _columnType = columnType[type];
    var month = _columnType.indexWhere((element) => element == 1);
    var day = _columnType.indexWhere((element) => element == 2);
    _needUpdatePrev =
        day < month || day < _columnType.indexWhere((element) => element == 0);
    if (!_needUpdatePrev) {
      // check am/pm before hour-ap
      var ap = _columnType.indexWhere((element) => element == 6);
      if (ap > _columnType.indexWhere((element) => element == 7)) {
        _apBeforeHourAp = true;
        _needUpdatePrev = true;
      }
    }
    if (value == null) {
      value = DateTime.now();
      _verificationMinMaxValue();
    }
  }

  int _col = 0;
  int _colAP = -1;
  int _colHour = -1;
  int _colDay = -1;
  int _yearBegin = 0;
  bool _needUpdatePrev = false;
  bool _apBeforeHourAp = false;

  /// Currently selected value
  DateTime? value;

  // but it can improve the performance, so keep it.
  static const List<List<int>> lengths = const [
    [12, 31, 0],
    [24, 60],
    [24, 60, 60],
    [12, 60, 2],
    [12, 31, 0, 24, 60],
    [12, 31, 0, 12, 60, 2],
    [12, 31, 0, 24, 60, 60],
    [0, 12, 31],
    [0, 12, 31, 24, 60],
    [0, 12, 31, 24, 60, 60],
    [0, 12, 31, 2, 12, 60],
    [0, 12],
    [31, 12, 0],
    [0],
  ];

  static const Map<int, int> columnTypeLength = {
    0: 0,
    1: 12,
    2: 31,
    3: 24,
    4: 60,
    5: 60,
    6: 2,
    7: 12
  };

  /// year 0, month 1, day 2, hour 3, minute 4, sec 5, am/pm 6, hour-ap: 7
  static const List<List<int>> columnType = const [
    [1, 2, 0],
    [3, 4],
    [3, 4, 5],
    [7, 4, 6],
    [1, 2, 0, 3, 4],
    [1, 2, 0, 7, 4, 6],
    [1, 2, 0, 3, 4, 5],
    [0, 1, 2],
    [0, 1, 2, 3, 4],
    [0, 1, 2, 3, 4, 5],
    [0, 1, 2, 6, 7, 4],
    [0, 1],
    [2, 1, 0],
    [0],
  ];

  // static const List<int> leapYearMonths = const <int>[1, 3, 5, 7, 8, 10, 12];

  // 获取当前列的类型
  int getColumnType(int index) {
    if (customColumnType != null) return customColumnType![index];
    List<int> items = columnType[type];
    if (index >= items.length) return -1;
    return items[index];
  }

  @override
  int getLength() {
    int v = (customColumnType == null
        ? lengths[type][_col]
        : columnTypeLength[customColumnType![_col]])!;
    if (v == 0) {
      int ye = yearEnd!;
      if (maxValue != null) ye = maxValue!.year;
      return ye - _yearBegin + 1;
    }
    if (v == 31) return _calcDateCount(value!.year, value!.month);
    int _type = getColumnType(_col);
    switch (_type) {
      case 3: // hour
        if ((minHour != null && minHour! >= 0) ||
            (maxHour != null && maxHour! <= 23))
          return (maxHour ?? 23) - (minHour ?? 0) + 1;
        break;
      case 4: // minute
        if (minuteInterval != null && minuteInterval! > 1)
          return v ~/ minuteInterval!;
        break;
      case 7: // hour am/pm
        if ((minHour != null && minHour! >= 0) ||
            (maxHour != null && maxHour! <= 23)) if (_colAP < 0) {
          // I don't know am or PM
          return 12;
        } else {
          var _min = 0;
          var _max = 0;
          if (picker!.selecteds[_colAP] == 0) {
            // am
            _min = minHour == null
                ? 1
                : minHour! >= 12
                ? 12
                : minHour! + 1;
            _max = maxHour == null
                ? 12
                : maxHour! >= 12
                ? 12
                : maxHour! + 1;
          } else {
            // pm
            _min = minHour == null
                ? 1
                : minHour! >= 12
                ? 24 - minHour! - 12
                : 1;
            _max = maxHour == null
                ? 12
                : maxHour! >= 12
                ? maxHour! - 12
                : 1;
          }
          return _max > _min ? _max - _min + 1 : _min - _max + 1;
        }
        break;
    }
    return v;
  }

  @override
  int getMaxLevel() {
    return customColumnType == null
        ? lengths[type].length
        : customColumnType!.length;
  }

  @override
  bool needUpdatePrev(int curIndex) {
    if (_needUpdatePrev) {
      if (value?.month == 2) {
        // Only February needs to be dealt with
        var _curType = getColumnType(curIndex);
        return _curType == 1 || _curType == 0;
      } else if (_apBeforeHourAp) {
        return getColumnType(curIndex) == 6;
      }
    }
    return false;
  }

  @override
  void setColumn(int index) {
    //print("setColumn index: $index");
    _col = index + 1;
    if (_col < 0) _col = 0;
  }

  @override
  void initSelects() {
    _colAP = _getAPColIndex();
    int _maxLevel = getMaxLevel();
    // ignore: unnecessary_null_comparison
    if (picker!.selecteds == null) picker!.selecteds = <int>[];
    if (picker!.selecteds.length == 0) {
      for (int i = 0; i < _maxLevel; i++) picker!.selecteds.add(0);
    }
  }

  @override
  Widget buildItem(BuildContext context, int index) {
    String _text = "";
    int colType = getColumnType(_col);
    switch (colType) {
      case 0:
        if (twoDigitYear) {
          _text = "${_yearBegin + index}";
          var _l = _text.length;
          _text =
          "${_text.substring(_l - (_l - 2), _l)}${_checkStr(yearSuffix)}";
        } else
          _text = "${_yearBegin + index}${_checkStr(yearSuffix)}";
        break;
      case 1:
        if (isNumberMonth) {
          _text = "${index + 1}${_checkStr(monthSuffix)}";
        } else {
          if (months != null)
            _text = "${months![index]}";
          else {
            List _months =
            [
              "Jan",
              "Feb",
              "Mar",
              "Apr",
              "May",
              "Jun",
              "Jul",
              "Aug",
              "Sep",
              "Oct",
              "Nov",
              "Dec"
            ];
            _text = "${_months[index]}";
          }
        }
        break;
      case 2:
        _text = "${index + 1}${_checkStr(daySuffix)}";
        break;
      case 3:
        _text = "${intToStr(index + (minHour ?? 0))}${_checkStr(hourSuffix)}";
        break;
      case 5:
        _text = "${intToStr(index)}${_checkStr(secondSuffix)}";
        break;
      case 4:
        if (minuteInterval == null || minuteInterval! < 2)
          _text = "${intToStr(index)}${_checkStr(minuteSuffix)}";
        else
          _text =
          "${intToStr(index * minuteInterval!)}${_checkStr(minuteSuffix)}";
        break;
      case 6:
        List? _ampm = strAMPM ?? ['AM', 'PM'];
        if (_ampm == null) _ampm = const ['AM', 'PM'];
        _text = "${_ampm[index]}";
        break;
      case 7:
        _text =
        "${intToStr(index + (minHour == null ? 0 : (picker!.selecteds[_colAP] == 0 ? minHour! : 0)) + 1)}";
        break;
    }

    return makeText(null, _text, picker!.selecteds[_col] == index);
  }

  @override
  String getText() {
    return value.toString();
  }

  @override
  int getColumnFlex(int column) {
    if (picker!.columnFlex != null && column < picker!.columnFlex!.length)
      return picker!.columnFlex![column];
    if (getColumnType(column) == 0) return 3;
    return 2;
  }

  @override
  void doShow() {
    if (_yearBegin == 0) getLength();
    var _maxLevel = getMaxLevel();
    for (int i = 0; i < _maxLevel; i++) {
      int colType = getColumnType(i);
      switch (colType) {
        case 0:
          picker!.selecteds[i] = yearEnd != null && value!.year > yearEnd!
              ? yearEnd! - _yearBegin
              : value!.year - _yearBegin;
          break;
        case 1:
          picker!.selecteds[i] = value!.month - 1;
          break;
        case 2:
          picker!.selecteds[i] = value!.day - 1;
          break;
        case 3:
          var h = value!.hour;
          if ((minHour != null && minHour! >= 0) ||
              (maxHour != null && maxHour! <= 23)) {
            if (minHour != null) {
              h = h > minHour! ? h - minHour! : 0;
            } else {
              h = (maxHour ?? 23) - (minHour ?? 0) + 1;
            }
          }
          picker!.selecteds[i] = h;
          break;
        case 4:
          if (minuteInterval == null || minuteInterval! < 2) {
            picker!.selecteds[i] = value!.minute;
          } else {
            picker!.selecteds[i] = value!.minute ~/ minuteInterval!;
            final m = picker!.selecteds[i] * minuteInterval!;
            if (m != value!.minute) {
              // 需要更新 value
              var s = value!.second;
              if (type != 2 && type != 6) s = 0;
              value = DateTime(
                  value!.year, value!.month, value!.day, value!.hour, m, s);
            }
          }
          break;
        case 5:
          picker!.selecteds[i] = value!.second;
          break;
        case 6:
          picker!.selecteds[i] = (value!.hour > 12 || value!.hour == 0) ? 1 : 0;
          break;
        case 7:
          picker!.selecteds[i] = value!.hour == 0
              ? 11
              : (value!.hour > 12)
              ? value!.hour - 12 - 1
              : value!.hour - 1;
          break;
      }
    }
  }

  @override
  void doSelect(int column, int index) {
    int year, month, day, h, m, s;
    year = value!.year;
    month = value!.month;
    day = value!.day;
    h = value!.hour;
    m = value!.minute;
    s = value!.second;
    if (type != 2 && type != 6) s = 0;

    int colType = getColumnType(column);
    switch (colType) {
      case 0:
        year = _yearBegin + index;
        break;
      case 1:
        month = index + 1;
        break;
      case 2:
        day = index + 1;
        break;
      case 3:
        h = index + (minHour ?? 0);
        break;
      case 4:
        m = (minuteInterval == null || minuteInterval! < 2)
            ? index
            : index * minuteInterval!;
        break;
      case 5:
        s = index;
        break;
      case 6:
        if (picker!.selecteds[_colAP] == 0) {
          if (h == 0) h = 12;
          if (h > 12) h = h - 12;
        } else {
          if (h < 12) h = h + 12;
          if (h == 12) h = 0;
        }
        if (minHour != null || maxHour != null) {
          if (minHour != null && _colHour >= 0) {
            if (h < minHour!) {
              picker!.selecteds[_colHour] = 0;
              picker!.updateColumn(_colHour);
              return;
            }
          }
          if (maxHour != null && h > maxHour!) h = maxHour!;
        }
        break;
      case 7:
        h = index +
            (minHour == null
                ? 0
                : (picker!.selecteds[_colAP] == 0 ? minHour! : 0)) +
            1;
        if (_colAP >= 0 && picker!.selecteds[_colAP] == 1) h = h + 12;
        if (h > 23) h = 0;
        break;
    }
    int __day = _calcDateCount(year, month);

    bool _isChangeDay = false;
    if (day > __day) {
      day = __day;
      _isChangeDay = true;
    }
    value = DateTime(year, month, day, h, m, s);

    if (_verificationMinMaxValue()) {
      notifyDataChanged();
    } else if (_isChangeDay && _colDay >= 0) {
      doShow();
      picker!.updateColumn(_colDay);
    }
  }

  bool _verificationMinMaxValue() {
    if (minValue != null &&
        (value!.millisecondsSinceEpoch < minValue!.millisecondsSinceEpoch)) {
      value = minValue;
      return true;
    } else if (maxValue != null &&
        value!.millisecondsSinceEpoch > maxValue!.millisecondsSinceEpoch) {
      value = maxValue;
      return true;
    }
    return false;
  }

  int _getAPColIndex() {
    List<int> items = customColumnType ?? columnType[type];
    _colHour = items.indexWhere((e) => e == 7);
    _colDay = items.indexWhere((e) => e == 2);
    for (int i = 0; i < items.length; i++) {
      if (items[i] == 6) return i;
    }
    return -1;
  }

  int _calcDateCount(int year, int month) {
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      case 2:
        {
          if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
            return 29;
          }
          return 28;
        }
    }
    return 30;
  }

  String intToStr(int v) {
    return (v < 10) ? "0$v" : "$v";
  }

  String _checkStr(String? v) {
    return v == null ? "" : v;
  }
}