import 'package:bmi_calculator/conts.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPress;
  final IconData iconData;

  RoundIconButton({this.iconData, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(
        iconData,
        size: 14,
      ),
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: kButtonRoundColor,
      shape: CircleBorder(),
    );
  }
}
