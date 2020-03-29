import 'package:flutter/material.dart';

import '../conts.dart';

class IconContent extends StatelessWidget {
  final IconData iconName;
  final String label;

  IconContent(this.iconName, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 50.0,
        ),
        SizedBox(height: 20),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
