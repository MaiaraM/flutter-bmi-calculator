import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/widget/base_card.dart';
import 'package:bmi_calculator/widget/icon_content.dart';
import 'package:bmi_calculator/widget/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calculator.dart';
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
  int weightData = 60;
  int ageData = 25;

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
                    active: selectGender == Gender.male,
                    cardChild: IconContent(
                      FontAwesomeIcons.male,
                      'MALE',
                      active: selectGender == Gender.male,
                    ),
                  ),
                ),
                Expanded(
                  child: BaseCard(
                    onTap: () => setState(() => selectGender = Gender.female),
                    active: selectGender == Gender.female,
                    cardChild: IconContent(
                      FontAwesomeIcons.female,
                      'FEMALE',
                      active: selectGender == Gender.female,
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
                              style: kLabelNumbertyle,
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
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          "$weightData",
                          style: kLabelNumbertyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () => setState(
                                  () => weightData > 0 ? weightData-- : ""),
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () => setState(() => weightData++),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BaseCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          "$ageData",
                          style: kLabelNumbertyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () =>
                                  setState(() => ageData > 0 ? ageData-- : ""),
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () => setState(() => ageData++),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calBain = CalculatorBrain(heightData, weightData);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calBain.caculateBMI(),
                    result: calBain.getResult(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "CALCULATE",
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
          )
        ],
      ),
    );
  }
}
