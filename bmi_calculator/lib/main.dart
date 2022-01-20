import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  final ThemeData theme = ThemeData(//.dark().copyWith(
    primaryColor: Color(0xFF0A0E21),
    scaffoldBackgroundColor: Color(0xFF0A0E21),
    primarySwatch: MaterialColor(0xFF0A0E21, {
      50: const Color(0xFF0A0E21),
      100: const Color(0xFF0A0E21),
      200: const Color(0xFF0A0E21),
      300: const Color(0xFF0A0E21),
      400: const Color(0xFF0A0E21),
      500: const Color(0xFF0A0E21),
      600: const Color(0xFF0A0E21),
      700: const Color(0xFF0A0E21),
      800: const Color(0xFF0A0E21),
      900: const Color(0xFF0A0E21),
    }),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xFFFFFFFF)),
        bodyText2: TextStyle(color: Color(0xFFFFFFFF))),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Color(0xFF0A0E21)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      }
    );
  }
}

