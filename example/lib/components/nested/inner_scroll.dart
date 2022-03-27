import 'package:flutter/material.dart';

class NestedInnerScrollWidget extends StatefulWidget {
  const NestedInnerScrollWidget(this.child);
  final Widget child;
  // NestedInnerScrollWidget({Key? key, required this.child}) : super(key: key);

  static State? of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  @override
  _NestedInnerScrollWidgetState createState() => _NestedInnerScrollWidgetState();
}

class _NestedInnerScrollWidgetState extends State<NestedInnerScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
