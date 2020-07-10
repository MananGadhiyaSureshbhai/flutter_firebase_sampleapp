import 'package:Crew_Coffee/screens/home/setting_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Crew_Coffee/servies/auth.dart';
import 'package:provider/provider.dart';
import 'package:Crew_Coffee/servies/database.dart';

import 'package:Crew_Coffee/screens/home/Coffer_list.dart';
import 'package:Crew_Coffee/modals/brew.dart';

class Home extends StatelessWidget {
  final Authservice _authservice = Authservice();
  @override
  Widget build(BuildContext context) {
    void showsettingpannel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: Settingform(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: Databaseservices().coffeedata,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Coffee"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  _authservice.SignOut();
                },
                icon: Icon(Icons.person),
                label: Text("Logout")),
            FlatButton.icon(
                onPressed: () {
                  showsettingpannel();
                },
                icon: Icon(Icons.settings),
                label: Text("Settings"))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/coffee_background.png'),
                    fit: BoxFit.cover)),
            child: Coffeelist()),
      ),
    );
  }
}
