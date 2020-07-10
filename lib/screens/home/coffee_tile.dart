import 'dart:math';

import 'package:flutter/material.dart';
import 'package:Crew_Coffee/modals/brew.dart';

class Cofftile extends StatelessWidget {
  @override
  final Brew coffee;
  Cofftile({this.coffee});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            radius: 25,
            backgroundColor: Colors.brown[coffee.strength],
          ),
          title: Text(coffee.name),
          subtitle: Text('Takes ${coffee.sugars} Sugaes'),
        ),
      ),
    );
  }
}
