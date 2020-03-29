import 'package:flutter/material.dart';

import '../conts.dart';

class BaseCard extends StatelessWidget {
  final bool active;
  final Widget cardChild;
  final Function onTap;

  BaseCard({this.active = true, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: active ? kActiveCardColor : kInactiveCardColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
