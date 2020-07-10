import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:Crew_Coffee/modals/brew.dart';
import 'package:Crew_Coffee/screens/home/coffee_tile.dart';

class Coffeelist extends StatefulWidget {
  @override
  _CoffeelistState createState() => _CoffeelistState();
}

class _CoffeelistState extends State<Coffeelist> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];
    brews.forEach((element) {
      print(element.name);
    });
    return ListView.builder(
      itemBuilder: (context, index) {
        return Cofftile(coffee: brews[index]);
      },
      itemCount: brews.length,
    );
  }
}
