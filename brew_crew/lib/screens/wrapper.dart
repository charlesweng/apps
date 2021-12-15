import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  var logger = Logger(
    printer: PrettyPrinter()
  );
  @override
  Widget build(BuildContext build) {
    final brewCrewUser = Provider.of<BrewCrewUser?>(build);
    if (brewCrewUser == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}