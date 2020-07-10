import 'package:flutter/material.dart';
import 'package:Crew_Coffee/servies/auth.dart';
import 'package:Crew_Coffee/screens/authentication/sign_in.dart';
import 'package:Crew_Coffee/shared/constant.dart';
import 'package:Crew_Coffee/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({this.toggleview});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Authservice _auth = Authservice();
  final formkey = GlobalKey<FormState>();
  String mail = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: (Text("Register")),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => widget.toggleview(),
                    icon: Icon(Icons.person),
                    label: Text("Sign In"))
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              inputtextdecoration.copyWith(hintText: "Email"),
                          validator: (val) =>
                              val.isEmpty ? 'Enter email' : null,
                          onChanged: (val) {
                            setState(() {
                              mail = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: inputtextdecoration.copyWith(
                              hintText: "Password"),
                          validator: (val) =>
                              val.length < 6 ? 'Enter password long' : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (formkey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.Registeremailpassword(
                                      mail, password);
                              print(mail);
                              print(password);
                              if (result == null) {
                                setState(() {
                                  error = "Please give valid Mail.";
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.black,
                          child: Text("Register",
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, "myRoute");
                            widget.toggleview();
                          },
                          child: Text("Click Here For Sign In",
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(error,
                            style: TextStyle(color: Colors.red, fontSize: 14)),
                      ],
                    ),
                  )),
            ),
          );
    ;
  }
}
