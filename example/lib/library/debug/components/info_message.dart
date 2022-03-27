import 'package:flutter/material.dart';
import 'package:zs_design_flutter/zs_design_flutter.dart';

class SMDebugInfoMessage extends StatefulWidget {
  final List<Widget> widgets;
  const SMDebugInfoMessage({Key? key, required this.widgets}) : super(key: key);

  @override
  _SMDebugInfoMessageState createState() => _SMDebugInfoMessageState();
}

class _SMDebugInfoMessageState extends State<SMDebugInfoMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Wrap(
        children: widget.widgets,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: ZSColors.darkShadow(), offset: Offset(0, 2), blurRadius: 6),
        ],
      ),
    );
  }
}
