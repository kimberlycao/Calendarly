import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome to Calendarly',
            style: GoogleFonts.breeSerif(fontSize: 22.0, color: Colors.white)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              color: Colors.blue,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sign in with Google",
                      style: GoogleFonts.breeSerif(
                          color: Colors.white, fontSize: 20.0))),
              onPressed: null)
        ],
      )),
    );
  }
}
