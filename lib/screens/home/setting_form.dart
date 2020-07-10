import 'package:Crew_Coffee/modals/user.dart';
import 'package:Crew_Coffee/servies/database.dart';
import 'package:Crew_Coffee/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:Crew_Coffee/shared/constant.dart';
import 'package:provider/provider.dart';

class Settingform extends StatefulWidget {
  @override
  _SettingformState createState() => _SettingformState();
}

class _SettingformState extends State<Settingform> {
  final formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];
  String currname;
  String currsugar;
  int currstrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Userdata>(
        stream: Databaseservices(uid: user.uid).userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Userdata userdata = snapshot.data;
            return Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Update Setting",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: userdata.name,
                      decoration: inputtextdecoration,
                      validator: (val) => val.isEmpty ? 'Enter Name' : null,
                      onChanged: (val) {
                        setState(() {
                          currname = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        decoration: inputtextdecoration,
                        value: currsugar ?? userdata.sugars,
                        items: sugars.map((e) {
                          return DropdownMenuItem(
                            child: Text('$e Sugars'),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (e) {
                          setState(() {
                            currsugar = e;
                          });
                        }),
                    Slider(
                        value: (currstrength ?? 100).toDouble(),
                        activeColor:
                            Colors.brown[currstrength ?? userdata.strength],
                        inactiveColor:
                            Colors.brown[currstrength ?? userdata.strength],
                        min: 100,
                        max: 900,
                        divisions: 8,
                        onChanged: (e) {
                          setState(() {
                            currstrength = e.round();
                          });
                        }),
                    RaisedButton(
                        color: Colors.black,
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (formkey.currentState.validate()) {
                            await Databaseservices(uid: user.uid)
                                .updateUserdata(
                                    currsugar ?? userdata.sugars,
                                    currname ?? userdata.name,
                                    currstrength ?? userdata.strength);
                            Navigator.pop(context);
                          }
                          //  print(currname);
                          //print(currstrength);
                          //print(currsugar);
                        })
                  ],
                ));
          } else {
            return Loading();
          }
        });
  }
}
