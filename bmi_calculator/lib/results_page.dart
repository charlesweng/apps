import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/bmi_args.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                "Your Result",
                style: HUGE_LABEL_TEXT_STYLE,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
            color: DEFAULT_REUSABLE_CARD_COLOR,
            cardChild: Column(
              children: [
                Text(
                  args?.status ?? "Unknown BMI Status.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(40, 191, 156, 100.0),
                    fontWeight: FontWeight.w900,
                    fontSize: 25.0
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
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          )),
          SizedBox(
            height: 8.0,
          ),
          BottomButton(text: "RE-CALCULATE", onTap: () {
              Navigator.pushNamed(context, '/');
            },)
        ],
      ),
    );
  }
}
