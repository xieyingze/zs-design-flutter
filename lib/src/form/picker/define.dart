import 'package:flutter/material.dart';

import 'index.dart';

const bool __printDebug = false;

/// Picker confirm callback.
typedef PickerConfirmCallback = void Function(
    ZSPicker picker, List<int> selected);

/// Picker selected callback.
typedef PickerSelectedCallback = void Function(
    ZSPicker picker, int index, List<int> selected);

/// Picker confirm before callback.
typedef PickerConfirmBeforeCallback = Future<bool> Function(
    ZSPicker picker, List<int> selected);

/// Picker value format callback.
typedef PickerValueFormat<T> = String Function(T value);

/// Picker widget builder
typedef PickerWidgetBuilder = Widget Function(
    BuildContext context, Widget pickerWidget);