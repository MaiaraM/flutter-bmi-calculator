import 'package:bmi_calculator/widget/base_card.dart';
import 'package:bmi_calculator/widget/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'conts.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;
  int heightData = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BaseCard(
                    onTap: () => setState(() => selectGender = Gender.male),
                    cardColor: selectGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.male, 'MALE'),
                  ),
                ),
                Expanded(
                  child: BaseCard(
                    onTap: () => setState(() => selectGender = Gender.female),
                    cardColor: selectGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.female, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BaseCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              '$heightData',
                              style: TextStyle(fontSize: 35),
                            ),
                            Text(
                              ' cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kIconInactiveColor,
                            overlayColor: Color(0x25FFC107),
                            thumbColor: Color(0xFFFFC107),
                            activeTrackColor: Colors.white,
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20.0),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          ),
                          child: Slider(
                            value: heightData.toDouble(),
                            min: 130.0,
                            max: 220.0,
                            onChanged: (value) {
                              setState(() => heightData = value.round());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BaseCard(
                    cardColor: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: BaseCard(
                    cardColor: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Calculate",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  fontSize: 24.0, letterSpacing: 2.5, color: Colors.black),
            ),
            margin: EdgeInsets.only(top: 12.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            height: 60.0,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
