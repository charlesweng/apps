import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignIn extends StatefulWidget {
  
  final Function toggleView;

  SignIn({ required this.toggleView });

  @override
  _SignInState createState() => _SignInState();
  
}

class _SignInState extends State<SignIn> {
  
  var logger = Logger(
    printer: PrettyPrinter()
  );
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.brown[800]
            ),
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Register'))
        ],
        ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 300.0),
                    child: TextFormField(
                      decoration:textInputDecoration.copyWith(hintText: 'Email'),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Container(
                constraints: BoxConstraints(maxWidth: 300.0),
                child: TextFormField(
                  validator: (val) => val!.length < 6 ? 'Enter a password 6+ characters long' : null, 
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
                child: const Text(
                    'Sign In', 
                    style: TextStyle(color: Colors.white),
                  ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signIn(email, password);
                    if (result == null) {
                      setState(() { 
                        error ='user must enter a valid email and password';
                        loading = false;
                        });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0)
              ),
            ],
            ),
          ),
        ),
    );
  }
}