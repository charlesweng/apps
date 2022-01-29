import 'package:drm_player2/constants.dart';
import 'package:flutter/material.dart';

class PlayerSelection extends StatelessWidget {
  final String textString;
  final Function onTap;

  PlayerSelection({required this.textString, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: onTap as void Function()?,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
            child: Text(textString),
          ),
        ),
        Divider(thickness: kDividerThickness, color: kDividerColor,),
      ],
    );
  }
}
