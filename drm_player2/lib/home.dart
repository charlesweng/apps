import 'package:better_player/better_player.dart';
import 'package:drm_player2/constants.dart';
import 'package:drm_player2/players/widevine_args.dart';
import 'package:drm_player2/widgets/loading.dart';
import 'package:drm_player2/widgets/player_selection.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Image.asset("assets/elephant.png"),
            SizedBox(height: 8.0),
            Divider(
              thickness: kDividerThickness,
              color: kDividerColor,
            ),
            PlayerSelection(
              textString: "Widevine Player", 
              onTap: () {
                Navigator.pushNamed(context, '/widevine');
              }),
            PlayerSelection(
              textString: "Fairplay Player",
              onTap: () {
                Navigator.pushNamed(context, '/fairplay');
              },
            ),
            PlayerSelection(
              textString: "Playready Player",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
