import 'package:Crew_Coffee/screens/authentication/register.dart';
import 'package:Crew_Coffee/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:Crew_Coffee/screens/authentication/sign_in.dart';
import 'package:Crew_Coffee/screens/authentication/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signin = true;
  void toggle() {
    setState(() {
      signin = !signin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signin) {
      return SignIn(toggleview: toggle);
    } else {
      return Register(toggleview: toggle);
    }
  }
}
