import 'package:bmi_calculator/widget/base_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'conts.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: Text(
                "Your Result",
                textAlign: TextAlign.end,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
              )),
          Expanded(
            flex: 2,
            child: BaseCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'NORMAL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF22E67B),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '26.7',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 65, fontWeight: FontWeight.w800),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Normal BMI range:',
                        textAlign: TextAlign.center,
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '18,5 - 25 kg/m2',
                        textAlign: TextAlign.center,
                        style: kLabelTextActiveStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "RE-CALCULATE",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(fontSize: 24.0, letterSpacing: 2.5),
              ),
              margin: EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              height: 60.0,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
