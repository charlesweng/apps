import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onSelected;

  ReusableCard({this.color, this.cardChild, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color ?? DEFAULT_REUSABLE_CARD_COLOR,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
