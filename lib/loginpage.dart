import 'package:calendarly/calendar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'authentication.dart';
import 'dart:math' as math;

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity, //spans the entire width of the screen
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue[900],
          Colors.blue[700],
          Colors.blue[500],
          Colors.blue[300]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome to Calendarly!",
                    style: GoogleFonts.breeSerif(
                        fontSize: 40, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Sign In",
                      style: GoogleFonts.breeSerif(
                          fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 10,
                  ),
                  //Icon(Icons.calendar_today, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 2))
                            ]),
                        height: 60.0,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 30.0),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.white),
                              hintText: "Enter your email",
                              hintStyle:
                                  GoogleFonts.breeSerif(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 2))
                            ]),
                        height: 60.0,
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 30.0),
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              hintText: "Password",
                              hintStyle:
                                  GoogleFonts.breeSerif(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0)),
                          color: Colors.blue,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Sign into My Account",
                                  style: GoogleFonts.breeSerif(
                                      color: Colors.white, fontSize: 18.0))),
                          onPressed: null),
                      SignInButtonBuilder(
                        text: "Sign up with Email",
                        textColor: Colors.white,
                        icon: Icons.mail,
                        onPressed: () {},
                        backgroundColor: Colors.grey,
                        fontSize: 18.0,
                      ),
                      SignInButton(Buttons.Google,
                          text: "Sign up with Google", onPressed: () {})
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
