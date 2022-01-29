import 'package:drm_player2/home.dart';
import 'package:drm_player2/players/fairplay.dart';
import 'package:drm_player2/players/playready.dart';
import 'package:drm_player2/players/widevine.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        '/': (context) => Home(),
        '/widevine': (context) => WidevinePlayer(),
        '/fairplay': (context) => FairplayPlayer(),
        '/playready': (context) => PlayreadyPlayer(),
      },
    );
  }
}
