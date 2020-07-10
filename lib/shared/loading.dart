import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:load/load.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}
/*
LoadingProvider(
      child: MaterialApp(),
    );
*/
/*
Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitRotatingCircle(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
*/
