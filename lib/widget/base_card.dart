import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function onTap;

  BaseCard({this.cardColor, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
