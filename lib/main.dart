import 'package:Crew_Coffee/modals/user.dart';
import 'package:Crew_Coffee/screens/wrapper.dart';
import 'package:Crew_Coffee/servies/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Crew_Coffee/modals/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
