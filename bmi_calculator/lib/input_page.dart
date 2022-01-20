import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/bmi_args.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ReusableCard(
                    onSelected: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? DEFAULT_REUSABLE_CARD_COLOR
                        : DEFAULT_INACTIVE_REUSABLE_CARD_COLOR,
                    cardChild: IconContent(
                      gender: "MALE",
                      iconData: FontAwesomeIcons.mars,
                    )),
              ),
              Expanded(
                child: ReusableCard(
                  onSelected: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? DEFAULT_REUSABLE_CARD_COLOR
                      : DEFAULT_INACTIVE_REUSABLE_CARD_COLOR,
                  cardChild: IconContent(
                    gender: "FEMALE",
                    iconData: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: DEFAULT_REUSABLE_CARD_COLOR,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('HEIGHT',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(height.toString(), style: HUGE_LABEL_TEXT_STYLE),
                      Text("cm", style: LABEL_TEXT_STYLE),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: LABEL_TEXT_STYLE.color,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbColor: PINK_BUTTON_COLOR,
                    ),
                    child: Slider(
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: LABEL_TEXT_STYLE),
                    Text(weight.toString(), style: HUGE_LABEL_TEXT_STYLE),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              this.setState(() {
                                weight++;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            this.setState(() {
                              weight--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: LABEL_TEXT_STYLE),
                    Text(
                      age.toString(),
                      style: HUGE_LABEL_TEXT_STYLE,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              this.setState(() {
                                age++;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            this.setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          GestureDetector(
            onTap: () {
              BMI calculator = BMI(weight: weight, height: height);
              calculator.calculate();
              Navigator.pushNamed(context, '/results',
                  arguments: BMIArguments(
                      bmi: calculator.getBmi,
                      status: calculator.getStatus(),
                      action: calculator.getAction()));
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              color: PINK_BUTTON_COLOR,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: BOTTOM_CONTAINER_HEIGHT,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      disabledElevation: 6.0,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final String gender;
  final IconData iconData;

  IconContent({@required this.gender, @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: LABEL_TEXT_STYLE,
        ),
      ],
    );
  }
}
