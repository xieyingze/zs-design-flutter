import 'package:flutter/material.dart';

class MBKrakenSwitchAnimation extends StatefulWidget {
  @override
  _MBKrakenSwitchAnimationState createState() => _MBKrakenSwitchAnimationState();
}

class _MBKrakenSwitchAnimationState extends State<MBKrakenSwitchAnimation> {
  IconData _actionIcon = Icons.delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: AnimatedSwitcher(
        transitionBuilder: (child, anim) {
          return ScaleTransition(child: child, scale: anim);
        },
        duration: Duration(milliseconds: 100),
        child: IconButton(
          splashRadius: 0.1,
          key: ValueKey(_actionIcon),
          icon: Icon(
            _actionIcon,
            size: 40,
          ),
          autofocus: true,
          tooltip: 'ddd',
          onPressed: () {
            setState(() {
              if (_actionIcon == Icons.delete)
                _actionIcon = Icons.done;
              else
                _actionIcon = Icons.delete;
            });
          },
        ),
      ),
    );
  }
}
