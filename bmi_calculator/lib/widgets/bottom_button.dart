  import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

  class BottomButton extends StatelessWidget {
    final String text;
    // final String route;
    final Function onTap;
    // final int weight;
    // final int height;

    BottomButton({ this.text, this.onTap });

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
          onTap: onTap,
          child: Container(
            child: Center(
              child: Text(
                text,
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
        );
    }
  }