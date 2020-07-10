import 'package:flutter/material.dart';
import 'package:Crew_Coffee/servies/auth.dart';
import 'package:Crew_Coffee/shared/constant.dart';
import 'package:Crew_Coffee/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  SignIn({this.toggleview});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  final formkey = GlobalKey<FormState>();
  String mail = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: (Text("Sign In")),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => widget.toggleview(),
                    icon: Icon(Icons.person),
                    label: Text("Register"))
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
                              dynamic result = await _auth.signInemailpassword(
                                  mail, password);
                              print("valid");
                              print(password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      "Could Not Sign In .Check Credential ";
                                  loading = false;
                                });
                              }
                            }
                            print(mail);
                            print(password);
                          },
                          color: Colors.black,
                          child: Text("Sign In",
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
                          child: Text("Don't have account,Register here?",
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
  }
}
