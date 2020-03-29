import 'package:flutter/material.dart';

import '../conts.dart';

class IconContent extends StatelessWidget {
  final IconData iconName;
  final String label;
  final bool active;

  IconContent(this.iconName, this.label, {this.active = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 50.0,
          color: active ? Colors.white : kIconInactiveColor,
        ),
        SizedBox(height: 20),
        Text(
          label,
          style: active ? kLabelTextActiveStyle : kLabelTextInactiveStyle,
        )
      ],
    );
  }
}
