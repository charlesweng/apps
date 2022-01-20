import 'package:bmi_calculator/bmi_args.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BMIArguments args = ModalRoute.of(context).settings.arguments as BMIArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(
              "Your Result",
              style: HUGE_LABEL_TEXT_STYLE,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: ReusableCard(
            color: DEFAULT_REUSABLE_CARD_COLOR,
            cardChild: Column(
              children: [
                Text(
                  args?.status ?? "Unknown BMI Status.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(40, 191, 156, 100.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(args?.bmi?.toString() ?? "NULL",
                    textAlign: TextAlign.center, style: HUGE_LABEL_TEXT_STYLE),
                Text(
                  args?.action ?? "Unknown action.",
                  textAlign: TextAlign.center,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          )),
          SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE",
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
