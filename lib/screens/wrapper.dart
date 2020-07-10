import 'package:Crew_Coffee/screens/authentication/authenticate.dart';
import 'package:Crew_Coffee/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:Crew_Coffee/screens/home/home.dart';
import 'package:Crew_Coffee/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:Crew_Coffee/modals/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
