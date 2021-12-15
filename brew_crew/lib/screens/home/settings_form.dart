import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({ Key? key }) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  final logger = Logger(printer: PrettyPrinter());


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<BrewCrewUser>(context);

    return StreamBuilder<BrewCrewUserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          BrewCrewUserData? userData = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Update your brew settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userData?.name,
                  decoration: textInputDecoration,
                  validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() {
                    _currentName = val;
                  }),
                ),
                SizedBox(height: 20.0,),
                DropdownButtonFormField(
                  value: _currentSugars ?? userData?.sugars ?? '0',
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      child: Text('$sugar sugars'),
                      value: sugar,
                    );
                  }).toList(), 
                onChanged: (val) {
                  _currentSugars = val as String?;
                }),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? userData?.sugars ?? '0', 
                        _currentName ?? userData?.name ?? 'new crew member', 
                        _currentStrength ?? userData?.strength ?? 100);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Update', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Slider(
                  min: 100,
                  max: 900,
                  divisions: 8,
                  activeColor: Colors.brown[_currentStrength ?? userData?.strength ?? 100],
                  inactiveColor: Colors.brown[_currentStrength ?? userData?.strength ?? 100],
                  value: (_currentStrength ?? userData?.strength ?? 100).toDouble(),
                  onChanged: (val) {
                    setState(() {
                      _currentStrength = val.round();
                    });
                  },
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
        
      }
    );
  }
}
